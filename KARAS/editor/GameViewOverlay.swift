//
//  GameViewOverlay.swift
//  KARAS
//
//  Created by sumioka-air on 2017/05/03.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SpriteKit
import SceneKit
import QuartzCore

class ButtonOverlay: SKNode {

    private var inner: SKShapeNode!
    private var label: SKLabelNode!
    private var background: SKShapeNode!

    func buildPad(_ text: NSString) {
//        let backgroundRect = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height))
        background = SKShapeNode()
//        background.path = CGPath( ellipseIn: backgroundRect, transform: nil)
        background.strokeColor = SKColor.black
        background.lineWidth = 3.0
        addChild(background)

        inner = SKShapeNode()
//        inner.path = CGPath( ellipseIn: CGRect( x: 0, y: 0, width: innerSize.width, height: innerSize.height ), transform: nil)
        inner.lineWidth = 1.0
        inner.fillColor = SKColor.white
        inner.strokeColor = SKColor.gray
        addChild(inner)

        label = SKLabelNode()
//        label!.fontName = UIFont.boldSystemFont(ofSize: 24).fontName
        label!.fontSize = 24
        label!.fontColor = SKColor.black
        label?.verticalAlignmentMode = .center
        label?.horizontalAlignmentMode = .center
//        label?.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0 + 1.0)
        label?.text = text as String
        addChild(label!)
    }

    override func mouseDown(with event: NSEvent) {


        super.mouseDown(with: event)
    }
}

class GameViewOverlay: SKScene, SKSceneDelegate {

    /*
     -------------------------------------------------
     | name                                          |
     | transform                                     |
     | rotate          ___________                 ◆ |
     | scale          |           |                ◆ |
     | info           |           |                ◆ |
     |                |           |                ◆ |
     |                |           |                ◆ |
     |                |           |                ◆ |
     |                 -----------                 ◆ |
     |                                               |
     |               status message              HUD |
     -------------------------------------------------
     */

    var label_name: SKLabelNode!
    var label_position: SKLabelNode!
    var label_rotate: SKLabelNode!
    var label_scale: SKLabelNode!
    var label_info: SKLabelNode!
    var label_message: SKLabelNode!

    var button_red: SKShapeNode!
    var button_blue: SKShapeNode!
    var button_green: SKShapeNode!

    var sk3d: SK3DNode!

    init(size: CGSize, view: GameView) {
        super.init(size: size)
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill

        // text
        self.label_name = mLabel(user: "Name")
        self.label_position = mLabel(user: "Position")
        self.label_rotate = mLabel(user: "Rotate")
        self.label_scale = mLabel(user: "Scale")
        self.label_info = mLabel(user: "Info")
        self.label_message = mLabel(user: "")

        // HUD
        button_red = mButton(user: "red")
        button_red.fillColor = Color.red

        button_green = mButton(user: "green")
        button_green.fillColor = Color.green

        button_blue = mButton(user: "blue")
        button_blue.fillColor = Color.blue

        // 3D headsUp
        var scnScene: SCNScene = {
            let scnScene = view.scene
            let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
            let torusNode = SCNNode(geometry: torusGeometry)
            torusNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2, y: 0, z: 0)
            scnScene?.rootNode.addChildNode(torusNode)
            return scnScene!
        }()

        //TODO: `depthAttachmentPixelFormat (MTLPixelFormatDepth32Float) and stencilAttachmentPixelFormat (MTLPixelFormatStencil8) must match.'
        sk3d = SK3DNode()
        sk3d.name = "headsUp"
//        sk3d.scnScene = scnScene

        [label_name, label_position, label_rotate, label_scale, label_info, button_red, button_green, button_blue, sk3d, label_message].forEach {
            self.addChild(($0))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

internal class BaseNode: SCNNode {

    // variable
    let axisLen = SCNFloat(8.0)
    let offset = SCNFloat(8.0 / 2.0)
    let axisSide = SCNFloat(0.2)
    let radius = SCNFloat(0.2)

    var serialize: Bool {
        return false
    }

    required override init() {
        super.init()
        super.isHidden = true
        super.renderingOrder = 1
        super.categoryBitMask = 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("miss")
    }
}

// sceneeditor みたいに統合していい気がする

final class PositionNode: BaseNode {

    public required init() {

        super.init()
        self.name = "pos"

        // Line
        let xLine = SCNBox(width: axisLen, height: axisSide, length: axisSide, chamferRadius: radius)
        let yLine = SCNBox(width: axisSide, height: axisLen, length: axisSide, chamferRadius: radius)
        let zLine = SCNBox(width: axisSide, height: axisSide, length: axisLen, chamferRadius: radius)

        // Cone
        let xBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2)
        let yBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2)
        let zBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2)

