//
//  SCNgeo.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/25.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit

infix operator =>

public func =><T, U>(lhs: T, rhs: (T) throws -> U) rethrows -> U {
    return try rhs(lhs)
}

public class SCNPath {

    private var current: SCNVector3 = SCNVector3(0, 0, 0)
    var points: [SCNVector3] = [] //曲線を構成する点の座標を保存する

    /// 始点を設定します。pointsは上書きされます。デフォルトでは(0, 0, 0)です。
    func start(from point: SCNVector3) -> SCNPath {
        current = point
        points = [point]
        return self
    }

    func addLine(to point: SCNVector3) -> SCNPath {
        var rtn = [SCNVector3]()
        points.append(current)
        rtn.append(current)
        current = point
        return self
    }

    func addQuadCurve(to point: SCNVector3, control: SCNVector3) -> SCNPath {
        var rtn = [SCNVector3]()
        let n = 0 //((control - current).length + (point - control).length) * 12
        for i in 0..<n {
            let t = CGFloat(i) / CGFloat(n)

            let q1 = current + (control - current) * t
            let q2 = control + (point - control) * t

            let r = q1 + (q2 - q1) * t
            rtn.append(r)
        }
        points += rtn
        current = point
        return self
    }

    func addCurve(to point: SCNVector3, control1: SCNVector3, control2: SCNVector3) -> SCNPath {
        var rtn = [SCNVector3]()
        let n = 0 //Int((control1 - current).length + (control2 - control1).length + (point - control2).length) * 12
        for i in 0..<n {
            let t = CGFloat(i) / CGFloat(n)

            let q1 = current + (control1 - current) * t
            let q2 = control1 + (control2 - control1) * t
            let q3 = control2 + (point - control2) * t

            let r1 = q1 + (q2 - q1) * t
            let r2 = q2 + (q3 - q2) * t

            let s = r1 + (r2 - r1) * t
            rtn.append(s)
        }
        points += rtn
        current = point
        return self
    }

    func end() {
        points.append(current)
    }

    func close() -> SCNPath {
        _ = addLine(to: self.points[0])
        if let last = points.last, last == current {
        } else {
            points.append(current)
        }
        current = self.points[0]
        return self
    }
}

class SCNLine: SCNNode {
    
    // 直線
    init(from: SCNVector3, to: SCNVector3) {
        super.init()
        
        let source = SCNGeometrySource.init(vertices: [from, to])
        let indices: [UInt8] = [0, 1]
        let data = Data.init(bytes: indices)
        let element = SCNGeometryElement.init(data: data, primitiveType: .line,
                                              primitiveCount: 1, bytesPerIndex: 1)
        let geometry = SCNGeometry.init(sources: [source], elements: [element])
        self.geometry = geometry
        
        // Material
        let material = SCNMaterial.init()
        material.diffuse.contents = Color.white.cgColor
        self.geometry!.insertMaterial(material, at: 0)
    }
    
    // Bezier
    init(path: SCNPath) {
        super.init()
        
        let source = SCNGeometrySource(vertices: path.points)
        let indices: [UInt32] = {
            var rtn = [UInt32]();
            for i in 0..<path.points.count - 1 {
                rtn += [UInt32(i), UInt32(i + 1)]
            };
            return rtn
        }()

        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        let geometry = SCNGeometry(sources: [source], elements: [element])
        self.geometry = geometry
        
        // Material
        let material = SCNMaterial()
        material.diffuse.contents = NSColor.white.cgColor
        self.geometry!.insertMaterial(material, at: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension SCNGeometry {
    
    func dump () {
        for sou in (self.sources) {
            
            NSLog("\(sou.bytesPerComponent) \(sou.vectorCount) \(sou.semantic) \(sou.data) \(sou.dataOffset) \(sou.dataStride) \(sou.componentsPerVector)")
        }
        
        for sou in (self.elements) {
            
            NSLog("\(sou.bytesPerIndex) \(sou.data) \(sou.maximumPointScreenSpaceRadius) \(sou.minimumPointScreenSpaceRadius) \(sou.pointSize) \(sou.primitiveCount) \(sou.primitiveType)")
        }
    }
    /*!
     @property firstMaterial
     @abstract Determines the first material of the geometry. Returns nil if the geometry has no material.
     @discussion This method is here for convenience. It is equivalent to the first object in the "materials" array above.
     */
    func vertex() -> SCNGeometry {
//        self.sources[0].data
        return self.copy() as! SCNGeometry
    }
    
    /*!
     @property firstMaterial
     @abstract Determines the first material of the geometry. Returns nil if the geometry has no material.
     @discussion This method is here for convenience. It is equivalent to the first object in the "materials" array above.
     */
    func line() -> SCNGeometry {
        return self.copy() as! SCNGeometry
    }
    
    /*!
     @property firstMaterial
     @abstract Determines the first material of the geometry. Returns nil if the geometry has no material.
     @discussion This method is here for convenience. It is equivalent to the first object in the "materials" array above.
     */
    func face() -> SCNGeometry {
        return self.copy() as! SCNGeometry
    }
}
