//
//  Geometry.swift
//  MetalTessellation
//
//  Created by M.Ike on 2017/01/31.
//  Copyright © 2017年 M.Ike. All rights reserved.
//

import MetalKit

class Geometry {
    let vertexDescriptor: MTLVertexDescriptor
    let vertexCount: Int
    let vertexBuffer: MTLBuffer
    let normalizeMatrix: matrix_float4x4

    init(vertexBuffer: MTLBuffer, vertexCount: Int, vertexDescriptor: MTLVertexDescriptor, normalizeMatrix: matrix_float4x4) {
        self.vertexBuffer = vertexBuffer
        self.vertexCount = vertexCount
        self.vertexDescriptor = vertexDescriptor
        self.normalizeMatrix = normalizeMatrix
    }

    convenience init?(url: URL, device: MTLDevice, addNormalThreshold: Float? = nil) {

        let mtlVertex = MTLVertexDescriptor()
        mtlVertex.attributes[0].format = .float3
        mtlVertex.attributes[0].offset = 0
        mtlVertex.attributes[0].bufferIndex = 0
        mtlVertex.attributes[1].format = .float3
        mtlVertex.attributes[1].offset = 12
        mtlVertex.attributes[1].bufferIndex = 0
        mtlVertex.attributes[2].format = .float2
        mtlVertex.attributes[2].offset = 24
        mtlVertex.attributes[2].bufferIndex = 0
        mtlVertex.layouts[0].stride = 32
        mtlVertex.layouts[0].stepRate = 1

        let modelDescriptor = MTKModelIOVertexDescriptorFromMetal(mtlVertex)
        (modelDescriptor.attributes[0] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        (modelDescriptor.attributes[1] as! MDLVertexAttribute).name = MDLVertexAttributeNormal
        (modelDescriptor.attributes[2] as! MDLVertexAttribute).name = MDLVertexAttributeTextureCoordinate

        let asset = MDLAsset(url: url,
                vertexDescriptor: modelDescriptor,
                bufferAllocator: MTKMeshBufferAllocator(device: device))
        // 0決め打ち
        do {
            var mdlArray: NSArray?
            let _ = try MTKMesh.newMeshes(from: asset, device: device, sourceMeshes: &mdlArray)

            guard let mdl = mdlArray?[0] as? MDLMesh else {
                return nil
            }
            if let threshold = addNormalThreshold {
                mdl.addNormals(withAttributeNamed: MDLVertexAttributeNormal, creaseThreshold: threshold)
            }

            guard let geometry = Geometry(withMDLMesh: mdl, device: device) else {
                return nil
            }
            self.init(vertexBuffer: geometry.vertexBuffer,
                    vertexCount: geometry.vertexCount,
                    vertexDescriptor: geometry.vertexDescriptor,
                    normalizeMatrix: geometry.normalizeMatrix)
        } catch {
            print(error)
            return nil
        }
    }

    convenience init?(withMDLMesh mdl: MDLMesh, device: MTLDevice) {
        guard let mesh = try? MTKMesh(mesh: mdl, device: device) else {
            return nil
        }
        guard let vertex = Geometry.vertexFromMTK(mesh: mesh, device: device) else {
            return nil
        }

        self.init(vertexBuffer: vertex.buffer,
                vertexCount: vertex.count,
                vertexDescriptor: vertex.descriptor,
                normalizeMatrix: Geometry.calcNormalizeMatrix(withMdlMesh: mdl))
    }

    private static func calcNormalizeMatrix(withMdlMesh mdl: MDLMesh) -> matrix_float4x4 {
        let diff = mdl.boundingBox.maxBounds - mdl.boundingBox.minBounds
        let scale = 1.0 / max(diff.x, max(diff.y, diff.z))
        let center = (mdl.boundingBox.maxBounds + mdl.boundingBox.minBounds) / vector_float3(2)
        return matrix_multiply(Matrix.scale(x: scale, y: scale, z: scale),
                Matrix.translation(x: -center.x, y: -center.y, z: -center.z))
    }

    private static func vertexFromMTK(mesh: MTKMesh, device: MTLDevice) -> (buffer: MTLBuffer, count: Int, descriptor: MTLVertexDescriptor)? {
        //        for a in mesh.vertexDescriptor.attributes.enumerated() {
        //            let b = a.1 as! MDLVertexAttribute
        //            print("\(a.0): " + b.name + " \(b.offset) \(b.bufferIndex) \(b.format.rawValue)")
        //        }

        /*
         pos float3, normal float3, tex float2
         */
        guard let attrPosition = mesh.vertexDescriptor.attributeNamed(MDLVertexAttributePosition),
              attrPosition.format == .float3 else {
            return nil
        }

        let ofsPosition = attrPosition.offset / MemoryLayout<Float>.size
        guard let attrNormal = mesh.vertexDescriptor.attributeNamed(MDLVertexAttributeNormal),
              attrNormal.format == .float3 else {
            return nil
        }

        let ofsNormal = attrNormal.offset / MemoryLayout<Float>.size
        guard let attrTexcoord = mesh.vertexDescriptor.attributeNamed(MDLVertexAttributeTextureCoordinate),
              attrTexcoord.format == .float2 else {
            return nil
        }

        let ofsTexcoord = attrTexcoord.offset / MemoryLayout<Float>.size
        let vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)
        var buf = [Float]()
        var count = 0

        mesh.submeshes.forEach { subMesh in
            let indices: [UInt32]
            if subMesh.indexType == .uint16 {
                let pIndex = subMesh.indexBuffer.buffer.contents().assumingMemoryBound(to: UInt16.self)
                indices = UnsafeBufferPointer(start: pIndex, count: subMesh.indexCount).map {
                    UInt32($0)
                }
            } else {
                let pIndex = subMesh.indexBuffer.buffer.contents().assumingMemoryBound(to: UInt32.self)
                indices = UnsafeBufferPointer(start: pIndex, count: subMesh.indexCount).map {
                    $0
                }
            }
            count += indices.count

            let element = vertexDescriptor.layouts[0].stride / MemoryLayout<Float>.size
            let p = mesh.vertexBuffers[0].buffer.contents().assumingMemoryBound(to: Float.self)
            let data = UnsafeBufferPointer(start: p, count: mesh.vertexCount * element)

            indices.forEach {
                let i = Int($0) * element
                let pos = i + ofsPosition
                buf.append(contentsOf: data[pos..<pos + 3])
                let normal = i + ofsNormal
                buf.append(contentsOf: data[normal..<normal + 3])
                let texcoord = i + ofsTexcoord
                buf.append(contentsOf: data[texcoord..<texcoord + 2])
            }
        }

        return (buffer: device.makeBuffer(bytes: &buf, length: MemoryLayout<Float>.stride * buf.count, options: []),
                count: count,
                descriptor: vertexDescriptor)
    }