        // color
        xLine.firstMaterial?.diffuse.contents = Color.red
        xBox.firstMaterial?.diffuse.contents = Color.red
        yLine.firstMaterial?.diffuse.contents = Color.green
        yBox.firstMaterial?.diffuse.contents = Color.green
        zLine.firstMaterial?.diffuse.contents = Color.blue
        zBox.firstMaterial?.diffuse.contents = Color.blue
        [xLine, xBox, yLine, yBox, zLine, zBox].forEach {
            $0.firstMaterial?.lightingModel = .constant
        }

        // Node
        let xLineNode = SCNNode(geometry: xLine)
        let yLineNode = SCNNode(geometry: yLine)
        let zLineNode = SCNNode(geometry: zLine)

        xLineNode.position.x = offset
        yLineNode.position.y = offset
        zLineNode.position.z = offset

        let xBoxNode = SCNNode(geometry: xBox)
        let yBoxNode = SCNNode(geometry: yBox)
        let zBoxNode = SCNNode(geometry: zBox)

        xBoxNode.position = SCNVector3Make(xLine.width / 2, 0, 0)
        yBoxNode.position = SCNVector3Make(0, yLine.height / 2, 0)
        zBoxNode.position = SCNVector3Make(0, 0, zLine.length / 2)

        xBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 1)
        yBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 0)
        zBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), -1, 0, 0)

        // control
        let control = SCNBox(width: axisLen, height: axisLen, length: axisLen, chamferRadius: 0)
        control.firstMaterial?.diffuse.contents = Color.gray
        let controlNode = SCNNode(geometry: control)
        controlNode.opacity = 0.05
        controlNode.position = SCNVector3Make(xLine.width / 2, axisLen / 2, zLine.width / 2)

        // append
        xLineNode.addChildNode(xBoxNode)
        yLineNode.addChildNode(yBoxNode)
        zLineNode.addChildNode(zBoxNode)

        xLineNode.name = "xmove"
        yLineNode.name = "ymove"
        zLineNode.name = "zmove"
        controlNode.name = "amove"

        [controlNode, xLineNode, yLineNode, zLineNode, xBoxNode, yBoxNode, zBoxNode].forEach {
            if $0 == controlNode || $0 == xLineNode || $0 == yLineNode || $0 == zLineNode {
                self.addChildNode($0)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("miss")
    }
}

final class RotateNode: BaseNode {

    public required init() {

        super.init()
        self.name = "rot"

        // Line
        let xCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)
        let yCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)
        let zCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)

        xCircle.firstMaterial?.diffuse.contents = Color.red
        yCircle.firstMaterial?.diffuse.contents = Color.green
        zCircle.firstMaterial?.diffuse.contents = Color.blue

        [xCircle, yCircle, zCircle].forEach {
            $0.radialSegmentCount = 192
            $0.firstMaterial?.lightingModel = .constant
        }

        // Node
        let xCircleNode = SCNNode(geometry: xCircle)
        let yCircleNode = SCNNode(geometry: yCircle)
        let zCircleNode = SCNNode(geometry: zCircle)

        let deg = 90 * (SCNFloat.pi / 180)
        xCircleNode.eulerAngles = SCNVector3(0, 0, deg)
        yCircleNode.eulerAngles = SCNVector3(0, 0, 0)
        zCircleNode.eulerAngles = SCNVector3(deg, 0, 0)

        // control
        let control = SCNSphere(radius: 8)
        control.firstMaterial?.diffuse.contents = Color.gray
        let controlNode = SCNNode(geometry: control)
        controlNode.opacity = 0.05

        xCircleNode.name = "xrotate"
        yCircleNode.name = "yrotate"
        zCircleNode.name = "zrotate"
        controlNode.name = "arotate"

        // append
        [controlNode, xCircleNode, yCircleNode, zCircleNode].forEach {
            self.addChildNode($0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("miss")
    }
}

