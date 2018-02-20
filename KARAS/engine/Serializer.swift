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
    
    let path = documentsPath.appendingPathComponent("_res/KARASExport")
    do {
        try FileManager.default.createDirectory(at: path!, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        NSLog("Unable to create directory \(error.debugDescription)")
    }
    
    let exportFile = path?.appendingPathComponent(fileName)
    return exportFile!
}

// ## Element
// * Light
// * Material
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
     1. edit
     2. export
     3. git commit
     4. import
     */
    
    public static func exportFromAsset(scene: SCNScene) -> MDLAsset {
        
        var keeps : [SCNNode] = []
        
        // Y-Up
        let asset = MDLAsset(scnScene: scene)
        asset.upAxis = vector_float3([0, 1, 0])
        
        // add MDLLight and MDLMaterial
        scene.rootNode.enumerateChildNodes({ child, _ in
            if (child.light != nil) {
                child.removeFromParentNode()
                keeps.append(child)
//                let light = MDLAreaLight(scnLight: child.light!)
//                light.name = (child.light?.name)!
//                asset.add(light)
            }
            
            if (child.name == "pos" || child.name == "rot" || child.name == "scl") {
                child.removeFromParentNode()
                keeps.append(child)
            }
            
            if (child.geometry != nil) {
                let scatteringFunction = MDLScatteringFunction()
                let material = MDLMaterial(name: "baseMaterial", scatteringFunction: scatteringFunction)
    //            material.setTextureProperties(textures:[.baseColor: "diffuse.jpg", .specular: "specular.jpg"])

                material.setProperty(MDLMaterialProperty(name: "color", semantic: .baseColor, color: CGColor.black))
                // Apply the texture to every submesh of the asset
                for submesh in (MDLMesh(scnGeometry: child.geometry!).submeshes!)  {
                    if let submesh = submesh as? MDLSubmesh {
                        submesh.material = material
                    }
                }
            }
        })
        let ext = "/Users/sumioka_air/Documents/_res/KARASExport"
        gitInit(url: ext)
//        gitClone(url: "https://github.com/sho7noka/3d-sh.git", dir: ext)
//        gitRevert(url: ext)
        
        // export with ascii format
        let exportFile = usdFilePath(fileName: "model.usd")
        try! asset.export(to: exportFile)
        USDCat(infile: exportFile.path, outfile: exportFile.path)

        // TODO: バイナリでも追記できるか試してみたい
        write(url: exportFile, text: "\ndef Cube \"cylinder\" {\n}")
        gitCommit(url: exportFile.absoluteString, msg: "export")
        
        // import from ascii
        scene.rootNode.enumerateChildNodes({ child, _ in
            child.removeFromParentNode()
        })
        let masset = MDLAsset(url: URL(fileURLWithPath: exportFile.path))
//        let object = asset.childObjects(of: MDLMesh.self) as? [MDLMesh]
        
//        guard let cameras = asset.childObjects(of: MDLCamera.self) as? [MDLCamera], cameras.count > 0 else {
//            print("No cameras found")
//            return
//        }
        
        // Create subdivision mesh
//        for (index, _) in (object?.submeshes!.enumerated())! {
//            let mesh = MDLMesh.newSubdividedMesh(object!, submeshIndex: index, subdivisionLevels: 1)
//            let geometry = SCNGeometry(mdlMesh: mesh!)
//            let geometryNode = SCNNode(geometry: geometry)
//            geometryNode.position = SCNVector3(x: 5, y: 0, z: 0)
//            scene.rootNode.addChildNode(geometryNode)
//        }
        
//        let scatteringFunction = MDLScatteringFunction()
//        let material = MDLMaterial(name: "baseMaterial", scatteringFunction: scatteringFunction)
////        material.setTextureProperties(textures: [.baseColor : textureurl])
//
//        material.setProperty(MDLMaterialProperty(name: "color", semantic: .baseColor, color: CGColor.black))
//        //Apply the texture to every submesh of the asset
//        for submesh in object![0].submeshes!  {
//            if let submesh = submesh as? MDLSubmesh {
//                submesh.material = material
//            }
//        }
//        masset.add(object![0])
        return masset
    }
    
    public static func write(url: URL, text: String) -> Bool {
        guard let stream = OutputStream(url: url, append: true) else {
            return false
        }
        stream.open()
        
        defer {
            stream.close()
        }
        
        guard let data = text.data(using: .utf8) else { return false }
        
        let result = data.withUnsafeBytes {
            stream.write($0, maxLength: data.count)
        }
        return (result > 0)
    }

    public static func exportFromText() {
        let filePath = usdFilePath(fileName: "cube.usd")
        let fileObject = """
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

extension MDLMaterial {
    func setTextureProperties(textures: [MDLMaterialSemantic:URL]) -> Void {
        for (key,value) in textures {
            let name = value.path
            let property = MDLMaterialProperty(name:name, semantic: key, url: value)
            self.setProperty(property)
        }
    }
}
