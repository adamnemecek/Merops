//
//  USDObject.swift
//  KARAS
//
//  Created by sumioka-air on 2017/03/28.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit

import ModelIO
import SceneKit.ModelIO


public class USDObject : MDLObject {
    
    override init(){
        super.init()
        SCNNode(mdlObject: self)
    }
    
    /*
     func rewrite() {
     self.rootNode.enumerateChildNodes({ child, stop in
     if let sub1 = child as? SCNNode {
     print(sub1.className)
     
     if let geo = sub1.geometry {
     print(geo.geometrySources)
     }
     
     if let cam = sub1.camera {
     
     }
     }
     })
     }
     */
}

class USDImporter {
    
}

class USDExporter {
    
    public static func cleaner(scene: SCNScene) {
        scene.rootNode.enumerateChildNodes({ child, _ in
            child.childNode(withName: "", recursively: true)?.removeFromParentNode()
        })
    }
    
    public static func exportAssetFrom(scene: SCNScene) {
        let asset = MDLAsset(scnScene: scene)
        let documentsPath = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        
        let path = documentsPath.appendingPathComponent("ModelIO-Export")
        do {
            try FileManager.default.createDirectory(at: path!, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            NSLog("Unable to create directory \(error.debugDescription)")
        }
        
        let exportFile = path?.appendingPathComponent("model.usd")
        try! asset.export(to: exportFile!)
    }
    
    public static func exportText() {
        
        let documentsPath = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        
        let path = documentsPath.appendingPathComponent("ModelIO-Export")
        do {
            try FileManager.default.createDirectory(at: path!, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            NSLog("Unable to create directory \(error.debugDescription)")
        }
        
        // 保存するもの
        let fileName = "file.usda"
        let filePath = documentsPath.absoluteString! + fileName
        let fileObject = "#usda 1.0" +
                         "\n" +
                         "def Cube \"Cube\" {}"
        
        do {
            try fileObject.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // Failed to write file
        }
    }
    
    func mdlmesh(mdlObject: MDLObject) {
        if let mesh = mdlObject as? MDLMesh {
            //            vertexDescriptors.append(mesh.vertexDescriptor)
            for vertexBuffer in mesh.vertexBuffers {
                let vertexBufferData = Data(bytes: vertexBuffer.map().bytes,
                                            count: vertexBuffer.length)
            }
            for submesh in mesh.submeshes! {
                if let indexBuffer = (submesh as? MDLSubmesh)?.indexBuffer {
                    let indexBufferData = Data(bytes: indexBuffer.map().bytes,
                                               count: indexBuffer.length)
                }
            }
        }
    }
    /*
     func rewrite () {
     let geo : SCNNode = (scnv.scene?.rootNode.childNode(withName: "geo", recursively: true))!
     geo.geometry?.name = "abc"
     let msh = MDLMesh(scnGeometry: geo.geometry!)
     msh.name = "ABC"
     
     let dsc = MDLVertexDescriptor()
     let vertLayout = MDLVertexBufferLayout()
     vertLayout.stride = 36
     dsc.layouts[0] = vertLayout
     
     print(MDLVertexAttributeJointIndices, MDLVertexAttributeJointWeights)
     
     let a1 = MDLVertexAttribute(name: MDLVertexAttributePosition, format: .float3, offset: 0, bufferIndex: 0)
     dsc.addOrReplaceAttribute(a1)
     dsc.addOrReplaceAttribute(MDLVertexAttribute(name: MDLVertexAttributeTextureCoordinate, format: .float2, offset: 12, bufferIndex: 0))
     dsc.addOrReplaceAttribute(MDLVertexAttribute(name: MDLVertexAttributeColor, format: .float4, offset: 20, bufferIndex: 0))
     msh.vertexDescriptor = dsc
     
     //msh.addAttribute(withName: <#T##String#>, format: <#T##MDLVertexFormat#>, type: <#T##String#>, data: <#T##Data#>, stride: <#T##Int#>, time: <#T##TimeInterval#>)
     asset.add(msh)
     
     /*
     let mesh = MDLSubmesh()
     mesh.name = "mmesh"
     let obj = MDLMesh(boxWithExtent: [1,1,1], segments: [1,2,1], inwardNormals: true, geometryType: .triangles, allocator: nil)
     obj.name = "aaa"
     
     let attrPos = MDLVertexAttribute(name: MDLVertexAttributePosition, format: .Float4, offset: 0, bufferIndex: 0)
     let attrColor = MDLVertexAttribute(name: MDLVertexAttributeColor, format: .Int4, offset: 0, bufferIndex: 1)
     let attrTex = MDLVertexAttribute(name: MDLVertexAttributeTextureCoordinate, format: .Float4, offset: 0, bufferIndex: 2)
     let attrNorm = MDLVertexAttribute(name: MDLVertexAttributeNormal, format: .Float4, offset: 0, bufferIndex: 3)
     
     let desc = MDLVertexDescriptor()
     desc.addOrReplaceAttribute(attrPos)
     desc.addOrReplaceAttribute(attrColor)
     desc.addOrReplaceAttribute(attrTex)
     desc.addOrReplaceAttribute(attrNorm)
     
     let dsc = MDLVertexDescriptor()
     let pos = dsc.attributeNamed(MDLVertexAttributePosition)
     pos?.format = (obj.vertexDescriptor.attributeNamed(MDLVertexAttributePosition)?.format)!
     pos?.offset = 0
     pos?.bufferIndex = 0
     pos!.time = 0
     
     var col = dsc.attributeNamed(MDLVertexAttributeColor)
     var tex = dsc.attributeNamed(MDLVertexAttributeTextureCoordinate)
     dsc.addOrReplaceAttribute(pos!)
     dsc.addOrReplaceAttribute(col!)
     dsc.addOrReplaceAttribute(tex!)
     obj.vertexDescriptor = dsc
     */
     
     let cam = MDLCamera()
     cam.name = "mcamera"
     cam.projection = .orthographic
     let mat = matrix_float4x4(columns: ([1,0,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,1]))
     cam.transform?.setLocalTransform!(mat, forTime: 0)
     let mat2 = matrix_float4x4(columns: ([1,0,0,0], [0,1,0,0], [0,0,1,0], [1,0,0,0]))
     cam.transform?.setLocalTransform!(mat2, forTime: 2)
     // asset.add(cam)
     }
     */
}

