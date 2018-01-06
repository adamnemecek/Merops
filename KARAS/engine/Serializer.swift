//
//  USDObject.swift
//  KARAS
//
//  Created by sumioka-air on 2017/03/28.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import ModelIO
import SceneKit
import SceneKit.ModelIO

public class USDObject: MDLObject {

    override init() {
        super.init()
        
    }
    
    func serializer () {
        return
    }
}

public func usdFilePath (fileName : String) -> URL {
    let documentsPath = NSURL(fileURLWithPath:
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
    
    let path = documentsPath.appendingPathComponent("KARASExport")
    do {
        try FileManager.default.createDirectory(at: path!, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        NSLog("Unable to create directory \(error.debugDescription)")
    }
    
    let exportFile = path?.appendingPathComponent(fileName)
    return exportFile!
}

class USDImporter {

}

extension MDLAsset {
    
}

class USDExporter {
    
    public static func cleaner(scene: SCNScene) {
        scene.rootNode.enumerateChildNodes({ child, _ in
            if child.categoryBitMask == 2 {
                child.removeFromParentNode()
            }
        })
    }

    /*
     ## Animation
     * transform
     * skeltal
     * Vertex
     
     ## Element
     * Light
     * Material
     */
    
    public static func exportFromAsset(scene: SCNScene) {
        let asset = MDLAsset(scnScene: scene)
        
        asset.upAxis = vector_float3(0, 0, 1)
        asset.startTime = 1
        
        let exportFile = usdFilePath(fileName: "model.usda")
        try! asset.export(to: exportFile)
    }

    public static func exportFromText() {
        let filePath = usdFilePath(fileName: "cube.usda")
        let fileObject =
        """
        #usda 1.0
        def Cube \"Cube1\" {
        }
        """
        do {
            try fileObject.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // Failed to write file
        }
    }

    func mdlmesh(mdlObject: MDLObject) {
//        if let mesh = mdlObject as? MDLMesh {

//            for vertexBuffer in mesh.vertexBuffers {
//                let vertexBufferData = Data(bytes: vertexBuffer.map().bytes,
//                        count: vertexBuffer.length)
//            }
//            for submesh in mesh.submeshes! {
//                if let indexBuffer = (submesh as? MDLSubmesh)?.indexBuffer {
//                    let indexBufferData = Data(bytes: indexBuffer.map().bytes,
//                            count: indexBuffer.length)
//                }
//            }
//        }
    }

}
