//
//  GameView.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import SceneKit

let SCNoptions: [SCNDebugOptions] = [
    .showPhysicsShapes,
    .showBoundingBoxes,
    .showLightInfluences,
    .showLightExtents,
    .showPhysicsFields,
    .showWireframe
]

class GameView: SCNView {

    /* ------------------------
     
     Top Node
     
     ------------------------ */

    let pos = PositionNode()
    let scl = ScaleNode()
    let rot = RotateNode()
    
    var p = CGPoint()
    weak var selectedNode: SCNNode?
    weak var releasedNode: SCNNode?

    var pointNode: SCNNode?

    /* ------------------------
     
     Mode & Part
     
     ------------------------ */

    var mode = EditMode.ObjectMode

    func setMode(_mode: EditMode) {
        mode = _mode
    }

    var part = PartMode.ObjectMode

    func setPart(_part: PartMode) {
        part = _part
    }

    func vertices() -> [SCNVector3] {

        // geo source
        let planeSources = selectedNode?.geometry?.getGeometrySources(for:
        SCNGeometrySource.Semantic.vertex),
                planeSource = planeSources?.first

        // Data
        let stride = planeSource?.dataStride,
                offset = planeSource?.dataOffset,
                componentsPerVector = planeSource?.componentsPerVector,
                bytesPerVector = componentsPerVector! * (planeSource?.bytesPerComponent)!,
                vectors = [SCNVector3](repeating: SCNVector3Zero, count: (planeSource?.vectorCount)!)

        // copy vertices
        let vertices = vectors.enumerated().map({ (index: Int, _) -> SCNVector3 in

            var vectorData = [UInt8](repeating: 0, count: componentsPerVector!)
            planeSource?.data.copyBytes(to: &vectorData,
                    from: NSMakeRange(index * stride! + offset!, bytesPerVector).toRange()!)

            return SCNVector3Make(SCNFloat(vectorData[0]),
                    SCNFloat(vectorData[1]),
                    SCNFloat(vectorData[2]))
        })
        return vertices
    }

    /* ------------------------
     
     NOTE: points, lines, faces
     
     ------------------------ */
    func points(result: SCNHitTestResult) {
        let node = SCNNode(geometry: SCNSphere(radius: 0.3))

        for (index, vec) in vertices().enumerated() {
            NSLog("\(vec)")
            pointNode = node.flattenedClone()
            pointNode?.name = "vertex_\(index)"
            pointNode?.position = self.projectPoint(vec)
            result.node.addChildNode(pointNode!)
        }
    }

    func lines(result: SCNHitTestResult) {
        let node = SCNNode()

        for (index, vec) in vertices().enumerated() {
            let source = SCNGeometrySource(vertices: [vec, vec]),
                    indices: [UInt8] = [0, 1],
                    data = Data(bytes: indices),
                    element = SCNGeometryElement(data: data, primitiveType: .line, primitiveCount: 1, bytesPerIndex: 1)

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

//        let planeSources = result.node.geometry?
//            .getGeometrySources(for:SCNGeometrySource.Semantic.normal)
//        
        let material = result.node.geometry!.firstMaterial!
        material.emission.contents = Color.green
    }

    /* ------------------------
     
     Mouse Event
     NOTE: arrowsCameraControl プロパティと干渉するのでView側に配置
     
     ------------------------ */

    override func draw(_ dirtyRect: NSRect) {

        super.draw(dirtyRect)
        let hitResults = self.hitTest(p, options: [:])
        if hitResults.count == 0 {
            return
        }

        // Visible Part
        let result: SCNHitTestResult = hitResults[0]
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

    override func mouseDown(with event: NSEvent) {
        
        super.mouseDown(with: event)
        p = self.convert(event.locationInWindow, from: nil)
        let hitResults = self.hitTest(p, options: [:])

        if hitResults.count == 0 {

            // remove Gizmo
            self.scene?.rootNode.childNode(withName: "pos", recursively: true)?.removeFromParentNode()
            self.scene?.rootNode.childNode(withName: "scl", recursively: true)?.removeFromParentNode()
            self.scene?.rootNode.childNode(withName: "rot", recursively: true)?.removeFromParentNode()

            // reset Mat
            self.scene?.rootNode.enumerateChildNodes({ child, _ in
                if let geo = child.geometry {
                    geo.firstMaterial?.emission.contents = Color.black
                }
            })

            // nil SCNNode
            self.releasedNode = self.selectedNode
            self.selectedNode = nil

        } else {

            let result = hitResults[0]
            self.selectedNode = result.node
            self.releasedNode = nil

            // Set Gizmo
            for giz in [pos, scl, rot] {
                self.scene?.rootNode.addChildNode(giz)
                giz.position = result.node.position
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
                result.node.geometry!.firstMaterial!.emission.contents =
                (result.node.geometry != nil) ? Color.red
                        : Color.yellow
            }
        }
    }

    override func mouseDragged(with event: NSEvent) {

        super.mouseDragged(with: event)
        p = self.convert(event.locationInWindow, from: nil)

        // Coordinates
        let x = self.unprojectPoint(SCNVector3(x: p.x, y: p.y, z: 0.94)).x,
                y = self.unprojectPoint(SCNVector3(x: p.x, y: p.y, z: 0.94)).y,
                z = self.selectedNode != nil ? self.selectedNode!.position.z : 0

        // Transform Node
        let hitResults = self.hitTest(p, options: [:])
        for hit in hitResults {
            switch hit.node.name! {
            case "pos":
                releasedNode?.position = SCNVector3(x: x, y: y, z: z)

            case "rot":
                releasedNode?.eulerAngles = SCNVector3(x: x, y: y, z: z)

            case "scl":
                releasedNode?.scale = SCNVector3(x: x, y: y, z: z)

            default:
                break
            }
        }

        NSLog("\(String(describing: releasedNode))")
        needsDisplay = true
    }

    override func mouseUp(with event: NSEvent) {

        super.mouseUp(with: event)
        self.allowsCameraControl = true

        // Update Position
        p = self.convert(event.locationInWindow, to: nil)
        needsDisplay = true
    }
}
