//
// Created by sumioka-air on 2018/05/01.
// Copyright (c) 2018 sho sumioka. All rights reserved.
//

import Foundation

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