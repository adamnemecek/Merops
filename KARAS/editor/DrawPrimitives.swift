//
//  DrawPrimitives.swift
//  KARAS
//
//  Created by sumioka-air on 2018/02/04.
//  Copyright © 2018年 sho sumioka. All rights reserved.
//

import Foundation
import SceneKit

/* ------------------------
 
 Mark: points, lines, faces
 
 ------------------------ */

/*
var selection : SCNHitTestResult?

func vertices() -> [SCNVector3] {
    
    // geo source
    let planeSources = selection?.node.geometry?.sources(
        for: SCNGeometrySource.Semantic.vertex
    )
    let planeSource = planeSources?.first
    
    // Data
    let stride = planeSource?.dataStride
    let offset = planeSource?.dataOffset
    let componentsPerVector = planeSource?.componentsPerVector
    let bytesPerVector = componentsPerVector! * (planeSource?.bytesPerComponent)!
    let vectors = [SCNVector3](repeating: SCNVector3Zero, count: (planeSource?.vectorCount)!)
    
    // copy vertices
    let _vertices = vectors.enumerated().map({ (index: Int, _) -> SCNVector3 in
        var vectorData = [UInt8](repeating: 0, count: componentsPerVector!)
        planeSource?.data.copyBytes(
            to: &vectorData, from: NSMakeRange(index * stride! + offset!, bytesPerVector).toRange()!
        )
        
        return SCNVector3Make(
            SCNFloat(vectorData[0]),
            SCNFloat(vectorData[1]),
            SCNFloat(vectorData[2])
        )
    })
    return _vertices
}

func points(result: SCNHitTestResult) {
    let node = SCNNode(geometry: SCNSphere(radius: 0.3))
    node.categoryBitMask = 2
    
    let vertices = vertices()
    for (index, vec) in vertices.enumerated() {
        NSLog("\(vec)")
        pointNode = node.flattenedClone()
        pointNode?.name = "vertex_\(index)"
        pointNode?.position = self.projectPoint(vec)
        result.node.addChildNode(pointNode!)
    }
}

func lines(result: SCNHitTestResult) {
    let node = SCNNode()
    node.categoryBitMask = 2
    
    for (index, vec) in vertices().enumerated() {
        let source = SCNGeometrySource(
            vertices: [vec, vec]),
        indices: [UInt8] = [0, 1],
        data = Data(bytes: indices
        ),
        element = SCNGeometryElement(
            data: data, primitiveType: .line, primitiveCount: 1, bytesPerIndex: 1
        )
        node.geometry = SCNGeometry(sources: [source], elements: [element])
        let lineNode = node.flattenedClone()
        lineNode.name = "line\(index)"
        
        let material = SCNMaterial()
        material.diffuse.contents = Color.red
        lineNode.geometry!.insertMaterial(material, at: 0)
        result.node.addChildNode(lineNode)
    }
}

func faces(result: SCNHitTestResult) {
    let planeSources = selection?.node.geometry?.sources(for:SCNGeometrySource.Semantic.normal)
    planeSources?.index(after: 0)
    
    let material = result.node.geometry!.firstMaterial!
    material.emission.contents = Color.green
}
*/
