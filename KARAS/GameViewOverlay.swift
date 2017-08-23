//
//  GameViewOverlay.swift
//  KARAS
//
//  Created by sumioka-air on 2017/05/03.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SpriteKit

class GameViewOverlay : SKScene {
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = false
        
        
        let blueRect = SKShapeNode(rect:
            CGRect(x: 0.0, y: 0.0, width: 150.0, height: 50.0))
        
        blueRect.position = GetMid()
        
        blueRect.fillColor = Color.blue
        
        let redRect = SKShapeNode(rectOf: CGSize(width: 150.0, height: 50.0))
        
        redRect.position = GetMid()
        
        redRect.fillColor = Color.red
        
        let prop = SKLabelNode()
        prop.text = "aaa"
        prop.position = CGPoint(x:100, y:100)
        self.addChild(prop)
        
        prop.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 1),
                SKAction.removeFromParent()
        ]))
    }
}

/*
 sceceの中心の座標を返すメソッド
 */
extension SKScene{
    func GetMid()->CGPoint{
        return CGPoint(x: self.frame.midX, y: self.frame.midY)
    }
    
    func GetClick()->CGPoint {
        return CGPoint(x: 0, y: 0)
    }
}
