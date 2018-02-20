//: A SceneKit based Playground

import PlaygroundSupport
import SceneKit

class GameScene: SCNScene {
    override init() {
        super.init()
        self.rootNode.addChildNode(SCNNode(geometry: SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameView: SCNView {
    override init() {
        super.init()
        self.backgroundColor = NSColor.black
        self.allowsCameraControl = true
        self.autoenablesDefaultLighting = true
        self.showsStatistics = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// view
let sceneView = GameView(frame: CGRect(x:0 , y:0, width: 640, height: 480))

// scene
let scene = GameScene()
sceneView.scene = scene
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
