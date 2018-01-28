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
import CoreML


class GameViewController: SuperViewController, SCNSceneRendererDelegate, SCNNodeRendererDelegate {
    
    // Model
    var scene = SCNScene()
    var models : [SCNNode] = []
    
    // View
    @IBOutlet weak var gameView: GameView!
    var console: ConsoleView!
    var overray : GameViewOverlay!
    var w : CGFloat!
    var h : CGFloat!
    
    // Metal
    var device:MTLDevice!
    var commandQueue: MTLCommandQueue!
    var render: SCNRenderer!
    var metalBuffer : MTLCommandBuffer!
    var metalRenderDescripter : MTLRenderPassDescriptor!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneInit()
        
        // HUD
        self.gameView.overlaySKScene = GameViewOverlay(
            size: self.gameView.frame.size, view: self.gameView
        )
        overray = self.gameView.overlaySKScene as! GameViewOverlay
        overray.isUserInteractionEnabled = false
        
        // Console
        console = ConsoleView(frame: self.gameView.frame)
        self.gameView.addSubview(console)
        console.isHidden = true
        
        w = self.gameView.frame.size.width
        h = self.gameView.frame.size.height
        
        // Metal Render
        if self.gameView.renderingAPI == SCNRenderingAPI.metal {
            device = MTLCreateSystemDefaultDevice()
            commandQueue = device.makeCommandQueue()
            render = SCNRenderer(device: device, options: nil)
            render.scene = scene
        } else {
            fatalError("Metal only")
        }
        
        // set the scene to the view
        self.gameView.scene = render.scene
        self.gameView.allowsCameraControl = true
        self.gameView.showsStatistics = true
        self.gameView.backgroundColor = Color.black
        self.gameView.autoenablesDefaultLighting = true
        self.gameView.delegate = self
    }

    func sceneInit() {
        
        // Geometry
        scene.rootNode.name = "root"
        scene.rootNode.addChildNode(
            custumGeo()
        )
        // camera ポジションのせいでファイルが消えるので注意
        let camera = createCam(name: "camera1")
        camera.position = SCNVector3(x: 0, y: 5, z: 30)
        let light = createLight(name: "light1")
        scene.rootNode.addChildNode(light)
        
        // asset initialize
        let asset = USDExporter.exportFromAsset(scene: scene)
        scene = SCNScene(mdlAsset: asset)
        
        self.gameView.defaultCameraController.clearRoll()
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene,
                  atTime time: TimeInterval)
    {
        let viewport = CGRect(x: 0, y: 0, width: w, height: h)
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0, 1, 0, 1.0); //green
        renderPassDescriptor.colorAttachments[0].storeAction = .store
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
//        renderEncoder?.endEncoding()
        
        // TODO: ジオメトリのバーテックスを渡してMetal シェーダで処理して戻す
        scene.rootNode.enumerateChildNodes({child, _ in
            child.geometry?.sources(for: .vertex).forEach {
                print($0)
            }
        })
        // reuse scene1 and the current point of view
        render.scene = scene
        render.pointOfView = self.gameView.pointOfView
        render.render(atTime: 0, viewport: viewport,
                      commandBuffer: commandBuffer!, passDescriptor: renderPassDescriptor)
        commandBuffer?.commit()
        commandBuffer?.waitUntilCompleted()
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
        models.forEach {
            self.gameView.scene?.rootNode.addChildNode($0)
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
