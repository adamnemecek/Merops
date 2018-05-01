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

class GameViewOverlay: SKScene, SKSceneDelegate {

    /*
     -------------------------------------------------
     | name                                          |
     | transform                                     |
     | rotate                                        |
     | scale                                         |
     |                                               |
     |                                               |
     |                                               |
     |                                               |
     |                                               |
     |                                               |
     |                                           HUD |
     -------------------------------------------------
     */

    var label_name: SKLabelNode!
    var label_position: SKLabelNode!
    var label_rotate: SKLabelNode!
    var label_scale: SKLabelNode!
    var label_info: SKLabelNode!

    var button_red: SKShapeNode!
    var button_blue: SKShapeNode!
    var button_green: SKShapeNode!

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

        // HUD
        button_red = mButton(user: "red")
        button_red.fillColor = Color.red

        button_green = mButton(user: "green")
        button_green.fillColor = Color.green

        button_blue = mButton(user: "blue")
        button_blue.fillColor = Color.blue

        [label_name, label_position, label_rotate, label_scale, label_info, button_red, button_green, button_blue].forEach {
            self.addChild(($0))
        }
    }

    func headsUp(_view: GameView) {
//        let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
//        let torusNode = SCNNode(geometry: torusGeometry)
//        scnScene.rootNode.addChildNode(torusNode)
//            let scnScene = _view.scene
//
            let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
            let torusNode = SCNNode(geometry: torusGeometry)
            torusNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2, y: 0, z: 0)
            _view.scene?.rootNode.addChildNode(torusNode)
//            return scnScene!
//        }

        let node = SK3DNode(viewportSize: CGSize(width: 200, height: 200))
        node.scnScene = _view.scene
        self.addChild(node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

