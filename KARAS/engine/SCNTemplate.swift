//
//  SCNObject.swift
//  TUBAME
//
//  Created by sumioka-air on 2017/03/26.
//  Copyright © 2017年 sho sumioka. All rights reserved.


import SceneKit

func getMat(textureFilename: String, ureps: CGFloat = 1.0, vreps: CGFloat = 1.0, directory: String? = nil,
                  normalFilename: String? = nil, specularFilename: String? = nil) -> SCNMaterial {
    let nsb = Bundle.main.path(forResource: textureFilename, ofType: nil, inDirectory: directory)
    let im = NSImage(contentsOfFile: nsb!)
    
    let mat = SCNMaterial()
    mat.diffuse.contents = im
    
    if (normalFilename != nil) {
        mat.normal.contents = NSImage(contentsOfFile: Bundle.main.path(forResource: normalFilename, ofType: nil, inDirectory: directory)!)
    }
    
    if (specularFilename != nil) {
        mat.specular.contents = NSImage(contentsOfFile: Bundle.main.path(forResource: specularFilename, ofType: nil, inDirectory: directory)!)
    }
    
    repeatMat(mat: mat, wRepeat: ureps, hRepeat: vreps)
    return mat
}

func repeatMat(mat: SCNMaterial, wRepeat: CGFloat, hRepeat: CGFloat) {
    
    mat.diffuse.contentsTransform = SCNMatrix4MakeScale(wRepeat, hRepeat, 1.0)
    mat.diffuse.wrapS = .repeat
    mat.diffuse.wrapT = .repeat
    
    mat.normal.wrapS = .repeat
    mat.normal.wrapT = .repeat
    
    mat.specular.wrapS = .repeat
    mat.specular.wrapT = .repeat
}

func getNormal(v0: SCNVector3, v1: SCNVector3, v2: SCNVector3) -> SCNVector3 {
    
    // there are three edges defined by these 3 vertices, but we only need 2 to define the plane
    let edgev0v1 = v1 - v0, edgev1v2 = v2 - v1
    
    // Assume the verts are expressed in counter-clockwise order to determine normal
    return edgev0v1.cross(vector: edgev1v2)
}

func createCam() -> SCNNode {
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    return cameraNode
}


func square(length: Float) -> [SCNVector3] {
    let m = SCNFloat(length/Float(2)), q = SCNFloat(Float(1))
    
    let topLeft = SCNVector3Make(-m-q,  m+q, m+q),
    topRight    = SCNVector3Make( m+q,  m+q, m+q),
    bottomLeft  = SCNVector3Make(-m-q, -m-q, m+q),
    bottomRight = SCNVector3Make( m+q, -m-q, m+q)
    
    return [topLeft, topRight, bottomLeft, bottomRight]
}

func custumGeo(half : Float = 2) -> SCNNode {
    
    // https://qiita.com/takabosoft/items/13114d5da7180a9b2ab0
    
    // VBO 頂点を定義します。
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
    
    // 各頂点における法線ベクトルを定義
    let vectors = [
        SCNVector3(0, 0, 2), // 手前
        SCNVector3(0, 0, -1), // 奥
        SCNVector3(-1, 0, 0), // 左側
        SCNVector3(1, 0, 0), // 右側
        SCNVector3(0, 1, 0), // 上側
        SCNVector3(0, -1, 0), // 下側
    ]
    
    var normals : [SCNVector3] = []
    for vec in vectors {
        for _ in 1...4 {
            normals.append(vec)
        }
    }
    
    // IBO ポリゴンを定義します。
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
    
    // マテリアル
    let material = SCNMaterial()
    material.lightingModel = .physicallyBased
    material.diffuse.contents = NSImage(named: NSImage.Name(rawValue: "texture"))
    material.metalness.contents = NSNumber(value: 0.5)
    
    // ジオメトリ
    let customGeometry = SCNGeometry(
        sources:  [SCNGeometrySource(vertices: vertices), SCNGeometrySource(normals: normals)],
        elements: [SCNGeometryElement(indices: indices, primitiveType: .triangles)]
    )
    customGeometry.materials = [material]
    return SCNNode(geometry: customGeometry)
}

//extension SCNGeometrySource {
//    convenience init(textureCoordinates texcoord: [float2]) {
//        let data = Data(bytes: texcoord, length: sizeof(float2) * texcoord.count)
//        self.init(data: data, semantic: SCNGeometrySourceSemanticTexcoord,
//                  vectorCount: texcoord.count, floatComponents: true,
//                  componentsPerVector: 2, bytesPerComponent: sizeof(Float),
//                  dataOffset: 0, dataStride: sizeof(float2)
//        )
//    }
//}
