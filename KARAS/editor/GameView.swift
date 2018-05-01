//
//  GameView.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import SpriteKit
import SceneKit

class GameView: SCNView {
    
    /*
     * MARK: Draw Event
     * arrowsCameraControl プロパティと干渉するのでView側に配置
     */
    var mode = EditMode.ObjectMode, part = PartMode.ObjectMode
    
    override func draw(_ dirtyRect: NSRect) {
        if let result = selection {
            switch part {
//                case .VertexMode:   points(result: result)
//                case .EdgeMode:     lines(result: result)
//                case .FaceMode:     faces(result: result)
                default:            break
            }
        }
        super.draw(dirtyRect)
    }
    
    func viewDidInit() {
        let ory = (overlaySKScene as? GameViewOverlay)
        let size = self.frame.size
        ory?.label_name.position = CGPoint(x: -size.width/2 + 16, y: size.height/2 - CGFloat(20 * 1))
        ory?.label_position.position = CGPoint(x: -size.width/2 + 16, y: size.height/2 - CGFloat(20 * 2))
        ory?.label_rotate.position = CGPoint(x: -size.width/2 + 16, y: size.height/2 - CGFloat(20 * 3))
        ory?.label_scale.position = CGPoint(x: -size.width/2 + 16, y: size.height/2 - CGFloat(20 * 4))
        ory?.label_info.position = CGPoint(x: -size.width/2 + 16, y: size.height/2 - CGFloat(20 * 5))
        
        ory?.button_red.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 76)
        ory?.button_green.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 52)
        ory?.button_blue.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 28)
    }
    override func viewWillStartLiveResize() {
        viewDidInit()
    }
    override func resize(withOldSuperviewSize oldSize: NSSize) {
        viewDidInit()
    }
    override func viewDidEndLiveResize() {
        viewDidInit()
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
    var isDeforming = false
    var isEdit = false

    override func mouseDown(with event: NSEvent) {
        p = self.convert(event.locationInWindow, from: nil)
        let options = [
            SCNHitTestOption.sortResults : NSNumber(value: true),
            SCNHitTestOption.boundingBoxOnly : NSNumber(value: true),
        ]
        let hitResults = self.hitTest(p, options: options)
        
        // HUD event
        let skScene = (overlaySKScene as? GameViewOverlay)!
        let _p = skScene.convertPoint(fromView: event.locationInWindow)
        switch skScene.nodes(at: _p).first?.name! {

        case "red"?:
            Builder.Cone(scene: self.scene!)

        case "blue"?:
            Builder.Grid(scene: self.scene!)

        case "green"?:
            Builder.Torus(scene: self.scene!)

        default:
            break
        }
        
        var isGeometry: Bool {
            for hit in hitResults {
                if hit.node.name == "pos" || hit.node.name == "scl" || hit.node.name == "rot" {
                    return false
                }
            }
            return true
        }
        
        isDeforming = hitResults.count > 0
        if isDeforming {
            self.gestureRecognizers.forEach {$0.isEnabled = false}
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
            
            // label
            (overlaySKScene as? GameViewOverlay)?.label_name.text = "Name"
            (overlaySKScene as? GameViewOverlay)?.label_position.text = "Position"
            (overlaySKScene as? GameViewOverlay)?.label_rotate.text = "Rotate"
            (overlaySKScene as? GameViewOverlay)?.label_scale.text = "Scale"
            (overlaySKScene as? GameViewOverlay)?.label_info.isHidden = true

        } else {
            let result: AnyObject = hitResults[0]
            if result is SCNHitTestResult {
                selection = result as? SCNHitTestResult
            }
            
            // Gizmo Position
            [pos, scl, rot].forEach {
                self.scene?.rootNode.addChildNode($0)
                $0.position = (selection?.node.position)!
                $0.isHidden = true
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
                (overlaySKScene as? GameViewOverlay)?.label_name.text = "Name : \(String(describing: selection!.node.name!.lowercased()))"
                (overlaySKScene as? GameViewOverlay)?.label_position.text = "Position : \(String(describing: selection!.node.position.xyz))"
                (overlaySKScene as? GameViewOverlay)?.label_rotate.text = "Rotate : \(String(describing: selection!.node.rotation))"
                (overlaySKScene as? GameViewOverlay)?.label_scale.text = "Scale : \(selection!.node.scale.xyz)"
                
                selection?.node.geometry!.firstMaterial!.emission.contents = (selection?.node.geometry != nil) ? Color.red : Color.yellow
                
                (overlaySKScene as? GameViewOverlay)?.label_info.isHidden = false
                (overlaySKScene as? GameViewOverlay)?.label_info.text = "aaa"
            }
        }
//        self.allowsCameraControl = (hitResults.count == 0)
        super.mouseDown(with: event)
    }
    
    private func cameraZaxis(_ view:SCNView) -> SCNVector3 {
        let cameraMat = view.pointOfView!.transform
        return SCNVector3Make(cameraMat.m31, cameraMat.m32, cameraMat.m33) * -1
    }
    
    var deformData:DeformData? = nil
    
    override func mouseDragged(with event: NSEvent) {
        let mouse   = self.convert(event.locationInWindow, from: self)
        
        var hitTests = self.hitTest(mouse, options: nil)
        var result = hitTests[0]
        
        if hitTests.count > 0 && isDeforming {
            let loc = result.localCoordinates
            let globalDir = self.cameraZaxis(self) * -1
            let localDir  = result.node.convertPosition(globalDir, from: nil)
            let dir = localDir
            
            let dd = DeformData(location: float3(loc), direction: float3(loc),
                                radiusSquared:16.0, deformationAmplitude: 1.5, pad1: 0, pad2: 0)
            self.deformData = dd
            return
        }
        
        if selection != nil {
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
        
        if isEdit {
            let asset = USDExporter.exportFromAsset(scene: self.scene!)
            self.scene = SCNScene(mdlAsset: asset)
            isEdit = false
        }
        // Update Position
        isDeforming = false
        self.gestureRecognizers.forEach {$0.isEnabled = true}
        
        self.allowsCameraControl = true
        p = self.convert(event.locationInWindow, to: nil)
        needsDisplay = true
    }
    
    func setMode(_mode: EditMode) { mode = _mode }
    func setPart(_part: PartMode) { part = _part }
    
    func resetView(_mode: EditMode = EditMode.ObjectMode,
                   _part: PartMode = PartMode.ObjectMode) {
        
        // Node

        let vNode = self.scene?.rootNode
        
        switch _mode {
        case .PositionMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = true
            
        case .ScaleMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = true
            
        case .RotateMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = false
            
        default:
            vNode?.childNode(withName: "pos", recursively: true)?.removeFromParentNode()
            vNode?.childNode(withName: "scl", recursively: true)?.removeFromParentNode()
            vNode?.childNode(withName: "rot", recursively: true)?.removeFromParentNode()
        }
        
        // Parts
        switch _part {
        case .VertexMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true
            
        case .EdgeMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true
            
        case .FaceMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true
            
        default:
            vNode?.enumerateChildNodes({ child, _ in
                if child.categoryBitMask == 2 {
                    child.removeFromParentNode()
                }
            })
        }
        
        // reset emissions
        vNode?.enumerateChildNodes({ child, _ in
            if let geo = child.geometry {
                geo.firstMaterial?.emission.contents = Color.black
            }
        })
        
        self.setMode(_mode: _mode)
        self.setPart(_part: _part)
    }
    
    /*
     * Mark : Key Event
     */
    
    override func keyDown(with event: NSEvent) {
        
        switch event.modifierFlags.intersection(NSEvent.ModifierFlags.deviceIndependentFlagsMask) {
            
        case [NSEvent.ModifierFlags.shift]:
            print("shift key is pressed")
        case [NSEvent.ModifierFlags.control]:
            print("control key is pressed")
        case [NSEvent.ModifierFlags.option]:
            print("option key is pressed")
        case [NSEvent.ModifierFlags.command]:
            print("Command key is pressed")
        default:
            print (event.characters!)
        }
        
        switch event.characters! {
            
        case "q":
            self.getModels()
            
        case "w":
            self.resetView(_mode: .PositionMode)
            
        case "e":
            self.resetView(_mode: .ScaleMode)
            
        case "r":
            self.resetView(_mode: .RotateMode)
            
        case "a":
            self.setPart(_part: .ObjectMode)
            
        case "s":
            self.setPart(_part: .VertexMode)
            
        case "d":
            self.setPart(_part: .EdgeMode)
            
        case "f":
            self.setPart(_part: .VertexMode)
            
        case "z":
//                        gitRevert()
            return
            
        case "x":
            self.setModels()
            
        case "c":
            self.copyModels()
            
        case "v":
            self.getModels()
            
        case "":
            self.changeMode()

            
        default:
            break
        }
        // View Update
        self.draw(NSRect(x: 0, y: 0, width: 1000, height: 1000))
        self.needsDisplay = true
        super.keyDown(with: event)
    }
    
    private var i = 0
    
    func changeMode() {
        if SCNOptions.count == i {
            i = 0
        }
        self.debugOptions.update(with: SCNOptions[i])
        i += 1
    }
    
    var models : [SCNNode] = []
    
    func copyModels() {
        models.removeAll()
        var tmp : [SCNNode] = []
        self.scene?.rootNode.enumerateChildNodes({ child, _ in
            if child.geometry != nil && child.categoryBitMask != 2 {
                tmp.append(child.clone())
            }
        })
        models = tmp
    }
    
    func setModels () {
        models.removeAll()
        
        var tmp : [SCNNode] = []
        self.scene?.rootNode.enumerateChildNodes({ child, _ in
            if child.geometry != nil && child.categoryBitMask != 2 {
                tmp.append(child.clone())
                child.removeFromParentNode()
            }
        })
        models = tmp
    }
    
    func getModels() {
        models.forEach {
            self.scene?.rootNode.addChildNode($0)
        }
        models.removeAll()
    }
}

