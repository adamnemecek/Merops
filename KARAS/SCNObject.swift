//
//  SCNObject.swift
//  TUBAME
//
//  Created by sumioka-air on 2017/03/26.
//  Copyright © 2017年 sho sumioka. All rights reserved.


import SceneKit

func pivotNode() {
//    ship.pivot = SCNMatrix4MakeTranslation(10.0, 0.0, 0.0)
}

//見やすくするために
func v(_ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> SCNVector3{
    return SCNVector3(x: x, y: y, z: z)
}

func createCam() -> SCNNode {
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    return cameraNode
}

func createLight(type: SCNLight.LightType) -> SCNNode {
    let lightNode = SCNNode()
    lightNode.light = SCNLight()
    lightNode.light!.type = type
    return lightNode
}

func createAnim() -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "rotation")
    animation.toValue =
        NSValue(scnVector4: SCNVector4(x: CGFloat(0), y: CGFloat(1), z: CGFloat(0), w: CGFloat(Double.pi)*2))
    animation.duration = 3
    animation.repeatCount = MAXFLOAT
    return animation
}

func createBox() -> SCNNode {
    let box = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 3)
    
    let mat = SCNMaterial()
    mat.diffuse.contents = NSColor.white
    
    box.firstMaterial = mat
    return SCNNode(geometry: box)
}

func createMaterial() -> SCNMaterial {
    let matNode = SCNMaterial()
    matNode.diffuse.contents = NSColor.red
    matNode.blendMode = SCNBlendMode.multiply
    matNode.writesToDepthBuffer = true
    return matNode
}

func createMorpher(name: String) ->SCNMorpher {
    let morphNode = SCNNode()
    morphNode.name = name
    morphNode.morpher = SCNMorpher()
    return morphNode.morpher!
}

func createBone(name: String) ->SCNNode {
    let root = SCNNode()
    return root
}

func createSkin(name: String) -> SCNNode {
    let skinNode = SCNNode()
    skinNode.name = name
    skinNode.skinner = SCNSkinner()
    //        skinNode.skinner.baseGeometry
    //        skinNode.skinner.bones
    //        skinNode.skinner.boneInverseBindTransforms
    //        skinNode.skinner.boneWeights
    //        skinNode.skinner.boneIndices
    return skinNode
}

func line(name: String = "line", from : SCNVector3, to : SCNVector3) -> SCNNode {

    let source = SCNGeometrySource(vertices: [from, to]),
        indices : [UInt8] = [0, 1],
        data = Data(bytes: indices)

    let element = SCNGeometryElement(data: data, primitiveType: .line, primitiveCount: 1, bytesPerIndex: 1),
        geometry = SCNGeometry(sources: [source], elements: [element]),
        node = SCNNode(geometry: geometry)
        node.name = name
    
    let material = SCNMaterial()
    material.diffuse.contents = NSColor.red
    node.geometry!.insertMaterial(material, at: 0)
    
    return node
}

