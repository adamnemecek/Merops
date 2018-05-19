//
//  ViewController.swift
//  MetalTessellation
//
//  Created by M.Ike on 2017/01/28.
//  Copyright © 2017年 M.Ike. All rights reserved.
//

import Cocoa
import MetalKit

class GameViewController: UIViewController, MetalEzClassDelegate {
    private var mtlEz: MetalEz!
    private var world: World!

    override func viewDidLoad() {
        super.viewDidLoad()
        mtlEz = MetalEz()
        mtlEz.delegate = self
        mtlEz.setupMetal(mtkView: self.view as! MTKView!)
        world = World(metalEz: self.mtlEz)
    }

    func update() {
        world.update()
    }

    func draw(type: MetalEzRenderingEngine.RendererType) {
        world.draw(type: type)
    }
}

class ViewController: NSViewController {
    private let defaultCameraMatrix = Matrix.lookAt(eye: float3(0, 2, 6), center: float3(), up: float3(0, 1, 0))
    private var renderer: Renderer!
    private var activeMeshRenderer: TessellationMeshRenderer? = nil
    private var totalTime = TimeInterval(0)

    var isWireFrame = false {
        didSet {
            renderer.isWireFrame = isWireFrame
            wireCheckButton.state = isWireFrame ? NSOnState : NSOffState
        }
    }

    var isTessellation = false {
        didSet {
            activeMeshRenderer?.isTesselasiton = isTessellation
            tessellationButton.selectedSegment = isTessellation ? 0 : 1
            tessellationSlider.isHidden = !isTessellation
            tessellationFactorLabel.isHidden = !isTessellation
        }
    }

    var tessellationFactor = Float(0) {
        didSet {
            activeMeshRenderer?.edgeFactor = tessellationFactor
            activeMeshRenderer?.insideFactor = tessellationFactor
            tessellationSlider.floatValue = tessellationFactor
            tessellationFactorLabel.stringValue = String(format: "%.02f", tessellationFactor)
        }
    }

    var phongFactor = Float(0) {
        didSet {
            activeMeshRenderer?.phongFactor = phongFactor
            phongSlider.floatValue = phongFactor
            phongFactorLabel.stringValue = String(format: "%.02f", phongFactor)
        }
    }

    var displacementFactor = Float(0) {
        didSet {
            activeMeshRenderer?.displacementFactor = displacementFactor
            displacementSlider.floatValue = displacementFactor
            displacementLabel.stringValue = String(format: "%.02f", displacementFactor)
        }
    }

    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMetal()
        mtkView.draw()

        totalTime = 0
        isPlaying = false
        renderer.targets.removeAll()
        if let mesh = activeMeshRenderer {
            activeMeshRenderer = nil
            mesh.isActive = false
        }
    }

    // MARK: -
    private func setupMetal() {
        mtkView.sampleCount = 4
        mtkView.depthStencilPixelFormat = .depth32Float_stencil8

        mtkView.colorPixelFormat = .bgra8Unorm
        mtkView.clearColor = MTLClearColorMake(0.3, 0.3, 0.3, 1)

        renderer = Renderer(view: mtkView)
        renderer.cameraMatrix = defaultCameraMatrix
        renderer.preUpdate = { [weak self] renderer in
            guard let `self` = self else {
                return
            }
            guard let active = self.activeMeshRenderer else {
                return
            }

            if self.isPlaying {
                self.totalTime += renderer.deltaTime
            }

            let scale = self.zoomSlider.floatValue
            active.modelMatrix = matrix_multiply(Matrix.scale(x: scale, y: scale, z: scale),
                    Matrix.rotation(radians: Float(self.totalTime) * 0.5, axis: float3(0, 1, 0)))
        }
    }

    @IBAction private func tapDemo2(sender: NSButton) {
        totalTime = 0
        isPlaying = false
        renderer.targets.removeAll()
        if let mesh = activeMeshRenderer {
            activeMeshRenderer = nil
            mesh.isActive = false
        }

        let sphere = GeometryMesh.meshDisplacementMap(
                shapeType: .sphere(radii: vector_float3(1), segments: vector_uint2(6)),
                diffuseTextureURL: Bundle.main.url(forResource: "Resources/sand", withExtension: "png")!,
                normalMapURL: Bundle.main.url(forResource: "Resources/white", withExtension: "png")!,
                displacementlMapURL: Bundle.main.url(forResource: "Resources/white", withExtension: "png")!,
                setupBaseMatrix: { return matrix_multiply(Matrix.scale(x: 4, y: 4, z: 4), $0) }
        )
        let meshRenderer = TessellationMeshRenderer(renderer: renderer, mesh: sphere)
        meshRenderer.displacementFactor = 0
        meshRenderer.displacementOffset = 0
        meshRenderer.phongFactor = 0
        meshRenderer.isActive = false
        renderer.targets.append(meshRenderer)

        startDemo(demo: .demo2,
                isPlaying: true,
                isWireFrame: true,
                isTessellation: false,
                tessellationFactor: Float(tessellationSlider.minValue),
                phongFactor: 0)
    }

    private func startDemo(demo: Demo, isPlaying: Bool, isWireFrame: Bool, isTessellation: Bool, tessellationFactor: Float, phongFactor: Float) {
        var isPlaying = isPlaying
        totalTime = 0
        activeMeshRenderer?.isActive = false
        activeMeshRenderer = renderer.targets.first as? TessellationMeshRenderer

        self.isPlaying = isPlaying
        self.isWireFrame = isWireFrame
        self.isTessellation = isTessellation
        self.tessellationFactor = tessellationFactor
        self.phongFactor = phongFactor
        activeMeshRenderer?.isActive = true
        checkFPS()
    }
}