    struct Vertex {
        let position: float3
        let normal: float3
        let texcoord: float2

        static func vertexDescriptor() -> MTLVertexDescriptor {
            let vertexDescriptor = MTLVertexDescriptor()
            vertexDescriptor.attributes[0].format = .float3
            vertexDescriptor.attributes[0].offset = 0
            vertexDescriptor.attributes[0].bufferIndex = 0;
            vertexDescriptor.attributes[1].format = .float3
            vertexDescriptor.attributes[1].offset = MemoryLayout<float3>.stride
            vertexDescriptor.attributes[1].bufferIndex = 0;
            vertexDescriptor.attributes[2].format = .float2
            vertexDescriptor.attributes[2].offset = MemoryLayout<float3>.stride * 2
            vertexDescriptor.attributes[2].bufferIndex = 0;
            vertexDescriptor.layouts[0].stepRate = 1
            vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
            return vertexDescriptor
        }
    }

    static func makeWith(vertexList: [Vertex], device: MTLDevice) -> Geometry? {
        let buffer: MTLBuffer? = vertexList.withUnsafeBufferPointer {
            return device.makeBuffer(bytes: UnsafeRawPointer($0.baseAddress!),
                    length: vertexList.count * MemoryLayout<Vertex>.stride,
                    options: .storageModeShared)
        }

        guard let vertexBuffer = buffer else {
            return nil
        }
        return Geometry(vertexBuffer: vertexBuffer,
                vertexCount: vertexList.count,
                vertexDescriptor: Vertex.vertexDescriptor(),
                normalizeMatrix: matrix_identity_float4x4)
    }
}

