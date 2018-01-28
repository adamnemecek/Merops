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

class GameViewOverlay: SKScene, SKSceneDelegate, SCNSceneRendererDelegate {
    
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
    
    var label_name : SKLabelNode!
    var label_position : SKLabelNode!
    var label_rotate : SKLabelNode!
    var label_scale : SKLabelNode!
    
    init(size: CGSize, view: GameView){
        
        super.init(size: size)
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill
        
        // text
        self.label_name = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_position = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_rotate = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_scale = SKLabelNode(fontNamed: "AvenirNext-Bold")
        
        self.label_name.fontSize = 8
        self.label_position.fontSize = 8
        self.label_rotate.fontSize = 8
        self.label_scale.fontSize = 8
        
//        view.scene?.rootNode.enumerateChildNodes({ child, _ in
            self.label_name.text = "name" //child.name
            self.label_position.text = "position" // String(describing: child.position)
            self.label_rotate.text = "rotate" // String(describing: child.rotation)
            self.label_scale.text = "scale" //String(describing: child.scale)
//        })
        
        // position
        for (index, item) in [label_name, label_position, label_rotate, label_scale].enumerated() {
            item?.horizontalAlignmentMode = .left
            item?.verticalAlignmentMode = .bottom
            item?.position = CGPoint(x: -size.width/2 + 20,
                                     y: size.height/2 - CGFloat(24 * (index + 1))
            )
            self.addChild(item!)
        }
        
        // 3D guide
        let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
        let torusNode = SCNNode(geometry: torusGeometry)
        torusNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2, y: 0, z: 0)
        view.scene?.rootNode.addChildNode(torusNode)
        
        // HUD
        let redRect = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        redRect.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 76)
        redRect.fillColor = Color.red
        self.addChild(redRect)
        
        let greenRect = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        greenRect.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 52)
        greenRect.fillColor = Color.green
        self.addChild(greenRect)
        
        let blueRect = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        blueRect.position = CGPoint(x: size.width/2 - 18, y: -size.height/2 + 28)
        blueRect.fillColor = Color.blue
        self.addChild(blueRect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout2DOverlay() {

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
