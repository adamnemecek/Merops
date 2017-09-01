//
//  Quad.swift
//  GeoTools
//
//  Created by Glenn Crownover on 4/28/15.
//  Copyright (c) 2015 bluejava. All rights reserved.
//

// A four vertice quad - must either be planar, or if non-planar, texture maps may not work
// as expected - and shared edge will be v0->v2
//
//  v1 --------v0
//  |        _/ |
//  |      _/   |
//  |    _/     |
//  |  _/       |
//  | /         |
//  v2 ------- v3

import SceneKit

class Quad {
    let v0: SCNVector3
    let v1: SCNVector3
    let v2: SCNVector3
    let v3: SCNVector3

    init(v0: SCNVector3, v1: SCNVector3, v2: SCNVector3, v3: SCNVector3) {
        self.v0 = v0
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
    }
}

class GeometryBuilder {
    var quads: [Quad]

    enum UVModeType {
        case StretchToFitXY, StretchToFitX,
             StretchToFitY, SizeToWorldUnitsXY, SizeToWorldUnitsX
    }

    var uvMode = UVModeType.StretchToFitXY

    init(uvMode: UVModeType = .StretchToFitXY) {
        self.uvMode = uvMode

        quads = []
    }

    // Add a quad to the geometry
    // - list verticies in counter-clockwise order
    // when looking from the "outside" of the square
    func addQuad(quad: Quad) {
        quads.append(quad)
    }

    func getGeometry() -> SCNGeometry {
        var verts: [SCNVector3] = []
        var faceIndices: [CInt] = []
        var normals: [SCNVector3] = []
        var uvs: [CGPoint] = []

        // Walk through the quads, adding 4 vertices, 2 faces and 4 normals per quad
        //  v1 --------------v0
        //  |             __/ |
        //  | face     __/    |
        //  | 1     __/       |
        //  |    __/     face |
        //  | __/           2 |
        //  v2 ------------- v3
        for quad in quads {
            verts.append(quad.v0)
            verts.append(quad.v1)
            verts.append(quad.v2)
            verts.append(quad.v3)

            // add face 1
            faceIndices.append(CInt(verts.count - 4)) // v0
            faceIndices.append(CInt(verts.count - 3)) // v1
            faceIndices.append(CInt(verts.count - 2)) // v2

            // add face 2
            faceIndices.append(CInt(verts.count - 4)) // v0
            faceIndices.append(CInt(verts.count - 2)) // v2
            faceIndices.append(CInt(verts.count - 1)) // v3

            // add normals for each vertice (compute seperately for face1 and face2 - common edge gets avg)
            let nvf1 = SCNUtils.getNormal(v0: quad.v0, v1: quad.v1, v2: quad.v2)
            let nvf2 = SCNUtils.getNormal(v0: quad.v0, v1: quad.v2, v2: quad.v3)
            normals.append(nvf1 + nvf2) // v0
            normals.append(nvf1) // v1
            normals.append(nvf1 + nvf2) // v2
            normals.append(nvf2) // v3

            let longestUEdgeLength = max((quad.v1 - quad.v0).length(), (quad.v2 - quad.v3).length())
            let longestVEdgeLength = max((quad.v1 - quad.v2).length(), (quad.v0 - quad.v3).length())

            switch uvMode {
                    // The longest sides dictate the texture tiling, then it is stretched (if nec) across
            case .SizeToWorldUnitsX:
                uvs.append(CGPoint(x: longestUEdgeLength, y: longestVEdgeLength))
                uvs.append(CGPoint(x: 0, y: longestVEdgeLength))
                uvs.append(CGPoint(x: 0, y: 0))
                uvs.append(CGPoint(x: longestUEdgeLength, y: 0))

            case .SizeToWorldUnitsXY:
                // For this uvMode, we allign the texture to the "upper left corner" (v1) and tile
                // it to the "right" and "down" (and "up") based on the coordinate units and the
                // texture/units ratio

                let v2v0 = quad.v0 - quad.v2 // v2 to v0 edge
                let v2v1 = quad.v1 - quad.v2 // v2 to v1 edge
                let v2v3 = quad.v3 - quad.v2 // v2 to v3 edge

                let v2v0Mag = v2v0.length() // length of v2 to v0 edge
                let v2v1Mag = v2v1.length() // length of v2 to v1 edge
                let v2v3Mag = v2v3.length() // length of v2 to v3 edge

                let v0angle = v2v3.angle(vector: v2v0) // angle of v2v0 edge against v2v3 edge
                let v1angle = v2v3.angle(vector: v2v1) // angle of v2v1 edge against v2v3 edge

                // now its just some simple trig - yay!
                uvs.append(CGPoint(x: cos(v0angle) * v2v0Mag, y: sin(v0angle) * v2v0Mag)) // V0
                uvs.append(CGPoint(x: cos(v1angle) * v2v1Mag, y: sin(v1angle) * v2v1Mag)) // V1
                uvs.append(CGPoint(x: 0, y: 0)) // V2
                uvs.append(CGPoint(x: v2v3Mag, y: 0)) // V3

                print("v0 texture point is at \(CGPoint(x: cos(v0angle) * v2v0Mag, y: sin(v0angle) * v2v0Mag))")
                print("v1 texture point is at \(CGPoint(x: cos(v1angle) * v2v1Mag, y: sin(v1angle) * v2v1Mag))")
                print("v2 texture point is at \(CGPoint(x: 0, y: 0))")
                print("v3 texture point is at \(CGPoint(x: v2v3Mag, y: 0))")

            case .StretchToFitXY:
                uvs.append(CGPoint(x: 1, y: 1))
                uvs.append(CGPoint(x: 0, y: 1))
                uvs.append(CGPoint(x: 0, y: 0))
                uvs.append(CGPoint(x: 1, y: 0))

            default:
                print("Unknown uv mode \(uvMode)") // no uv mapping for you!
            }
        }

        // Define our sources
        let vertexSource = SCNGeometrySource(vertices: verts, count: verts.count)
        let normalSource = SCNGeometrySource(normals: normals, count: normals.count)
        let textureSource = SCNGeometrySource(textureCoordinates: uvs, count: uvs.count)

        // Define elements Data
        let indexData = NSData(bytes: faceIndices, length: MemoryLayout<CInt>.size * faceIndices.count)
        let element = SCNGeometryElement(data: indexData as Data, primitiveType: .triangles, primitiveCount: faceIndices.count / 3, bytesPerIndex: MemoryLayout<CInt>.size)

        let geometry = SCNGeometry(sources: [vertexSource, normalSource, textureSource], elements: [element])

        return geometry
    }
}