extension Geometry {
    static func box(withDimensions dimensions: vector_float3, segments: vector_uint3, device: MTLDevice) -> Geometry? {
        let mdlMesh = MDLMesh.newBox(withDimensions: dimensions,
                segments: segments,
                geometryType: .triangles,
                inwardNormals: false,
                allocator: MTKMeshBufferAllocator(device: device))
        return Geometry(withMDLMesh: mdlMesh, device: device)
    }

    static func sphere(withRadii radii: vector_float3, segments: vector_uint2, device: MTLDevice) -> Geometry? {
        let mdlMesh = MDLMesh.newEllipsoid(withRadii: radii,
                radialSegments: Int(segments.x), verticalSegments: Int(segments.y),
                geometryType: .triangles,
                inwardNormals: false,
                hemisphere: false,
                allocator: MTKMeshBufferAllocator(device: device))
        return Geometry(withMDLMesh: mdlMesh, device: device)
    }

    static func triangle(withDimensions dimensions: vector_float3, device: MTLDevice) -> Geometry? {
        let positions: [Vertex] = [
            Vertex(position: float3(-1, -1, 0), normal: float3(0, 0, 1), texcoord: float2(0, 1)),
            Vertex(position: float3(1, -1, 0), normal: float3(0, 0, 1), texcoord: float2(1, 1)),
            Vertex(position: float3(0, 1, 0), normal: float3(0, 0, 1), texcoord: float2(0.5, 0)),
        ]

        let list = positions.map {
            Vertex(position: $0.position * dimensions, normal: $0.normal, texcoord: $0.texcoord)
        }

        return Geometry.makeWith(vertexList: list, device: device)
    }
}

struct FileMesh: MeshObject {
    let fileURL: URL

    let vertexFunctionName: String
    let fragmentFunctionName: String
    let diffuseTextureURL: URL
    let normalMapURL: URL?
    let setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?

    func makeGeometry(renderer: Renderer) -> Geometry? {
        return Geometry(url: fileURL, device: renderer.device)
    }

    static func meshLambert(fileURL: URL, diffuseTextureURL: URL,
                            setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?) -> FileMesh {
        return FileMesh(fileURL: fileURL,
                vertexFunctionName: "lambertVertex",
                fragmentFunctionName: "lambertFragment",
                diffuseTextureURL: diffuseTextureURL,
                normalMapURL: nil,
                setupBaseMatrix: setupBaseMatrix)
    }

    static func meshNormalMap(fileURL: URL, diffuseTextureURL: URL, normalMapURL: URL,
                              setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?) -> FileMesh {
        return FileMesh(fileURL: fileURL,
                vertexFunctionName: "bumpVertex",
                fragmentFunctionName: "bumpFragment",
                diffuseTextureURL: diffuseTextureURL,
                normalMapURL: normalMapURL,
                setupBaseMatrix: setupBaseMatrix)
    }

