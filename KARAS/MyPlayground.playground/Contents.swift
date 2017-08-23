import SceneKit
import PlaygroundSupport

/*
let scene = SCNScene()
let view = SCNView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))


let box = SCNNode(geometry: SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1))

scene.rootNode.addChildNode(box)

view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.scene = scene
PlaygroundPage.current.liveView = view


// geo source
let planeSources = SCNNode(geometry: SCNCapsule(capRadius: 2, height: 5)).geometry?.getGeometrySources(for:
    SCNGeometrySource.Semantic.vertex)

let planeSource = planeSources?.first

// Data
let stride = planeSource?.dataStride,
offset = planeSource?.dataOffset,
componentsPerVector = planeSource?.componentsPerVector,
bytesPerVector = componentsPerVector! * (planeSource?.bytesPerComponent)!,
vectors = [SCNVector3](repeating: SCNVector3Zero, count: (planeSource?.vectorCount)!)

let vertices = vectors.enumerated().map({(index: Int, _) -> SCNVector3 in
    var vectorData = [Float](repeating: 0, count: componentsPerVector!)
    let byteRange = NSMakeRange(index * stride! + offset!, bytesPerVector)
    planeSource.data.copyBytes(to: &vectorData, from: byteRange)
    //            planeSource.data.copyBytes(to: &vectorData, from: byteRange)
    
    return SCNVector3Make(CGFloat(vectorData[0]),
                          CGFloat(vectorData[1]),
                          CGFloat(vectorData[2]))
})
print (vertices)
*/

