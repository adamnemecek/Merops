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

class GameViewController: SuperViewController, SCNSceneRendererDelegate {
    
    @IBOutlet weak var gameView: GameView!
    let scene = SCNScene()
    
    var models : [SCNNode] = []
    var device:MTLDevice!
    var commandQueue: MTLCommandQueue!
    var renderer: SCNRenderer!
    var metalLayer : CAMetalLayer!
    var overray : GameViewOverlay!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneInit()
        
        // Metal Render
        if self.gameView.renderingAPI == SCNRenderingAPI.metal {
//
//            device = self.gameView.device
//            metalLayer = CAMetalLayer()
//            metalLayer.device = device
//            metalLayer.pixelFormat = .bgra8Unorm
//            metalLayer.framebufferOnly = true
//            metalLayer.frame = self.gameView.frame
//            commandQueue = device.makeCommandQueue()
//            renderer = SCNRenderer(device: device, options: nil)
//            self.gameView.layer?.addSublayer(metalLayer)
            
        } else {
            fatalError("Metal only")
        }
        
        // HUD
        self.gameView.overlaySKScene = GameViewOverlay(size: self.gameView.frame.size, view: self.gameView)
        overray = self.gameView.overlaySKScene as! GameViewOverlay
        overray.isUserInteractionEnabled = false
        
        // set the scene to the view
        self.gameView.scene = scene
        self.gameView.allowsCameraControl = true
        self.gameView.showsStatistics = true
        self.gameView.backgroundColor = Color.black
        self.gameView.autoenablesDefaultLighting = true
        self.gameView.defaultCameraController.clearRoll()
        self.gameView.delegate = self
    }

    func sceneInit() {
        // Box
        scene.rootNode.addChildNode(
            custumGeo()
        )
        
        
        // camera
        let camera = createCam()
        scene.rootNode.addChildNode(camera)
        camera.position = SCNVector3(x: 0, y: 5, z: 30)

        // USD
        let local = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String
        gitInit(url: local + "/ooo")
        gitClone(url: "https://github.com/sho7noka/adobe-tools.git")
        USDEdit(infile: "/Users/sumioka_air/Documents/_res/_3d/cube.usda")
        USDExporter.exportFromAsset(scene: scene)
        USDExporter.exportFromText()
    }
    
//    func renderer(_ renderer: SCNSceneRenderer,
//                  willRenderScene scene: SCNScene,
//                  atTime time: TimeInterval)
//    {
//        metalRender()
//    }
    
    func metalRender() {
        let viewport = CGRect(x: 0, y: 0, width: CGFloat(100), height: CGFloat(100))
        guard let drawable = metalLayer.nextDrawable() else { return }
        
        
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0, 1, 0, 1.0); //green
        renderPassDescriptor.colorAttachments[0].storeAction = .store
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        renderer.scene = scene
        renderer.pointOfView = self.gameView.pointOfView
        renderer.render(atTime: 0, viewport: viewport, commandBuffer: commandBuffer!, passDescriptor: renderPassDescriptor)
        
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    func resetView(_mode: EditMode = EditMode.ObjectMode,
                   _part: PartMode = PartMode.ObjectMode) {

        // Node
        let vNode = gameView.scene?.rootNode

        switch _mode {
        case .PositionMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = true

        case .ScaleMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = true

        case .RotateMode:
            vNode?.childNode(withName: "pos", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "scl", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "rot", recursively: true)?.isHidden = false

        default:
            vNode?.childNode(withName: "pos", recursively: true)?.removeFromParentNode()
            vNode?.childNode(withName: "scl", recursively: true)?.removeFromParentNode()
            vNode?.childNode(withName: "rot", recursively: true)?.removeFromParentNode()
        }

        // Parts
        switch _part {
        case .VertexMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true

        case .EdgeMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = true
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true

        case .FaceMode:
            vNode?.childNode(withName: "Vert", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Edge", recursively: true)?.isHidden = false
            vNode?.childNode(withName: "Face", recursively: true)?.isHidden = true

        default:
            vNode?.enumerateChildNodes({ child, _ in
                if child.categoryBitMask == 2 {
                    child.removeFromParentNode()
                }
            })
        }

        // reset emissions
        vNode?.enumerateChildNodes({ child, _ in
            if let geo = child.geometry {
                geo.firstMaterial?.emission.contents = Color.black
            }
        })

        gameView.setMode(_mode: _mode)
        gameView.setPart(_part: _part)
    }

    private var i = 0

    func changeMode() {
        if SCNOptions.count == i {
            i = 0
        }
        gameView.debugOptions.update(with: SCNOptions[i])
        i += 1
    }
    
    func copyModels() {
        models.removeAll()
        var tmp : [SCNNode] = []
        self.gameView.scene?.rootNode.enumerateChildNodes({ child, _ in
            if child.geometry != nil && child.categoryBitMask != 2 {
                tmp.append(child.clone())
            }
        })
        models = tmp
    }
    
    func setModels () {
        models.removeAll()
        
        var tmp : [SCNNode] = []
        self.gameView.scene?.rootNode.enumerateChildNodes({ child, _ in
            if child.geometry != nil && child.categoryBitMask != 2 {
                tmp.append(child.clone())
                child.removeFromParentNode()
            }
        })
        models = tmp
    }
    
    func getModels() {
        for node in models {
            self.gameView.scene?.rootNode.addChildNode(node)
        }
        models.removeAll()
    }

    /*
     * Mark : Key Event
     */

    override func keyDown(with event: NSEvent) {
        
        switch event.modifierFlags.intersection(NSEvent.ModifierFlags.deviceIndependentFlagsMask) {
            
        case [NSEvent.ModifierFlags.shift]:
            print("shift key is pressed")
        case [NSEvent.ModifierFlags.control]:
            print("control key is pressed")
        case [NSEvent.ModifierFlags.option]:
            print("option key is pressed")
        case [NSEvent.ModifierFlags.command]:
            print("Command key is pressed")
        default:
            break
        }

        switch event.characters! {

        case "q":
            resetView()

        case "t":
            resetView(_mode: .PositionMode)

        case "e":
            resetView(_mode: .ScaleMode)

        case "r":
            resetView(_mode: .RotateMode)

        case "a":
            gameView.setPart(_part: .ObjectMode)

        case "s":
            gameView.setPart(_part: .VertexMode)

        case "d":
            gameView.setPart(_part: .EdgeMode)

        case "f":
            gameView.setPart(_part: .VertexMode)
//            gameView.setPart(_part: .FaceMode)

        case "z":
            gitRevert()

        case "x":
            setModels()

        case "c":
            copyModels()

        case "v":
            getModels()

        case "":
            changeMode()

        default:
            break
        }

        // View Update
        gameView.draw(NSRect(x: 0, y: 0, width: 1000, height: 1000))
        gameView.needsDisplay = true
        super.keyDown(with: event)
    }
}
