//
//  GizmoNode.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit


class GeneralNode: SCNNode {

    override init() {
        super.init()
        super.isHidden = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


public class PositionNode: SCNNode {

    required public override init() {

        super.init()
        super.name = "pos"
        let serialize = false
        super.renderingOrder = 1

        // variable
        let axisLen = SCNFloat(8.0),
                offset = SCNFloat(axisLen / 2.0),
                axisSide = SCNFloat(0.2),
                radius = SCNFloat(axisSide)


        // lines
        let xLine = SCNBox(width: axisLen, height: axisSide, length: axisSide, chamferRadius: radius),
                yLine = SCNBox(width: axisSide, height: axisLen, length: axisSide, chamferRadius: radius),
                zLine = SCNBox(width: axisSide, height: axisSide, length: axisLen, chamferRadius: radius)

        let XArrow = SCNNode(geometry: xLine),
                YArrow = SCNNode(geometry: yLine),
                ZArrow = SCNNode(geometry: zLine)

        XArrow.position.x = offset
        YArrow.position.y = offset
        ZArrow.position.z = offset


        // Cone
        let xBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2),
                yBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2),
                zBox = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 2)

        let xBoxNode = SCNNode(geometry: xBox),
                yBoxNode = SCNNode(geometry: yBox),
                zBoxNode = SCNNode(geometry: zBox)

        xBoxNode.position = SCNVector3Make(xLine.width / 2, 0, 0)
        yBoxNode.position = SCNVector3Make(0, yLine.height / 2, 0)
        zBoxNode.position = SCNVector3Make(0, 0, zLine.length / 2)

        xBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 1)
        yBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 0)
        zBoxNode.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), -1, 0, 0)

        // Plane
        let xyPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0)),
                yzPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0)),
                zxPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0))

        xyPlane.position = SCNVector3Make(xLine.width / 16, yLine.height / 2, 0)
        yzPlane.position = SCNVector3Make(0, yLine.height / 16, zLine.length / 2)
        zxPlane.position = SCNVector3Make(xLine.width / 2, 0, zLine.length / 16)

        xyPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 1)
        yzPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 1, 0)
        zxPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 1, 0, 0)


        // color
        xLine.firstMaterial?.diffuse.contents = Color.red
        xBox.firstMaterial?.diffuse.contents = Color.red
        yLine.firstMaterial?.diffuse.contents = Color.green
        yBox.firstMaterial?.diffuse.contents = Color.green
        zLine.firstMaterial?.diffuse.contents = Color.blue
        zBox.firstMaterial?.diffuse.contents = Color.blue
        xyPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow
        yzPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow
        zxPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow


        // append
        XArrow.addChildNode(xBoxNode)
        YArrow.addChildNode(yBoxNode)
        ZArrow.addChildNode(zBoxNode)

        XArrow.addChildNode(xyPlane)
        YArrow.addChildNode(yzPlane)
        ZArrow.addChildNode(zxPlane)


        self.addChildNode(XArrow)
        self.addChildNode(YArrow)
        self.addChildNode(ZArrow)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func nodePress(sender: SCNNode) {
        NSLog("aaa")
    }
}

public class RotateNode: SCNNode {

    required public override init() {

        super.init()
        super.name = "rot"
        let serialize = false
        super.renderingOrder = 1

        let xCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)
        let yCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)
        let zCircle = SCNTube(innerRadius: 7.9, outerRadius: 8, height: 0.1)

        xCircle.firstMaterial?.diffuse.contents = Color.red
        yCircle.firstMaterial?.diffuse.contents = Color.green
        zCircle.firstMaterial?.diffuse.contents = Color.blue

        xCircle.radialSegmentCount = 192
        yCircle.radialSegmentCount = 192
        zCircle.radialSegmentCount = 192

        let xNode = SCNNode(geometry: xCircle)
        let yNode = SCNNode(geometry: yCircle)
        let zNode = SCNNode(geometry: zCircle)

        xNode.rotation = SCNVector4Make(SCNFloat(Double.pi / 2), 0, 0, 1)
        yNode.rotation = SCNVector4Make(SCNFloat(Double.pi / 2), 0, 1, 0)
        zNode.rotation = SCNVector4Make(SCNFloat(Double.pi / 2), 1, 0, 0)

        self.addChildNode(xNode)
        self.addChildNode(yNode)
        self.addChildNode(zNode)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class ScaleNode: SCNNode {

    required public override init() {

        super.init()
        super.name = "scl"
        let serialize = false
        super.renderingOrder = 1


        // variable
        let axisLen = SCNFloat(8.0),
                offset = SCNFloat(axisLen / 2.0),
                axisSide = SCNFloat(0.2),
                radius = SCNFloat(axisSide)


        // lines
        let xLine = SCNBox(width: axisLen, height: axisSide, length: axisSide, chamferRadius: radius),
                yLine = SCNBox(width: axisSide, height: axisLen, length: axisSide, chamferRadius: radius),
                zLine = SCNBox(width: axisSide, height: axisSide, length: axisLen, chamferRadius: radius)

        let XArrow = SCNNode(geometry: xLine),
                YArrow = SCNNode(geometry: yLine),
                ZArrow = SCNNode(geometry: zLine)

        XArrow.position.x = offset
        YArrow.position.y = offset
        ZArrow.position.z = offset


        // miniBox
        let xBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0),
                yBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0),
                zBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)

        let xBoxNode = SCNNode(geometry: xBox),
                yBoxNode = SCNNode(geometry: yBox),
                zBoxNode = SCNNode(geometry: zBox)

        xBoxNode.position = SCNVector3Make(xLine.width / 2, 0, 0)
        yBoxNode.position = SCNVector3Make(0, yLine.height / 2, 0)
        zBoxNode.position = SCNVector3Make(0, 0, zLine.length / 2)


        // Plane
        let xyPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0)),
                yzPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0)),
                zxPlane = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 0.05, chamferRadius: 0))

        xyPlane.position = SCNVector3Make(xLine.width / 16, yLine.height / 2, 0)
        yzPlane.position = SCNVector3Make(0, yLine.height / 16, zLine.length / 2)
        zxPlane.position = SCNVector3Make(xLine.width / 2, 0, zLine.length / 16)

        xyPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 0, 1)
        yzPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 0, 1, 0)
        zxPlane.pivot = SCNMatrix4MakeRotation(SCNFloat(Double.pi / 2), 1, 0, 0)


        // color
        xLine.firstMaterial?.diffuse.contents = Color.red
        xBox.firstMaterial?.diffuse.contents = Color.red
        yLine.firstMaterial?.diffuse.contents = Color.green
        yBox.firstMaterial?.diffuse.contents = Color.green
        zLine.firstMaterial?.diffuse.contents = Color.blue
        zBox.firstMaterial?.diffuse.contents = Color.blue
        xyPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow
        yzPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow
        zxPlane.geometry?.firstMaterial?.diffuse.contents = Color.yellow


        // append
        XArrow.addChildNode(xBoxNode)
        YArrow.addChildNode(yBoxNode)
        ZArrow.addChildNode(zBoxNode)

        XArrow.addChildNode(xyPlane)
        YArrow.addChildNode(yzPlane)
        ZArrow.addChildNode(zxPlane)

        self.addChildNode(XArrow)
        self.addChildNode(YArrow)
        self.addChildNode(ZArrow)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

