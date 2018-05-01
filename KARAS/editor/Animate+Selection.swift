//
//  KAnimation.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/20.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit
import Metal
import MetalKit

/*
 セレクションバッファ設定
 sel = glSelectBuffer(バッファの個数)
 セレクションモードに入る
 glRenderMode(GL_SELECT)
 セレクションバッファの初期化
 glInitNames()
 glPushName(0)
 ビューポートの初期化
 glMatrixMode(GL_PROJECTION)
 glPushMatrix()
 glLoadIdentity()
 選択範囲の指定
 gluPickMatrix(選択範囲中心X座標, 選択範囲中心Y座標, 選択範囲横幅, 選択範囲縦幅, ビュー情報)
 この後、現在と同じ設定でビューの設定を行います。
 ポリゴンに番号を付けながら描画
 番号を変えながら、以下の1,2を繰り返します。
 glLoadName(番号)
 ポリゴンを１つ描画
 ビューの行列を元に戻す
 glMatrixMode(GL_PROJECTION)
 glPopMatrix()
 選択されたポリゴンを得る
 hits = glRenderMode(GL_RENDER)
 リストhitsに選択されたポリゴンの情報が入っています。
 */
class MTLPicker {

}

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

func ikconstraint(shoulderNode: SCNNode, handNode: SCNNode) {
    let ik: SCNIKConstraint = SCNIKConstraint.inverseKinematicsConstraint(
            chainRootNode: shoulderNode
    )
    handNode.constraints = [ik]
    ik.targetPosition = SCNVector3(2, 0, 2)
}
