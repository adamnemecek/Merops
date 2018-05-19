//
// Created by sumioka-air on 2018/05/01.
// Copyright (c) 2018 sho sumioka. All rights reserved.
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

enum Giz {
    case position, rotate, scale
}

struct Settings: Codable {
    let hello: String
    let key: String?
    let int: Int
    let double: Double
    let url: URL
}

//let data = Data
//
//let decoder: JSONDecoder = JSONDecoder()
//let encoder: JSONEncoder = JSONEncoder()
//do {
//    let settings: Settings = try decoder.decode(Settings.self, from: data)
//    print(settings) //Success!!!
//} catch {
//    print("json convert failed in JSONDecoder", error.localizedDescription)
//}