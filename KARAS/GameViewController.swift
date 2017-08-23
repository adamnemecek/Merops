//
//  GameViewController.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import SpriteKit
import SceneKit
import QuartzCore

class GameViewController: SuperViewController {
    
    @IBOutlet weak var gameView: GameView!
    let sg = NSPanGestureRecognizer()
//    NSClickGestureRecognizer()
//    NSMagnificationGestureRecognizer()
//    NSPanGestureRecognizer()
//    NSPressGestureRecognizer()
//    NSRotationGestureRecognizer()
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneInit()
        
        // Gesture Event
//        sg.isEnabled = true
//        sg.target = self
//        sg.action = #selector(pan(_:))
//        self.view.addGestureRecognizer(sg)
    }

    func sceneInit() {
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // retrieve the ship node
        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        // camera
        let camera = createCam()
        scene.rootNode.addChildNode(camera)
        camera.position = SCNVector3(x: 0, y: 0, z: 15)
        
        
        // light
        let omni = createLight(type: .probe)
        omni.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(omni)
        
        
        // set the scene to the view
        self.gameView.scene = scene
        self.gameView.allowsCameraControl = true
        self.gameView.showsStatistics = true
        self.gameView.backgroundColor = Color.black
        self.gameView.autoenablesDefaultLighting = true

//        self.gameView.overlaySKScene = GameViewOverlay(size: self.gameView.frame.size)
//        for i in 0..<4 {
//            let btn = SKSpriteNode(color: Color(hue: 0, saturation: 0.8, brightness: 1, alpha: 0.8), size: CGSize(width: 20, height: 20))
//            btn.name = "btn\(i)"
//            let p = self.gameView.projectPoint(scene.rootNode.presentation.position)
//            let x = CGFloat(40 * cos(Float(i) * Float(Double.pi) / 2.0)) + p.x
//            let y = CGFloat(40 * sin(Float(i) * Float(Double.pi) / 2.0)) + p.y
//            btn.position = CGPoint(x:CGFloat(x), y:self.gameView!.bounds.maxY - CGFloat(y))
//            self.gameView.overlaySKScene?.addChild(btn)
//        }
        
        USDExporter.exportAssetFrom(scene: scene)
        USDExporter.exportText()

        gitInit()
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
            break
        }
        
        // reset emission
        vNode?.enumerateChildNodes({ child, _ in
            if let geo = child.geometry {
                geo.firstMaterial?.emission.contents = Color.black
            }
        })
        
        gameView.setMode(_mode: _mode)
        gameView.setPart(_part: _part)
        
        NSLog("MODE: \(_mode) PART: \(_part)")
    }
    
    private var i = 0
    
    func changeMode() {
        if SCNoptions.count == i { i = 0 }
        
        gameView.debugOptions.update(with: SCNoptions[i])
        i += 1
    }
    
    /* ------------------------
     
     Key Event
          
     ------------------------ */
    
    override func keyDown(with event: NSEvent) {
        super.keyDown(with: event)
        
        switch event.keyCode {
            
        case 12: // Q
            resetView()
            
        case 13: // W
            resetView(_mode: .PositionMode)
            
        case 14: // E
            resetView(_mode: .ScaleMode)
            
        case 15: // R
            resetView(_mode: .RotateMode)
            
        case 0: // A
            gameView.setPart(_part: .ObjectMode)
            
        case 1: // S
            gameView.setPart(_part: .VertexMode)
            
        case 2: // D
            gameView.setPart(_part: .EdgeMode)
            
        case 3: // F
            gameView.setPart(_part: .FaceMode)
            
        case 6: // Z
//            git reset --hard HEAD
            break
            
        case 7: // X
            self.gameView.scene?.rootNode.enumerateChildNodes({ child, _ in
                if child.geometry != nil {
                    child.removeFromParentNode()
                }
            })
            
        case 8: // C
            break
            
        case 9: // V
            break
            
        case 49: // Space
            changeMode()
            
        default:
            break
        }
        
        // View Update
        gameView.draw(NSRect(x: 0, y: 0, width: 1000, height: 1000))
        gameView.needsDisplay = true
    }
    
    override func flagsChanged(with event: NSEvent) {
        
        switch event.modifierFlags.intersection(.deviceIndependentFlagsMask) {
        case [.shift]:
            print("shift key is pressed")
        case [.control]:
            print("control key is pressed")
        case [.option] :
            print("option key is pressed")
        case [.command]:
            print("Command key is pressed")
        case [.control, .shift]:
            print("control-shift keys are pressed")
        case [.option, .shift]:
            print("option-shift keys are pressed")
        case [.command, .shift]:
            print("command-shift keys are pressed")
        case [.control, .option]:
            print("control-option keys are pressed")
        case [.control, .command]:
            print("control-command keys are pressed")
        case [.option, .command]:
            print("option-command keys are pressed")
        case [.shift, .control, .option]:
            print("shift-control-option keys are pressed")
        case [.shift, .control, .command]:
            print("shift-control-command keys are pressed")
        case [.control, .option, .command]:
            print("control-option-command keys are pressed")
        case [.shift, .command, .option]:
            print("shift-command-option keys are pressed")
        case [.shift, .control, .option, .command]:
            print("shift-control-option-command keys are pressed")
        default:
            print("no modifier keys are pressed")
        }
    }
    
    func pan(_ g: GestureRecognizer){
        let p = g.location(in: self.view)
    }
    
}
