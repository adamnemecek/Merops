//
//  AppDelegate.swift
//  KARAS
//
//  Created by sumioka-air on 2017/04/30.
//  Copyright (c) 2017年 sho sumioka. All rights reserved.
//

import SceneKit

let SCNOptions: [SCNDebugOptions] = [
    .showPhysicsShapes,
    .showBoundingBoxes,
    .showLightInfluences,
    .showLightExtents,
    .showPhysicsFields,
    .showWireframe
]

enum EditMode {
    case ObjectMode, PositionMode, ScaleMode, RotateMode
}

enum PartMode {
    case ObjectMode, VertexMode, EdgeMode, FaceMode
}

#if os(OSX)
    
import Cocoa
public typealias SuperViewController = NSViewController
public typealias Color = NSColor
public typealias GestureRecognizer = NSPanGestureRecognizer

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
    }
}
    
#elseif os(iOS)
    
import UIKit
public typealias SuperViewController = UIViewController
public typealias Color = UIColor
public typealias GestureRecognizer = UIGestureRecognizer

#endif