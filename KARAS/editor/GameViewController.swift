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
    var baseNode: SCNNode? = nil

    // View
    @IBOutlet weak var gameView: GameView!
    var overRay: GameViewOverlay!

    // Metal
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var metalBuffer: MTLCommandBuffer!
    var descriptor: MTLRenderPassDescriptor!
    var pipelineState: MTLRenderPipelineState!

    var meshData: MetalMeshData!
    var deform: MetalMeshDeformer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Metal Render
        device = MTLCreateSystemDefaultDevice()
        commandQueue = device.makeCommandQueue()

        render = SCNRenderer(device: device, options: nil)
        render.scene = scene
        deform = MetalMeshDeformer(device: device)
        sceneInit()

        // MARK: set the scene to the view
        gameView.allowsCameraControl = true
        gameView.showsStatistics = true
        gameView.backgroundColor = Color.lightGray
        gameView.autoenablesDefaultLighting = true
        gameView.delegate = self
        gameView.isPlaying = true
        gameView.defaultCameraController.clearRoll()

        // MARK: HUD
        gameView.overlaySKScene = GameViewOverlay(size: gameView.frame.size, view: gameView)
        overRay = gameView.overlaySKScene as! GameViewOverlay
        overRay.isUserInteractionEnabled = false
        gameView.viewDidInit()
    }

    private func sceneInit() {

        // NOTE: camera ポジションのせいでファイルが消えるので注意
        Builder.Camera(scene: scene)
        Builder.Light(scene: scene)

        let newNode = Builder.Plane(meshData: MetalMeshDeformable.buildPlane(device, width: 150, length: 70, step: 1))
        if let existingNode = baseNode {
            scene.rootNode.replaceChildNode(existingNode, with: newNode)
        } else {
            scene.rootNode.addChildNode(newNode)
        }
        baseNode = newNode

        // MARK: asset initialize
        USDExporter.initialize(scene: scene)
//        let asset = USDExporter.exportFromAsset(scene: scene)
//        scene = SCNScene(mdlAsset: asset)
        gameView.scene = scene
    }

    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) throws {

        // NEW: pipeline state
        let renderPipeDescriptor = MTLRenderPipelineDescriptor()
        renderPipeDescriptor.depthAttachmentPixelFormat = .depth32Float_stencil8
        renderPipeDescriptor.stencilAttachmentPixelFormat = .depth32Float_stencil8
        renderPipeDescriptor.tessellationControlPointIndexType = .uint16
        pipelineState = try device.makeRenderPipelineState(descriptor: renderPipeDescriptor)

        // deform data
        guard let deformData = gameView.deformData else {
            return
        }
        deform.deform(meshData, deformData: deformData)
        gameView.deformData = nil

        // descriptor
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].storeAction = .store
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0, 0, 0, 1.0)

        // buffer
        let commandBuffer = commandQueue.makeCommandBuffer()
        commandBuffer!.label = "deform buffer"

        let renderEncoder = commandBuffer!.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderEncoder?.setRenderPipelineState(pipelineState)
        renderEncoder?.endEncoding()

        // MARK: re-use scene and the current point of view
        render.scene = scene
        render.pointOfView = gameView.pointOfView
        render.render(atTime: 0,
                viewport: CGRect(x: 0, y: 0, width: gameView.frame.width, height: gameView.frame.height),
                commandBuffer: commandBuffer!, passDescriptor: renderPassDescriptor
        )
        commandBuffer?.commit()
        commandBuffer?.waitUntilCompleted()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

