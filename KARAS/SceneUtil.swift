//
//  SceneUtil.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

//
//  SCNUtils.swift
//	GeoTools
//
//  Created by Glenn Crownover on 4/27/15.
//  Copyright (c) 2015 bluejava. All rights reserved.
//
// This is a collection of utilities and extensions that aid in working with SceneKit
// The SCNVector3 extensions were largely copied from Kim Pedersen's SCNVector3Extensions project. Thanks Kim!

import SceneKit

class SCNUtils {

    class func getNodeFromDAE(name: String) -> SCNNode? {
        let rnode = SCNNode()
        let nscene = SCNScene(named: name)

        if let nodeArray = nscene?.rootNode.childNodes {
            for cn in nodeArray {
                rnode.addChildNode(cn as SCNNode!)
            }
            return rnode
        }

        print("DAE File not found: \(name)!!")
        return nil
    }

    class func loadAnim(baseNode: SCNNode) {
        let url = Bundle.main.url(forResource: "art.scnassets/boss_attack", withExtension: "dae")
        let sceneSource = SCNSceneSource(url: url!, options: [
            SCNSceneSource.LoadingOption.animationImportPolicy: SCNSceneSource.AnimationImportPolicy.doNotPlay
        ])

        let attackAnimation: CAAnimation = sceneSource!.entryWithIdentifier("attackID", withClass: CAAnimation.self)!
        attackAnimation.fadeInDuration = 0.3
        attackAnimation.fadeOutDuration = 0.3

        baseNode.addAnimation(attackAnimation, forKey: "attackID")
    }

    class func getStaticNodeFromDAE(name: String) -> SCNNode? {
        if let node = getNodeFromDAE(name: name) {
            node.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: node, options: [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron]))
            return node
        }

        return nil
    }

    class func getMat(textureFilename: String, ureps: CGFloat = 1.0, vreps: CGFloat = 1.0, directory: String? = nil,
                      normalFilename: String? = nil, specularFilename: String? = nil) -> SCNMaterial {
        let nsb = Bundle.main.path(forResource: textureFilename, ofType: nil, inDirectory: directory)
        let im = NSImage(contentsOfFile: nsb!)

        let mat = SCNMaterial()
        mat.diffuse.contents = im

        if (normalFilename != nil) {
            mat.normal.contents = NSImage(contentsOfFile: Bundle.main.path(forResource: normalFilename, ofType: nil, inDirectory: directory)!)
        }

        if (specularFilename != nil) {
            mat.specular.contents = NSImage(contentsOfFile: Bundle.main.path(forResource: specularFilename, ofType: nil, inDirectory: directory)!)
        }

        repeatMat(mat: mat, wRepeat: ureps, hRepeat: vreps)

        return mat
    }

    class func repeatMat(mat: SCNMaterial, wRepeat: CGFloat, hRepeat: CGFloat) {
        mat.diffuse.contentsTransform = SCNMatrix4MakeScale(wRepeat, hRepeat, 1.0)
        mat.diffuse.wrapS = .repeat
        mat.diffuse.wrapT = .repeat

        mat.normal.wrapS = .repeat
        mat.normal.wrapT = .repeat

        mat.specular.wrapS = .repeat
        mat.specular.wrapT = .repeat
    }

    // Return the normal against the plane defined by the 3 vertices, specified in
    // counter-clockwise order.
    // note, this is an un-normalized normal.  (ha.. wtf? yah, thats right)
    class func getNormal(v0: SCNVector3, v1: SCNVector3, v2: SCNVector3) -> SCNVector3 {
        // there are three edges defined by these 3 vertices, but we only need 2 to define the plane
        let edgev0v1 = v1 - v0
        let edgev1v2 = v2 - v1

        // Assume the verts are expressed in counter-clockwise order to determine normal
        return edgev0v1.cross(vector: edgev1v2)
    }
}

/*
 * The following SCNVector3 extension comes from
 * https://github.com/devindazzle/SCNVector3Extensions - with some changes by me
 */
extension SCNVector3 {

    func negate() -> SCNVector3 {
        return self * -1
    }

    /**
     * Negates the vector described by SCNVector3
     */
    mutating func negated() -> SCNVector3 {
        self = negate()
        return self
    }

    /**
     * Returns the length (magnitude) of the vector described by the SCNVector3
     */
    func length() -> CGFloat {
        return sqrt(x * x + y * y + z * z)
    }

    /**
     * Negates the vector described by SCNVector3 and returns
     * the result as a new SCNVector3.
     */
    func length²() -> CGFloat {
        return (x * x) + (y * y) + (z * z)
    }


    /**
     * Normalizes the vector described by the SCNVector3 to length 1.0 and returns
     * the result as a new SCNVector3.
     */
    func normalized() -> SCNVector3? {

        let len = length()
        if (len > 0) {
            return self / length()
        } else {
            return nil
        }
    }

    /**
     * Normalizes the vector described by the SCNVector3 to length 1.0.
     */
    mutating func normalize() -> SCNVector3? {
        if let vn = normalized() {
            self = vn
            return self
        }
        return nil
    }

    mutating func normalizeOrZ() -> SCNVector3 {
        if let vn = normalized() {
            self = vn
            return self
        }
        return SCNVector3()
    }