final class ScaleNode: BaseNode {

    public required init() {

        super.init()
        self.name = "scl"

        // Line
        let xLine = SCNBox(width: axisLen, height: axisSide, length: axisSide, chamferRadius: radius)
        let yLine = SCNBox(width: axisSide, height: axisLen, length: axisSide, chamferRadius: radius)
        let zLine = SCNBox(width: axisSide, height: axisSide, length: axisLen, chamferRadius: radius)

        // Box
        let xBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let yBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let zBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)

        // color
        xLine.firstMaterial?.diffuse.contents = Color.red
        xBox.firstMaterial?.diffuse.contents = Color.red
        yLine.firstMaterial?.diffuse.contents = Color.green
        yBox.firstMaterial?.diffuse.contents = Color.green
        zLine.firstMaterial?.diffuse.contents = Color.blue
        zBox.firstMaterial?.diffuse.contents = Color.blue
        [xLine, xBox, yLine, yBox, zLine, zBox].forEach {
            $0.firstMaterial?.lightingModel = .constant
        }

        // Node
        let xLineNode = SCNNode(geometry: xLine)
        let yLineNode = SCNNode(geometry: yLine)
        let zLineNode = SCNNode(geometry: zLine)

        xLineNode.position.x = offset
        yLineNode.position.y = offset
        zLineNode.position.z = offset

        let xBoxNode = SCNNode(geometry: xBox)
        let yBoxNode = SCNNode(geometry: yBox)
        let zBoxNode = SCNNode(geometry: zBox)

        xBoxNode.position = SCNVector3Make(xLine.width / 2, 0, 0)
        yBoxNode.position = SCNVector3Make(0, yLine.height / 2, 0)
        zBoxNode.position = SCNVector3Make(0, 0, zLine.length / 2)

        // control
        let control = SCNBox(width: axisLen, height: axisLen, length: axisLen, chamferRadius: 0)
        control.firstMaterial?.diffuse.contents = Color.gray
        let controlNode = SCNNode(geometry: control)
        controlNode.opacity = 0.05
        controlNode.position = SCNVector3Make(xLine.width / 2, axisLen / 2, zLine.width / 2)

        // append
        xLineNode.addChildNode(xBoxNode)
        yLineNode.addChildNode(yBoxNode)
        zLineNode.addChildNode(zBoxNode)

        xLineNode.name = "xscale"
        yLineNode.name = "yscale"
        zLineNode.name = "zscale"
        controlNode.name = "ascale"

        [controlNode, xLineNode, yLineNode, zLineNode].forEach {
            self.addChildNode($0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("miss")
    }
}

extension SKScene {
    /*
     * sceneの中心の座標を返すメソッド
     */
    func GetMid() -> CGPoint {
        return CGPoint(x: self.frame.midX, y: self.frame.midY)
    }

    func mLabel(user : String) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "AvenirNext-Bold")
        label.text = user
        label.name = user
        label.fontSize = 12
        label.horizontalAlignmentMode = .left
        label.verticalAlignmentMode = .bottom
        return label
    }

    func mButton(user : String) -> SKShapeNode {
        let btn = SKShapeNode(rectOf: CGSize(width: 16.0, height: 16.0))
        btn.name = user
        return btn
    }
}

func vertices(node: SCNNode) -> [SCNVector3] {

    // geo source
    let planeSources = node.geometry?.sources(
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

    let vectors = vertices(node: node)
    for (index, vec) in vectors.enumerated() {
        NSLog("\(vec)")
        let pointNode = node.flattenedClone()
        pointNode.name = "vertex_\(index)"
//        pointNode.position = self.projectPoint(vec)
        result.node.addChildNode(pointNode)
    }
}

func lines(result: SCNHitTestResult) {
    let node = SCNNode()
    node.categoryBitMask = 2

    for (index, vec) in vertices(node: node).enumerated() {
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

//func faces(result: SCNHitTestResult) {
//    let planeSources = selection?.node.geometry?.sources(for:SCNGeometrySource.Semantic.normal)
//    planeSources?.index(after: 0)
//
//    let material = result.node.geometry!.firstMaterial!
//    material.emission.contents = Color.green
//}