    static func meshDisplacementMap(fileURL: URL, addNormalThreshold: Float? = nil,
                                    diffuseTextureURL: URL,
                                    normalMapURL: URL? = nil, displacementlMapURL: URL,
                                    setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?) -> FileTessellationMesh {
        return FileTessellationMesh(fileURL: fileURL,
                addNormalThreshold: addNormalThreshold,
                vertexFunctionName: "lambertVertex",
                fragmentFunctionName: "lambertFragment",
                diffuseTextureURL: diffuseTextureURL,
                normalMapURL: normalMapURL,
                displacementMapURL: displacementlMapURL,
                tessellationVertexFunctionName: "displacementTriangleVertex",
                tessellationFragmentFunctionName: "lambertFragment",
                setupBaseMatrix: setupBaseMatrix)
    }
}

struct FileTessellationMesh: TessellationMeshObject {
    let fileURL: URL
    let addNormalThreshold: Float?

    let vertexFunctionName: String
    let fragmentFunctionName: String
    let diffuseTextureURL: URL
    let normalMapURL: URL?
    let displacementMapURL: URL?

    let tessellationVertexFunctionName: String
    let tessellationFragmentFunctionName: String

    func makeGeometry(renderer: Renderer) -> Geometry? {
        return Geometry(url: fileURL, device: renderer.device, addNormalThreshold: addNormalThreshold)
    }

    let setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?
}

struct GeometryMesh: TessellationMeshObject {
    enum Shape {
        case triangle(dimensions: vector_float3)
        case box(dimensions: vector_float3, segments: vector_uint3)
        case sphere(radii: vector_float3, segments: vector_uint2)
    }

    let shapeType: Shape
    let vertexFunctionName: String
    let fragmentFunctionName: String
    let diffuseTextureURL: URL
    let normalMapURL: URL?
    let displacementMapURL: URL?

    let tessellationVertexFunctionName: String
    let tessellationFragmentFunctionName: String

    func makeGeometory(renderer: Renderer) -> Geometry? {
        switch shapeType {
        case .triangle(let dimensions):
            return Geometry.triangle(withDimensions: dimensions, device: renderer.device)
        case .box(let dimensions, let segments):
            return Geometry.box(withDimensions: dimensions, segments: segments, device: renderer.device)
        case .sphere(let radii, let segments):
            return Geometry.sphere(withRadii: radii, segments: segments, device: renderer.device)
        }
    }

    let setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?

    static func meshLambert(shapeType: Shape, diffuseTextureURL: URL,
                            setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?) -> GeometryMesh {
        return GeometryMesh(shapeType: shapeType,
                vertexFunctionName: "lambertVertex",
                fragmentFunctionName: "lambertFragment",
                diffuseTextureURL: diffuseTextureURL,
                normalMapURL: nil,
                displacementMapURL: nil,
                tessellationVertexFunctionName: "tessellationTriangleVertex",
                tessellationFragmentFunctionName: "lambertFragment",
                setupBaseMatrix: setupBaseMatrix)
    }

    static func meshDisplacementMap(shapeType: Shape, diffuseTextureURL: URL,
                                    normalMapURL: URL? = nil, displacementMapURL: URL,
                                    setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)?) -> GeometryMesh {
        return GeometryMesh(shapeType: shapeType,
                vertexFunctionName: "lambertVertex",
                fragmentFunctionName: "normalMapFragment",
                diffuseTextureURL: diffuseTextureURL,
                normalMapURL: normalMapURL,
                displacementMapURL: displacementlMapURL,
                tessellationVertexFunctionName: "displacementTriangleVertex",
                tessellationFragmentFunctionName: "normalMapFragment",
                setupBaseMatrix: setupBaseMatrix)
    }
}

protocol MeshObject {
    func makeGeometry(renderer: Renderer) -> Geometry?
    var setupBaseMatrix: ((matrix_float4x4) -> matrix_float4x4)? { get }
    var vertexFunctionName: String { get }
    var fragmentFunctionName: String { get }
    var diffuseTextureURL: URL { get }
    var normalMapURL: URL? { get }
}

protocol TessellationMeshObject: MeshObject {
    var tessellationVertexFunctionName: String { get }
    var tessellationFragmentFunctionName: String { get }
    var displacementMapURL: URL? { get }
}
