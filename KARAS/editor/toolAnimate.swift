//
//  KAnimation.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/20.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit

func loadAnim(baseNode: SCNNode) {
    let url = Bundle.main.url(forResource: "art.scnassets/boss_attack", withExtension: "dae")
    let sceneSource = SCNSceneSource(url: url!, options: [
        SCNSceneSource.LoadingOption.animationImportPolicy: SCNSceneSource.AnimationImportPolicy.doNotPlay
        ])
    
    let attackAnimation: CAAnimation = sceneSource!.entryWithIdentifier(
        "attackID", withClass: CAAnimation.self
    )!
    attackAnimation.fadeInDuration = 0.3
    attackAnimation.fadeOutDuration = 0.3
    
    baseNode.addAnimation(attackAnimation, forKey: "attackID")
}

func animMopher() {
    let scene = SCNScene()
    let o1 = scene.rootNode.childNode(withName: "o", recursively: true)!
    
    let a2 = CABasicAnimation.init(keyPath: "morpher.weights[0]")
    a2.fromValue = 0.0
    a2.toValue = 1.0
    a2.duration = 0.5
    a2.beginTime = 1.0
    a2.autoreverses = true
    a2.repeatCount = .infinity
    
    o1.addAnimation(a2, forKey: nil)
}

func keyMorpher() {
    let scene = SCNScene()
    let o1 = scene.rootNode.childNode(withName: "o", recursively: false)!
    o1.morpher?.setWeight(1.0, forTargetAt: 0)
}

func ikconstraint (shoulderNode : SCNNode, handNode : SCNNode) {
    let ik:SCNIKConstraint = SCNIKConstraint.inverseKinematicsConstraint(
        chainRootNode: shoulderNode
    )
    handNode.constraints = [ik]
    ik.targetPosition = SCNVector3(2, 0, 2)
}