func custumGeo()->SCNNode {
    
    // 頂点を定義します。
    let half = Float(2)
    let vertices = [
        
        // 手前
        SCNVector3(-half, +half, +half), // 手前+左上 0
        SCNVector3(+half, +half, +half), // 手前+右上 1
        SCNVector3(-half, -half, +half), // 手前+左下 2
        SCNVector3(+half, -half, +half), // 手前+右下 3
        
        // 奥
        SCNVector3(-half, +half, -half), // 奥+左上 4
        SCNVector3(+half, +half, -half), // 奥+右上 5
        SCNVector3(-half, -half, -half), // 奥+左下 6
        SCNVector3(+half, -half, -half), // 奥+右下 7
        
        // 左側
        SCNVector3(-half, +half, -half), // 8 (=4)
        SCNVector3(-half, +half, +half), // 9 (=0)
        SCNVector3(-half, -half, -half), // 10 (=6)
        SCNVector3(-half, -half, +half), // 11 (=2)
        
        // 右側
        SCNVector3(+half, +half, +half), // 12 (=1)
        SCNVector3(+half, +half, -half), // 13 (=5)
        SCNVector3(+half, -half, +half), // 14 (=3)
        SCNVector3(+half, -half, -half), // 15 (=7)
        
        // 上側
        SCNVector3(-half, +half, -half), // 16 (=4)
        SCNVector3(+half, +half, -half), // 17 (=5)
        SCNVector3(-half, +half, +half), // 18 (=0)
        SCNVector3(+half, +half, +half), // 19 (=1)
        
        // 下側
        SCNVector3(-half, -half, +half), // 20 (=2)
        SCNVector3(+half, -half, +half), // 21 (=3)
        SCNVector3(-half, -half, -half), // 22 (=6)
        SCNVector3(+half, -half, -half), // 23 (=7)
    ]
    let verticesSource = SCNGeometrySource(vertices: vertices, count: vertices.count)
    
    
    // 各頂点における法線ベクトルを定義
    let normals = [
        
        // 手前
        SCNVector3(0, 0, 1),
        SCNVector3(0, 0, 1),
        SCNVector3(0, 0, 1),
        SCNVector3(0, 0, 1),
        
        // 奥
        SCNVector3(0, 0, -1),
        SCNVector3(0, 0, -1),
        SCNVector3(0, 0, -1),
        SCNVector3(0, 0, -1),
        
        // 左側
        SCNVector3(-1, 0, 0),
        SCNVector3(-1, 0, 0),
        SCNVector3(-1, 0, 0),
        SCNVector3(-1, 0, 0),
        
        // 右側
        SCNVector3(1, 0, 0),
        SCNVector3(1, 0, 0),
        SCNVector3(1, 0, 0),
        SCNVector3(1, 0, 0),
        
        // 上側
        SCNVector3(0, 1, 0),
        SCNVector3(0, 1, 0),
        SCNVector3(0, 1, 0),
        SCNVector3(0, 1, 0),
        
        // 下側
        SCNVector3(0, -1, 0),
        SCNVector3(0, -1, 0),
        SCNVector3(0, -1, 0),
        SCNVector3(0, -1, 0),
        ]
    let normalsSource = SCNGeometrySource(normals: normals, count: normals.count)
    
    
    // ポリゴンを定義します。
    let indices: [Int32] = [
        // 手前
        0, 2, 1,
        1, 2, 3,
        
        // 奥
        4, 5, 7,
        4, 7, 6,
        
        // 左側
        8, 10, 9,
        9, 10, 11,
        
        // 右側
        13, 12, 14,
        13, 14, 15,
        
        // 上側
        16, 18, 17,
        17, 18, 19,
        
        // 下側
        22, 23, 20,
        23, 21, 20,
        ]
    let faceSource = SCNGeometryElement(indices: indices, primitiveType: .triangles)
    
    
    // マテリアル
    let material = SCNMaterial()
    material.lightingModel = .physicallyBased
    material.diffuse.contents = NSImage(named: "texture")
    material.metalness.contents = NSNumber(value: 0.5)
    
    
    let customGeometry = SCNGeometry(sources: [verticesSource, normalsSource], elements: [faceSource])
    customGeometry.materials = [material]
    return SCNNode(geometry: customGeometry)
}

extension SCNGeometrySource {
//    convenience init(textureCoordinates texcoord: [float2]) {
//        let data = Data(bytes: texcoord, length: sizeof(float2) * texcoord.count)
//        self.init(data: data, semantic: SCNGeometrySourceSemanticTexcoord, vectorCount: texcoord.count, floatComponents: true, componentsPerVector: 2, bytesPerComponent: sizeof(Float), dataOffset: 0, dataStride: sizeof(float2))
//    }
}

func squareVertices(length: Float) -> [SCNVector3] {
    let m = CGFloat(length/Float(2)),
        q = CGFloat(Float(1))

    let topLeft =       SCNVector3Make(-m-q,  m+q, m+q),
        topRight =      SCNVector3Make( m+q,  m+q, m+q),
        bottomLeft =    SCNVector3Make(-m-q, -m-q, m+q),
        bottomRight =   SCNVector3Make( m+q, -m-q, m+q)

    return [topLeft, topRight, bottomLeft, bottomRight]
}

