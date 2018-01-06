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
    
    var label_name : SKLabelNode!
    var label_position : SKLabelNode!
    var label_rotate : SKLabelNode!
    var label_scale : SKLabelNode!
    
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
    
    
    init(size: CGSize, view: GameView){
        
        super.init(size: size)
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill
        
        self.label_name = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_position = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_rotate = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_scale = SKLabelNode(fontNamed: "AvenirNext-Bold")
        
        self.label_name.text = "name" //child.name
        self.label_position.text = "position" // String(describing: child.position)
        self.label_rotate.text = "rotate" // String(describing: child.rotation)
        self.label_scale.text = "scale" //String(describing: child.scale)
        
        view.scene?.rootNode.enumerateChildNodes({ child, _ in
            self.label_name.text = "name" //child.name
            self.label_position.text = "position" // String(describing: child.position)
            self.label_rotate.text = "rotate" // String(describing: child.rotation)
            self.label_scale.text = "scale" //String(describing: child.scale)
        })
    
        for (index, item) in [label_name, label_position, label_rotate, label_scale].enumerated() {
            item?.horizontalAlignmentMode = .left
            item?.verticalAlignmentMode = .bottom
            item?.position = CGPoint(x: -size.width/2 + 20, y: size.height/2 - CGFloat(32	 * index))
            self.addChild(item!)
        }
        
        // 3D guide
        let scnScene: SCNScene = {
            let scnScene = SCNScene()
            let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
            let torusNode = SCNNode(geometry: torusGeometry)
            torusNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2, y: 0, z: 0)
            scnScene.rootNode.addChildNode(torusNode)
            return scnScene
        }()
        let node = SK3DNode(viewportSize: CGSize(width: 200, height: 200))
        node.scnScene = scnScene
//        self.addChild(node)
        
//        self.delegate = view.delegate as! SKSceneDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout2DOverlay() {
        let prop = SKLabelNode()
        prop.text = "aaa"
        prop.position = CGPoint(x: 100, y: 100)
        self.addChild(prop)
    }
    
    func layoutButton() {
        for i in 0..<4 {
            let btn = SKSpriteNode(color: Color(hue: 0, saturation: 0.8, brightness: 1, alpha: 0.8),
                                   size: CGSize(width: 20, height: 20)
            )
            btn.name = "btn\(i)"
            let p = CGPoint() //view.projectPoint((view.scene?.rootNode.presentation.position)!)
            let x = CGFloat(40 * cos(Float(i) * Float(Double.pi) / 2.0)) + p.x
            let y = CGFloat(40 * sin(Float(i) * Float(Double.pi) / 2.0)) + p.y
            btn.position = CGPoint(x: CGFloat(x), y: (view?.bounds.maxY)! - CGFloat(y))
            self.addChild(btn)
        }
    }
    
    override func didMove(to view: SKView) {

        let blueRect = SKShapeNode(
            rect: CGRect(x: 0.0, y: 0.0, width: 150.0, height: 50.0)
        )
        blueRect.position = GetMid()
        blueRect.fillColor = Color.blue
        self.addChild(blueRect)

        let redRect = SKShapeNode(
            rectOf: CGSize(width: 150.0, height: 50.0)
        )
        redRect.position = GetMid()
        redRect.fillColor = Color.red
        self.addChild(redRect)

        let prop = SKLabelNode()
        prop.text = "aaa"
        prop.position = CGPoint(x: 100, y: 100)
        self.addChild(prop)
    }
}

/*
 sceceの中心の座標を返すメソッド
 */
extension SKScene {
    func GetMid() -> CGPoint {
        return CGPoint(x: self.frame.midX, y: self.frame.midY)
    }

    func GetClick() -> CGPoint {
        return CGPoint(x: 0, y: 0)
    }
}
