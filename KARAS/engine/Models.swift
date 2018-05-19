//
// Created by sumioka-air on 2018/05/02.
// Copyright (c) 2018 sho sumioka. All rights reserved.
//

import Foundation
import SceneKit

final class Models {

    private var models: [SCNNode] = []

    func copyModels() {
        models.removeAll()
        var tmp: [SCNNode] = []
//        gameView.scene?.rootNode.enumerateChildNodes({ child, _ in
//            if child.geometry != nil && child.categoryBitMask != 2 {
//                tmp.append(child.clone())
//            }
//        })
        models = tmp
    }

    func setModels() {
        models.removeAll()

        var tmp: [SCNNode] = []
//        gameView.scene?.rootNode.enumerateChildNodes({ child, _ in
//            if child.geometry != nil && child.categoryBitMask != 2 {
//                tmp.append(child.clone())
//                child.removeFromParentNode()
//            }
//        })
        models = tmp
    }

    func getModels() {
//        models.forEach {
//            gameView.scene?.rootNode.addChildNode($0)
//        }
        models.removeAll()
    }
}

func getMat(textureFilename: String, ureps: CGFloat = 1.0, vreps: CGFloat = 1.0, directory: String? = nil,
            normalFilename: String? = nil, specularFilename: String? = nil) -> SCNMaterial {
    let nsb = Bundle.main.path(forResource: textureFilename, ofType: nil, inDirectory: directory)
    let im = NSImage(contentsOfFile: nsb!)

    let mat = SCNMaterial()
    mat.diffuse.contents = im

    if (normalFilename != nil) {
        mat.normal.contents = NSImage(contentsOfFile: Bundle.main.path(
                forResource: normalFilename, ofType: nil, inDirectory: directory)!
        )
    }

    if (specularFilename != nil) {
        mat.specular.contents = NSImage(contentsOfFile: Bundle.main.path(
                forResource: specularFilename, ofType: nil, inDirectory: directory)!
        )
    }

    repeatMat(mat: mat, wRepeat: ureps, hRepeat: vreps)
    return mat
}

func repeatMat(mat: SCNMaterial, wRepeat: CGFloat, hRepeat: CGFloat) {

    mat.diffuse.contentsTransform = SCNMatrix4MakeScale(wRepeat, hRepeat, 1.0)
    mat.diffuse.wrapS = .repeat
    mat.diffuse.wrapT = .repeat

    mat.normal.wrapS = .repeat
    mat.normal.wrapT = .repeat

    mat.specular.wrapS = .repeat
    mat.specular.wrapT = .repeat
}

func getNormal(v0: SCNVector3, v1: SCNVector3, v2: SCNVector3) -> SCNVector3 {

    // there are three edges defined by these 3 vertices, but we only need 2 to define the plane
    let edgev0v1 = v1 - v0, edgev1v2 = v2 - v1

    // Assume the verts are expressed in counter-clockwise order to determine normal
    return edgev0v1.cross(vector: edgev1v2)
}