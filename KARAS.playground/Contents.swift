
import Cocoa
import SceneKit
import PlaygroundSupport

let positions = [SCNVector3Make(  0, -0.1,  0),
                 SCNVector3Make(  0.3, -0.1,  0),
                 SCNVector3Make(  0,  0.1,  0),
                 SCNVector3Make(  0.3,  0.1,  0),
]
let indices :[UInt16] = [
    0, 1, 2,
    1, 3, 2,
]

//let vertexSource = SCNGeometrySource(vertices: positions, count: 4)
//let indexData = NSData(bytes: indices, length: MemoryLayout<Any>.size * indices.count)
//
//let newElement = SCNGeometryElement(data: NSData(bytes: indices,
//                                                 length: indices.count * MemoryLayout<Any>.size) as Data,
//                                    primitiveType: .triangles ,
//                                    primitiveCount: 2,
//                                    bytesPerIndex: MemoryLayout.size)
//
//let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//sceneView.allowsCameraControl = true
//sceneView.autoenablesDefaultLighting = true
//sceneView.backgroundColor = NSColor.darkGray
//sceneView.showsStatistics = true
//PlaygroundPage.current.liveView = sceneView
//
//let scene = SCNScene()
//sceneView.scene = scene
//
//let geometry = SCNGeometry(sources: [vertexSource], elements: [newElement])
//geometry.firstMaterial?.diffuse.contents = NSColor.red

/*
 weak var releasedNode: SCNNode?
 weak var currentNode: SCNNode?
 
 super.mouseDragged(with: event)
 p = self.convert(event.locationInWindow, from: nil)
 
 // Coordinates
 let x = self.unprojectPoint(SCNVector3(x: p.x, y: p.y, z: 0.94)).x
 let y = self.unprojectPoint(SCNVector3(x: p.x, y: p.y, z: 0.94)).y
 let z = self.selectedNode != nil ? self.projectPoint(SCNVector3Zero).z : 0
 
 // Transform Node
 let hitResults = self.hitTest(p, options: [:])
 for hit in hitResults {
 switch hit.node.name! {
 case "pos":
 currentNode?.position = SCNVector3(x: x, y: y, z: z)
 
 case "rot":
 currentNode?.eulerAngles = SCNVector3(x: x, y: y, z: z)
 
 case "scl":
 //                    currentNode?.scale = SCNVector3(x: x, y: y, z: z)
 self.currentNode?.position = (self.selectedNode?.position)!
 self.currentNode?.rotation = (self.selectedNode?.rotation)!
 self.currentNode?.scale = (self.selectedNode?.scale)!
 
 default:
 break
 }
 
 self.currentNode?.position = (self.selectedNode?.position)!
 self.currentNode?.rotation = (self.selectedNode?.rotation)!
 self.currentNode?.scale = (self.selectedNode?.scale)!
 }
 
 NSLog("\(String(describing: releasedNode))")
 needsDisplay = true
 */

/*
 // これをRender内で毎フレーム呼びだす
 let line = lineFrom(vector: previousPoint, toVector: currentPosition)
 let lineNode = SCNNode(geometry: line)
 lineNode.geometry?.firstMaterial?.diffuse.contents = lineColor
 sceneView.scene.rootNode.addChildNode(lineNode)
 */

//let toz: SCNFloat = -2.0 // toz < 0 の範囲で変えてみてください
//let zpercurve = (toz) / 4.0
//let bezierCircle: SCNFloat = SCNFloat((sqrtf(2) - 1) * 4 / 3)
//let taned = (zpercurve * bezierCircle) => {
//    $0 >= 0 ? $0 : -1 * $0
//}
//
//let path = SCNPath()
//_ = path.start(from: v(0, 0, 1))
//    .addLine(to: v(0, 0, 0))
//    .addCurve(to: v(-1, 1, zpercurve), control1: v(-1 * bezierCircle, 0, 0), control2: v(-1, 1 - bezierCircle, zpercurve + taned))
//    .addCurve(to: v(0, 2, toz / 2.0), control1: v(-1, 1 + bezierCircle, zpercurve - taned), control2: v(-1 * bezierCircle, 2, toz / 2))
//    .addCurve(to: v(1, 1, zpercurve * 3.0), control1: v(bezierCircle, 2, toz / 2), control2: v(1, 1 + bezierCircle, (zpercurve * 3.0) + taned))
//    .addCurve(to: v(0, 0, toz), control1: v(1, 1 - bezierCircle, (zpercurve * 3.0) - taned), control2: v(bezierCircle, 0, toz))
//    .addLine(to: v(0, 0, -5))
//    .end()
//let lineNode = SCNLine(path: path)
//scene.rootNode.addChildNode(lineNode)
