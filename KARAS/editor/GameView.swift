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

    var mode = EditMode.PositionMode, part = PartMode.ObjectMode
    let pos = PositionNode()
    let scl = ScaleNode()
    let rot = RotateNode()
    var console: ConsoleView!
    var field: NSTextField!

    func viewDidInit() {

        // Console
        console = ConsoleView(frame: self.frame)
        self.addSubview(console)
        console.isHidden = true

        // Overlay
        let size = self.frame.size

        overRay?.label_name.position = CGPoint(x: -size.width / 2 + 16, y: size.height / 2 - CGFloat(20 * 1))
        overRay?.label_position.position = CGPoint(x: -size.width / 2 + 16, y: size.height / 2 - CGFloat(20 * 2))
        overRay?.label_rotate.position = CGPoint(x: -size.width / 2 + 16, y: size.height / 2 - CGFloat(20 * 3))
        overRay?.label_scale.position = CGPoint(x: -size.width / 2 + 16, y: size.height / 2 - CGFloat(20 * 4))
        overRay?.label_info.position = CGPoint(x: -size.width / 2 + 16, y: size.height / 2 - CGFloat(20 * 5))
        overRay?.button_red.position = CGPoint(x: size.width / 2 - 18, y: -size.height / 2 + 76)
        overRay?.button_green.position = CGPoint(x: size.width / 2 - 18, y: -size.height / 2 + 52)
        overRay?.button_blue.position = CGPoint(x: size.width / 2 - 18, y: -size.height / 2 + 28)
        overRay?.label_message.position = CGPoint(x: -size.width / 2 + 300, y: -size.height / 2 + 28)

        // Text Field
        field = NSTextField(frame: self.frame)
        field.isHidden = true
    }

    func viewInfoUpdate() {

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
    var marken: SCNNode? = nil
    var selection: SCNHitTestResult? = nil
    var hitOld = SCNVector3Zero

    var deformer = false
    var isCameraCtrl: Bool!
    var isDeforming = false
    var isEdit = false

    override func mouseEntered(with event: Event) {
        // variables
        let options = [
            SCNHitTestOption.sortResults: NSNumber(value: true),
            SCNHitTestOption.boundingBoxOnly: NSNumber(value: true),
        ]
        p = self.convert(event.locationInWindow, from: nil)
        let hitResults = self.hitTest(p, options: options)

        // variables
        let result: AnyObject = hitResults[0]
        if result is SCNHitTestResult {
            selection = result as? SCNHitTestResult
        }

        if let selNode = selection?.node {
            selNode.geometry!.firstMaterial!.emission.contents = Color.yellow
        }

        super.mouseEntered(with: event)
    }

    override func mouseDown(with event: Event) {

        // variables
        let options = [
            SCNHitTestOption.sortResults: NSNumber(value: true),
            SCNHitTestOption.boundingBoxOnly: NSNumber(value: true),
        ]
        p = self.convert(event.locationInWindow, from: nil)
        let hitResults = self.hitTest(p, options: options)

        // HUD event
        let skScene = (overlaySKScene as? GameViewOverlay)!
        let _p = skScene.convertPoint(fromView: event.locationInWindow)

        if let first = skScene.nodes(at: _p).first {
            switch first.name {
            case "Name":
                field.stringValue = (first as! SKLabelNode).text!
                field.isHidden = false
                    //                (first as! SKLabelNode).position

            case "Position", "Rotate", "Scale":
                field.stringValue = (first as! SKLabelNode).text!
                field.isHidden = false
                    //                (first as! SKLabelNode).position

            case "Info":
                break

            case "red":
                Builder.Cone(scene: self.scene!)

            case "blue":
                Builder.Grid(scene: self.scene!)

            case "green":
                Builder.Torus(scene: self.scene!)

            default:
                break
            }
        }

        isDeforming = hitResults.count > 0 && part == PartMode.VertexMode
        if isDeforming {
            self.gestureRecognizers.forEach {
                $0.isEnabled = false
            }
        }

        if hitResults.count == 0 {

            // remove Gizmo
            [pos, scl, rot].forEach {
                $0.removeFromParentNode()
            }

            // reset Materials
            root.enumerateChildNodes({ child, _ in
                if let geo = child.geometry {
                    geo.firstMaterial?.emission.contents = Color.black
                }
            })

            // reset labels
            overRay?.label_name.text = "Name"
            overRay?.label_position.text = "Position"
            overRay?.label_rotate.text = "Rotate"
            overRay?.label_scale.text = "Scale"
            overRay?.label_info.isHidden = true

        } else {

            // variables
            let result: AnyObject = hitResults[0]
            if result is SCNHitTestResult {
                selection = result as? SCNHitTestResult
            }

            if let selNode = selection?.node {

                // HUD info
                overRay?.label_name.text = "Name: \(String(describing: selNode.name!))"
                overRay?.label_position.text = "Position: \(String(describing: selNode.position.xyz))"
                overRay?.label_rotate.text = "Rotate: \(String(describing: selNode.rotation))"
                overRay?.label_scale.text = "Scale: \(selNode.scale.xyz)"
                overRay?.label_info.text = "Info: \(selNode.scale.xyz)"
                overRay?.label_info.isHidden = false

                // reset color
                selNode.geometry!.firstMaterial!.emission.contents =
                        (selNode.geometry != nil) ? Color.red : Color.yellow

                // Gizmo
                [pos, scl, rot].forEach {
                    root.addChildNode($0)
                    $0.position = (selection?.node.position)!
                    $0.isHidden = true
                }

                switch mode {
                case .PositionMode:
                    node(name: "pos")?.isHidden = false

                case .ScaleMode:
                    node(name: "scl")?.isHidden = false

                case .RotateMode:
                    node(name: "rot")?.isHidden = false

                default:
                    break
                }
            }
        }

        self.allowsCameraControl = (hitResults.count == 0)
        super.mouseDown(with: event)
    }


    // Draggable
    var deformData: DeformData? = nil

    private func cameraZaxis(_ view: SCNView) -> SCNVector3 {
        let cameraMat = view.pointOfView!.transform
        return SCNVector3Make(cameraMat.m31, cameraMat.m32, cameraMat.m33) * -1
    }

    override func mouseDragged(with event: Event) {
        let mouse = self.convert(event.locationInWindow, from: self)

        var hitTests = self.hitTest(mouse, options: nil)
        let result = hitTests[0]

        if isDeforming {
            let loc = result.localCoordinates
            let globalDir = self.cameraZaxis(self) * -1
            let localDir = result.node.convertPosition(globalDir, from: nil)
            let dir = localDir

            let dd = DeformData(location: float3(loc),
                    direction: float3(loc),
                    radiusSquared: 16.0, deformationAmplitude: 1.5, pad1: 0, pad2: 0
            )
            self.deformData = dd
            return
        }

        if selection != nil && mode == EditMode.PositionMode {
            var unPoint = self.unprojectPoint(SCNVector3(x: mouse.x, y: mouse.y, z: 0.0))
            let p1 = selection!.node.parent!.convertPosition(unPoint, from: nil)
            unPoint = self.unprojectPoint(SCNVector3(x: mouse.x, y: mouse.y, z: 1.0))
            let p2 = selection!.node.parent!.convertPosition(unPoint, from: nil)

            let m = p2 - p1, e = selection!.localCoordinates, n = selection!.localNormal
            let t = ((e * n) - (p1 * n)) / (m * n)
            let hit = SCNVector3(
                    x: (t * m.x).x + p1.x,
                    y: (t * m.y).y + p1.y,
                    z: (t * m.z).z + p1.z
            )
            let offset = (hit - hitOld) * 100
            hitOld = hit

            if marken != nil {
                [marken!, pos, scl, rot].forEach {
                    $0.position = marken!.position + offset
                }

            } else {
                marken = selection!.node.clone()
                marken!.opacity = 0.333

                switch part {

                case .FaceMode:
                    marken = marken?.copy() as? SCNNode
                    marken = SCNNode(geometry:
                    SCNGeometry(
                            sources: (marken?.geometry?.sources)!, elements: marken?.geometry?.elements
                    )
                    )

                    marken!.position = selection!.node.position
                    selection!.node.parent!.addChildNode(marken!)

                case .VertexMode, .EdgeMode:
                    break

                default:
                    [marken!, pos, scl, rot].forEach {
                        $0.position = selection!.node.position
                    }
                    selection!.node.parent!.addChildNode(marken!)
                    overRay?.label_position.text = "Position : \(String(describing: selection!.node.position.xyz))"
                }
            }

        } else {
            super.mouseDragged(with: event)
        }
    }

    override func mouseUp(with event: Event) {

        if selection != nil && marken != nil {

            if event.modifierFlags == Event.ModifierFlags.control {
                marken!.opacity = 1.0

            } else {
                switch part {

                case .VertexMode, .FaceMode, .EdgeMode:
                    break

                default:
                    [selection!.node, pos, scl, rot].forEach {
                        $0.position = selection!.node.convertPosition(
                                marken!.position, from: selection!.node
                        )
                    }
                    overRay?.label_position.text = "Position : \(String(describing: selection!.node.position.xyz))"
                }
                marken!.removeFromParentNode()
            }

            // nil
            selection = nil
            marken = nil

        } else {
            super.mouseUp(with: event)
        }

        // Export
        if isEdit {
            let asset = USDExporter.exportFromAsset(scene: self.scene!)
            self.scene = SCNScene(mdlAsset: asset)
            isEdit = false
        }

        // Update Position
        isDeforming = false
        self.gestureRecognizers.forEach {
            $0.isEnabled = true
        }

//        self.allowsCameraControl = true
        p = self.convert(event.locationInWindow, to: nil)
        needsDisplay = true
    }


    func resetView(_mode: EditMode = EditMode.ObjectMode,
                   _part: PartMode = PartMode.ObjectMode) {

        [pos, scl, rot].forEach {
            root.addChildNode($0)
            if let selNode = selection?.node {
                $0.position = (selNode.position)
            }
            $0.isHidden = true
        }


        // Node
        switch _mode {
        case .PositionMode:
            node(name: "pos")?.isHidden = false
            [node(name: "pos"), node(name: "scl"), node(name: "rot")].forEach {
                if $0?.name != "pos" {
                    $0?.removeFromParentNode()
                }
            }
        case .ScaleMode:
            node(name: "scl")?.isHidden = false
            [node(name: "pos"), node(name: "scl"), node(name: "rot")].forEach {
                if $0?.name != "scl" {
                    $0?.removeFromParentNode()
                }
            }
        case .RotateMode:
            node(name: "rot")?.isHidden = false
            [node(name: "pos"), node(name: "scl"), node(name: "rot")].forEach {
                if $0?.name != "rot" {
                    $0?.removeFromParentNode()
                }
            }
        default:
            [pos, scl, rot].forEach {
                $0?.removeFromParentNode()
            }
        }
        self.setMode(_mode: _mode)

        // Parts
        switch _part {
        case .VertexMode:
            node(name: "Vert")?.isHidden = false

        case .EdgeMode:
            node(name: "Edge")?.isHidden = false

        case .FaceMode:
            node(name: "Face")?.isHidden = false

        default:
            break
        }
        self.setPart(_part: _part)


        // reset emissions
        root.enumerateChildNodes({ child, _ in
            if let geo = child.geometry {
                geo.firstMaterial?.emission.contents = Color.black
            }
        })

        if mode == EditMode.ObjectMode {
            self.defaultCameraController.clearRoll()
//        self.defaultCameraController.pointOfView
        }
    }

    /*
     * Mark : Key Event
     */

    override func keyDown(with event: Event) {
        switch event.characters! {

        case "q":
            self.resetView(_mode: .ObjectMode)

        case "w":
            self.resetView(_mode: .PositionMode)

        case "e":
            self.resetView(_mode: .ScaleMode)

        case "r":
            self.resetView(_mode: .RotateMode)

        case "a":
            self.changeMode()

        case "s":
            self.setPart(_part: .VertexMode)

//        case "d":
//            self.setPart(_part: .EdgeMode)
//
//        case "f":
//            self.setPart(_part: .FaceMode)

//        case "z":
//            gitRevert(url: exportFile.absoluteString)

//        case "x":
//            gitCommit(url: exportFile.absoluteString, msg: "export")

//        case "c":
//            Models.copyModels(<#T##Models#>)

//        case "v":
//            Models.setModels(<#T##Models#>)

        default:
            break
        }

        if event.characters! == "b" &&
                   event.modifierFlags.intersection(Event.ModifierFlags.deviceIndependentFlagsMask) == Event.ModifierFlags.command {
//        if keyConfig(event, "b", Event.ModifierFlags.command) {
            let f = console.isHidden
            console.isHidden = !f
        }


        // View Update
        self.draw(NSRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.needsDisplay = true
        super.keyDown(with: event)
    }


    // view mode
    private var i = 0

    func setMode(_mode: EditMode) {
        mode = _mode
    }

    func setPart(_part: PartMode) {
        part = _part
    }

    private func changeMode() {
        if SCNOptions.count == i {
            i = 0
        }
        self.debugOptions.update(with: SCNOptions[i])
        i += 1
    }
}

extension SCNView {
    internal func keyConfig(event: Event, key: String, sets: Event.ModifierFlags) -> Bool {
        return event.characters! == key && event.modifierFlags.intersection(Event.ModifierFlags.deviceIndependentFlagsMask) == sets
    }

    internal var root: SCNNode {
        return self.scene!.rootNode
    }

    internal var overRay: GameViewOverlay? {
        return (overlaySKScene as? GameViewOverlay)
    }

    internal func node(name: String) -> SCNNode? {
        return self.scene!.rootNode.childNode(withName: name, recursively: true)
    }
}