//
//  GameViewController.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import Metal
import MetalKit
import SpriteKit
import SceneKit
import QuartzCore

class GameViewController: SuperViewController, SCNSceneRendererDelegate, SCNNodeRendererDelegate {
    
    // Model
    var scene = SCNScene()
    var render: SCNRenderer!
    var baseNode:SCNNode? = nil

    // View
    @IBOutlet weak var gameView: GameView!
    var console: ConsoleView!
    var overray : GameViewOverlay!
    
    // Metal
    var device:MTLDevice!
    var commandQueue: MTLCommandQueue!
    var metalBuffer : MTLCommandBuffer!
    var metalRenderDescripter : MTLRenderPassDescriptor!
    var meshData:MetalMeshData!
    var deformer:MetalMeshDeformer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HUD keyDown がなくなる
        let size = self.gameView.frame.size
        self.gameView.overlaySKScene = GameViewOverlay(size: size, view: self.gameView)
        overray = self.gameView.overlaySKScene as! GameViewOverlay
        overray.isUserInteractionEnabled = true
        self.gameView.viewDidInit()
        
        // Console
        console = ConsoleView(frame: self.gameView.frame)
        self.gameView.addSubview(console)
        console.isHidden = true
        
        // Metal Render
        if self.gameView.renderingAPI == SCNRenderingAPI.metal {
            device = MTLCreateSystemDefaultDevice()
            deformer = MetalMeshDeformer(device: device)
            commandQueue = device.makeCommandQueue()
//            render = SCNRenderer(device: device, options: nil)
//            render.scene = scene
            sceneInit()
        } else {
            fatalError("Metal only")
        }
        
        // set the scene to the view
        self.gameView.scene = scene
        self.gameView.allowsCameraControl = true
        self.gameView.showsStatistics = true
        self.gameView.backgroundColor = Color.lightGray
        self.gameView.autoenablesDefaultLighting = true
        self.gameView.delegate = self
        self.gameView.defaultCameraController.clearRoll()
    }

    private func sceneInit() {
        // Geometry
        scene.rootNode.name = "root"
        newMesh()
        
        // camera ポジションのせいでファイルが消えるので注意
        let grid = createGrid()
        scene.rootNode.addChildNode(grid)
        let camera = createCam(name: "camera1")
        camera.position = SCNVector3(x: 0, y: 5, z: 30)
        let light = createLight(name: "light1")
        scene.rootNode.addChildNode(light)
        
        // asset initialize
        let asset = USDExporter.exportFromAsset(scene: scene)
        scene = SCNScene(mdlAsset: asset)
    }
    
    //plane's mesh params    
    private func newMesh() {
        let scnView = self.gameView
        
        meshData = MetalMeshDeformable.buildPlane(device, width: 150, length: 70, step: 1)
        let newNode = SCNNode(geometry: meshData.geometry)
        newNode.geometry?.firstMaterial?.diffuse.contents = Color.blue
        newNode.castsShadow = true
        
        var trans = SCNMatrix4Identity
        trans = SCNMatrix4Rotate(trans, CGFloat(Float.pi/2), 1, 0, 0)
        newNode.transform = trans
        
        if let existingNode = baseNode {
            scnView?.scene?.rootNode.replaceChildNode(existingNode, with: newNode)
        } else {
            scnView?.scene?.rootNode.addChildNode(newNode)
        }
        baseNode = newNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene,
                  atTime time: TimeInterval)
    {
        // deform data
        guard let deformData = self.gameView.deformData else {
            return
        }
        deformer.deform(meshData, deformData: self.gameView.deformData!)
        self.gameView.deformData = nil
        return
        
        let viewport = CGRect(x: 0, y: 0, width: self.gameView.frame.width, height: self.gameView.frame.height)
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0, 1, 0, 1.0); //green
        renderPassDescriptor.colorAttachments[0].storeAction = .store
        
        let commandBuffer = commandQueue.makeCommandBuffer()
//        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
//        renderEncoder?.endEncoding()
        
        // TODO: ジオメトリのバーテックスを渡してMetal シェーダで処理して戻す
//        scene.rootNode.enumerateChildNodes({child, _ in
//            child.geometry?.sources(for: .vertex).forEach {
//                print($0)
//            }
//        })
        // reuse scene1 and the current point of view
//        render.scene = scene
//        render.pointOfView = self.gameView.pointOfView
//        render.render(atTime: 0, viewport: viewport,
//                      commandBuffer: commandBuffer!, passDescriptor: renderPassDescriptor)
        commandBuffer?.commit()
        commandBuffer?.waitUntilCompleted()
    }
}
