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
    
    var label_name : SKLabelNode!
    var label_position : SKLabelNode!
    var label_rotate : SKLabelNode!
    var label_scale : SKLabelNode!
    var label_info : SKLabelNode!
    
    var button_red : SKShapeNode!
    var button_blue : SKShapeNode!
    var button_gleen : SKShapeNode!
    
    init(size: CGSize, view: GameView){
        super.init(size: size)
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill
        
        // text
        self.label_name = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_position = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_rotate = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_scale = SKLabelNode(fontNamed: "AvenirNext-Bold")
        self.label_info = SKLabelNode(fontNamed: "AvenirNext-Bold")
        
        self.label_name.text = "Name"
        self.label_position.text = "Position"
        self.label_rotate.text = "Rotate"
        self.label_scale.text = "Scale"
        self.label_info.text = "info"
        
        self.label_info.color = Color.black
        
        // property
        [label_name, label_position, label_rotate, label_scale, label_info].forEach {
            $0?.fontSize = 12
            $0?.horizontalAlignmentMode = .left
            $0?.verticalAlignmentMode = .bottom
            self.addChild(($0)!)
        }
        
        // HUD
        button_red = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        button_red.name = "red"
        button_red.fillColor = Color.red
        self.addChild(button_red)
        
        button_gleen = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        button_gleen.name = "green"
        button_gleen.fillColor = Color.green
        self.addChild(button_gleen)
        
        button_blue = SKShapeNode(
            rectOf: CGSize(width: 16.0, height: 16.0)
        )
        button_blue.name = "blue"
        button_blue.fillColor = Color.blue
        self.addChild(button_blue)
    }
    
    func radialMenu() {
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
    
    func headsup (_view: GameView) {
        let scnScene: SCNScene = {
            let scnScene = _view.scene
            
            let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
            let torusNode = SCNNode(geometry: torusGeometry)
            torusNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2, y: 0, z: 0)
            scnScene?.rootNode.addChildNode(torusNode)
            return scnScene!
        }()
        
        let node = SK3DNode(viewportSize: CGSize(width: 200, height: 200))
        node.scnScene = scnScene
        self.addChild(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/*
 sceceの中心の座標を返すメソッド
 */
extension SKScene {
    func GetMid() -> CGPoint {
        return CGPoint(x: self.frame.midX, y: self.frame.midY)
    }
}