class Realship {
    weak var world: World!
    private var drawers = [MetalEz.MeshDrawer]()
    private var rot: Float = 0.0
    var models = [HalfEdgeStructure.Model]()
    var mdlBffs = [MTLBuffer]()
    var vertexCounts = [Int]()

    init(world myworld: World) {
        world = myworld
        models.append(HalfEdgeStructure.LoadModel(mtlEz: world.mtlEz, name: "realship", reduction: 2300))
        models.append(HalfEdgeStructure.LoadModel(mtlEz: world.mtlEz, name: "realship", reduction: 0))

        for model in models {
            let tex = world.mtlEz.loader.loadTexture(name: "shipDiffuse", type: "png")
            let mesh = world.mtlEz.loader.loadMesh(name: "realship")
            let d = MetalEz.MeshDrawer(mtlEz: world.mtlEz, mesh: mesh, texture: tex)
            drawers.append(d)

            var mdlBff = world.mtlEz.line.makeVertexBuffer(count: model.polygons.count * 3 * 2)
            var pnts = [MetalEzLineRendererPoint]()
            print("faces count is ", model.polygons.count)
            for (_, fullEdge) in model.fullEdges {
                pnts.append(MetalEzLineRendererPoint(point: fullEdge.startVertex.toFloat4))
                pnts.append(MetalEzLineRendererPoint(point: fullEdge.endVertex.toFloat4))
            }
            world.mtlEz.line.set(points: pnts, buffer: &mdlBff)
            mdlBffs.append(mdlBff)
            let vertexCount = model.polygons.count * 3 * 2
            vertexCounts.append(vertexCount)
        }
    }

    func update() {
        rot += 0.5
        var mat = matrix_identity_float4x4
        mat = matrix_multiply(mat, Utils.translation(float3(0.9, 0.0, 0.0)))
        mat = matrix_multiply(mat, Utils.rotation_x(radians: toRad(fromDeg: -30)))
        mat = matrix_multiply(mat, Utils.rotation_y(radians: toRad(fromDeg: rot)))
        drawers[0].set(modelMatrix: mat)

        var mat1 = matrix_identity_float4x4
        mat1 = matrix_multiply(mat1, Utils.translation(float3(-0.9, 0.0, 0.0)))
        mat1 = matrix_multiply(mat1, Utils.rotation_x(radians: toRad(fromDeg: -30)))
        mat1 = matrix_multiply(mat1, Utils.rotation_y(radians: toRad(fromDeg: rot)))
        drawers[1].set(modelMatrix: mat1)
    }

    func draw(type: MetalEzRenderingEngine.RendererType) {
        if type == .line {
            for i in 0..<models.count {
                world.mtlEz.line.draw(vaertex: mdlBffs[i],
                        frameUniformBuffer: drawers[i].frameUniformBuffer,
                        count: vertexCounts[i])

            }
        }
    }
}

class Cube {
    weak var world: World!
    private var drawer: MetalEz.MeshDrawer
    private var rot: Float = 0.0

    init(world myworld: World) {
        world = myworld
        let tex = world.mtlEz.loader.loadTexture(name: "default", type: "png")
        let mesh = world.mtlEz.loader.loadMesh(name: "cube")
        drawer = MetalEz.MeshDrawer(mtlEz: world.mtlEz, mesh: mesh, texture: tex)
    }

    func update() {
        rot += 0.3
        var mat = matrix_identity_float4x4
        mat = matrix_multiply(mat, Utils.translation(float3(-3, -1, 3)))
        mat = matrix_multiply(mat, Utils.rotation_x(radians: toRad(fromDeg: rot)))
        drawer.set(modelMatrix: mat)
    }

    func draw(type: MetalEzRenderingEngine.RendererType) {
        if type == .mesh {
            drawer.draw()
        }
    }
}

class Camera {
    weak var world: World!
    private var rot: Float = 0
    private var sgn: Float = 0.01

    init(world myworld: World) {
        world = myworld
    }

    func update() {
        world.mtlEz.lookAt(from: float3(0, 1.0, -2.3), direction: normalize(float3(sin(rot), -1, 2)), up: float3(0, 1, 0))
    }
}

class World {
    weak var mtlEz: MetalEz!
    private var camera: Camera!
    private var realship: Realship!
    private var cube: Cube!

    init(metalEz: MetalEz) {
        mtlEz = metalEz
        camera = Camera(world: self)
        realship = Realship(world: self)
        cube = Cube(world: self)
    }

    func update() {
        camera.update()
        realship.update()
        cube.update()
    }

    func draw(type: MetalEzRenderingEngine.RendererType) {
        switch type {

        case .line:
            realship.draw(type: type)

        default: break
        }
    }
}
