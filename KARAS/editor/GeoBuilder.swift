//
// Created by sumioka-air on 2018/05/01.
// Copyright (c) 2018 sho sumioka. All rights reserved.
//

import SceneKit

final class Builder {

    class func Cube(scene: SCNScene) {
        let cube = SCNBox()
        cube.name = "cube"

        let cubeNode = SCNNode(geometry: cube)
        scene.rootNode.addChildNode(cubeNode)
    }

    class func Plane(scene: SCNScene) {
        let plane = SCNPlane()
        plane.name = "plane"

        let planeNode = SCNNode(geometry: plane)
        scene.rootNode.addChildNode(planeNode)
    }

    class func Grid(scene: SCNScene) {
        let grid = SCNFloor()
        grid.name = "grid"

        let gridNode = SCNNode(geometry: grid)
        scene.rootNode.addChildNode(gridNode)
    }

    class func Cone(scene: SCNScene) {
        let cone = SCNCone()
        cone.name = "cone"

        let coneNode = SCNNode(geometry: cone)
        scene.rootNode.addChildNode(coneNode)
    }

    class func Torus(scene: SCNScene) {
        let torus = SCNTorus()
        torus.name = "torus"

        let torusNode = SCNNode(geometry: torus)
        scene.rootNode.addChildNode(torusNode)
    }
}