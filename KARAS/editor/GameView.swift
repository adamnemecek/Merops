//
//  GameView.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import SceneKit

enum ObjectType : Int {
    case Shape
    case Serializer
}

class GameView: SCNView {
    
    var mode = EditMode.ObjectMode, part = PartMode.ObjectMode
    func setMode(_mode: EditMode) { mode = _mode }
    func setPart(_part: PartMode) { part = _part }

    /* ------------------------
     
     Mark: points, lines, faces
     
     ------------------------ */
    
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

    var pointNode: SCNNode?
    
    func points(result: SCNHitTestResult) {
        let node = SCNNode(geometry: SCNSphere(radius: 0.3))
        node.categoryBitMask = 2
        
        let vertices = self.vertices()
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

    /*
     * MARK: Draw Event
     * arrowsCameraControl プロパティと干渉するのでView側に配置
     */
    
    override func setFrameSize(_ newSize: NSSize) {
        super.setFrameSize(newSize)
        (overlaySKScene as? GameViewOverlay)?.layout2DOverlay()
    }

    override func draw(_ dirtyRect: NSRect) {
        if let result = selection {
            switch part {
            case .VertexMode:
                points(result: result)
            case .EdgeMode:
                lines(result: result)
            case .FaceMode:
                faces(result: result)
            default:
                break
            }
        }
        super.draw(dirtyRect)
    }
    
    /*
     * MARK : Mouse Event
     */
    
    var p = CGPoint()
    var marken : SCNNode? = nil
    var selection : SCNHitTestResult? = nil
    var hitOld = SCNVector3Zero
    
    let pos = PositionNode()
    let scl = ScaleNode()
    let rot = RotateNode()
    
    var isCameraCtrl : Bool!

    override func mouseDown(with event: NSEvent) {
        p = self.convert(event.locationInWindow, from: nil)
        
        let options = [
            SCNHitTestOption.sortResults : NSNumber(value: true),
            SCNHitTestOption.boundingBoxOnly : NSNumber(value: true),
        ]
        
        let hitResults = self.hitTest(p, options: options)

        var isGeometry: Bool {
            for hit in hitResults {
                if hit.node.name == "pos" || hit.node.name == "scl" || hit.node.name == "rot" {
                    return false
                }
            }
            return true
        }

        // Selection Clear
        if hitResults.count == 0 {

            // remove Gizmo
            self.scene?.rootNode.childNode(withName: "pos", recursively: true)?.removeFromParentNode()
            self.scene?.rootNode.childNode(withName: "scl", recursively: true)?.removeFromParentNode()
            self.scene?.rootNode.childNode(withName: "rot", recursively: true)?.removeFromParentNode()

            // reset Material
            self.scene?.rootNode.enumerateChildNodes({ child, _ in
                if let geo = child.geometry {
                    geo.firstMaterial?.emission.contents = Color.black
                }
            })

        } else {
            
            let result: AnyObject = hitResults[0]
            if result is SCNHitTestResult {
                selection = result as? SCNHitTestResult
            }
            
            // Gizmo Position
            for giz in [pos, scl, rot] {
                self.scene?.rootNode.addChildNode(giz)
                giz.position = (selection?.node.position)!
                giz.isHidden = true
            }

            // Visible Gizmo
            switch mode {
            case .PositionMode:
                pos.isHidden = false

            case .ScaleMode:
                scl.isHidden = false

            case .RotateMode:
                rot.isHidden = false

            default:
                selection?.node.geometry!.firstMaterial!.emission.contents = (selection?.node.geometry != nil) ? Color.red : Color.yellow
            }
        }
        
        self.allowsCameraControl = (hitResults.count == 0)
        super.mouseDown(with: event)
    }
    
    override func mouseDragged(with event: NSEvent) {
        
        if selection != nil {
            let mouse   = self.convert(event.locationInWindow, from: self)
            
            var unPoint = self.unprojectPoint(SCNVector3(x: mouse.x, y: mouse.y, z: 0.0))
            let p1      = selection!.node.parent!.convertPosition(unPoint, from: nil)
            unPoint     = self.unprojectPoint(SCNVector3(x: mouse.x, y: mouse.y, z: 1.0))
            let p2      = selection!.node.parent!.convertPosition(unPoint, from: nil)
            
            let m       = p2 - p1, e = selection!.localCoordinates, n = selection!.localNormal
            let t       = ((e * n) - (p1 * n)) / (m * n)
            let hit     = SCNVector3(
                            x: (t * m.x).x + p1.x,
                            y: (t * m.y).y + p1.y,
                            z: (t * m.z).z + p1.z
                        )
            let offset  = hit - hitOld
            hitOld      = hit
            NSLog("\((t * m.x)) \(p1.x) \((t * m.y)) \(p1.y) \((t * m.z).z) \(p1.z)")
            
            if marken != nil {
                marken!.position = marken!.position + offset * 7
                
            } else {
                marken = selection!.node.clone()
                marken!.opacity = 0.333
                
                switch part {
                case .VertexMode:
                    break
                    
                case .FaceMode:
                    marken = marken?.copy() as? SCNNode
                    marken = SCNNode(geometry:
                        SCNGeometry(
                            sources: (marken?.geometry?.sources)!, elements: marken?.geometry?.elements
                        )
                    )
                    
                    marken!.position = selection!.node.position
                    selection!.node.parent!.addChildNode(marken!)
 
                case .EdgeMode:
                    break
                    
                default:
                    marken!.position = selection!.node.position
                    selection!.node.parent!.addChildNode(marken!)
                }
            }
            
        } else {
            super.mouseDragged(with: event)
        }
    }

    override func mouseUp(with event: NSEvent) {
        
        if selection != nil && marken != nil {
            
            if event.modifierFlags == NSEvent.ModifierFlags.control {
                marken!.opacity = 1.0
                
            } else {
                switch part {
                    
                case .VertexMode:
                    break
                case .FaceMode:
                    break
                case .EdgeMode:
                    break
                default:
                    selection!.node.position = selection!.node.convertPosition(
                        marken!.position, from: selection!.node
                    )
                }
                marken!.removeFromParentNode()
            }
            
            // nil
            selection = nil
            marken = nil
            
        } else {
            super.mouseUp(with: event)
        }
        
        // Update Position
        self.allowsCameraControl = true
        p = self.convert(event.locationInWindow, to: nil)
        needsDisplay = true
    }
}