    /**
     * Calculates the distance between two SCNVector3. Pythagoras!
     */
    func distance(vector: SCNVector3) -> CGFloat {
        return (self - vector).length()
    }

    /**
     * Calculates the dot product between two SCNVector3.
     */
    func dot(vector: SCNVector3) -> CGFloat {
        return x * vector.x + y * vector.y + z * vector.z
    }

    /**
     * Calculates the cross product between two SCNVector3.
     */
    func cross(vector: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(y * vector.z - z * vector.y, z * vector.x - x * vector.z, x * vector.y - y * vector.x)
    }

    func angle(vector: SCNVector3) -> CGFloat {
        // angle between 3d vectors P and Q is equal to the arc cos of their dot products over the product of
        // their magnitudes (lengths).
        //	theta = arccos( (P • Q) / (|P||Q|) )
        let dp = dot(vector: vector) // dot product
        let magProduct = length() * vector.length() // product of lengths (magnitudes)
        return acos(dp / magProduct) // DONE
    }

    // Constrains (or reposition) this vector to fall within the specified min and max vectors.
    // Note - this assumes the max vector points to the outer-most corner (farthest from origin) while the
    // min vector represents the inner-most corner of the valid constraint space
    mutating func constrain(min: SCNVector3, max: SCNVector3) -> SCNVector3 {
        if (x < min.x) {
            self.x = min.x
        }
        if (x > max.x) {
            self.x = max.x
        }

        if (y < min.y) {
            self.y = min.y
        }
        if (y > max.y) {
            self.y = max.y
        }

        if (z < min.z) {
            self.z = min.z
        }
        if (z > max.z) {
            self.z = max.z
        }

        return self
    }
}

/**
 * Adds two SCNVector3 vectors and returns the result as a new SCNVector3.
 */
func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

/**
 * Increments a SCNVector3 with the value of another.
 */
func +=(left: inout SCNVector3, right: SCNVector3) {
    left = left + right
}

/**
 * Subtracts two SCNVector3 vectors and returns the result as a new SCNVector3.
 */
func -(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
}

/**
 * Decrements a SCNVector3 with the value of another.
 */
func -=(left: inout SCNVector3, right: SCNVector3) {
    left = left - right
}

/**
 * Multiplies two SCNVector3 vectors and returns the result as a new SCNVector3.
 */
func *(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x * right.x, left.y * right.y, left.z * right.z)
}

/**
 * Multiplies a SCNVector3 with another.
 */
func *=(left: inout SCNVector3, right: SCNVector3) {
    left = left * right
}

/**
 * Multiplies the x, y and z fields of a SCNVector3 with the same scalar value and
 * returns the result as a new SCNVector3.
 */
func *(vector: SCNVector3, scalar: CGFloat) -> SCNVector3 {
    return SCNVector3Make(vector.x * scalar, vector.y * scalar, vector.z * scalar)
}

/**
 * Multiplies the x and y fields of a SCNVector3 with the same scalar value.
 */
func *=(vector: inout SCNVector3, scalar: CGFloat) {
    vector = vector * scalar
}

/**
 * Divides two SCNVector3 vectors abd returns the result as a new SCNVector3
 */
func /(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x / right.x, left.y / right.y, left.z / right.z)
}

/**
 * Divides a SCNVector3 by another.
 */
func /=(left: inout SCNVector3, right: SCNVector3) {
    left = left / right
}

/**
 * Divides the x, y and z fields of a SCNVector3 by the same scalar value and
 * returns the result as a new SCNVector3.
 */
func /(vector: SCNVector3, scalar: CGFloat) -> SCNVector3 {
    return SCNVector3Make(vector.x / scalar, vector.y / scalar, vector.z / scalar)
}

/**
 * Divides the x, y and z of a SCNVector3 by the same scalar value.
 */
func /=(vector: inout SCNVector3, scalar: CGFloat) {
    vector = vector / scalar
}

/**
 * Calculates the SCNVector from lerping between two SCNVector3 vectors
 */
func SCNVector3Lerp(vectorStart: SCNVector3, vectorEnd: SCNVector3, t: CGFloat) -> SCNVector3 {
    return SCNVector3Make(vectorStart.x + ((vectorEnd.x - vectorStart.x) * t), vectorStart.y + ((vectorEnd.y - vectorStart.y) * t), vectorStart.z + ((vectorEnd.z - vectorStart.z) * t))
}

/**
 * Project the vector, vectorToProject, onto the vector, projectionVector.
 */
func SCNVector3Project(vectorToProject: SCNVector3, projectionVector: SCNVector3) -> SCNVector3 {
    let scale: CGFloat = projectionVector.dot(vector: vectorToProject) / projectionVector.dot(vector: projectionVector)
    let v: SCNVector3 = projectionVector * scale
    return v
}

func SCNVector3ApplyAffineTransform(vector: SCNVector3, _ t: SCNMatrix4) -> SCNVector3 {
    let x = vector.x * t.m11 + vector.y * t.m21 + vector.z * t.m31 + t.m41
    let y = vector.x * t.m12 + vector.y * t.m22 + vector.z * t.m32 + t.m42
    let z = vector.x * t.m13 + vector.y * t.m23 + vector.z * t.m33 + t.m43
    return SCNVector3Make(x, y, z)
}
