////
//// Created by sumioka-air on 2018/05/17.
//// Copyright (c) 2018 sho sumioka. All rights reserved.
////
//
//import Foundation
//import MetalKit
////#import <simd/simd.h
////#import <ModelIO/ModelIO.h
////#import <vector
//
////static const NSUInteger kMaxBuffersInFlight = 3
//
//class Renderer : MTKViewDelegate {
//    let _inFlightSemaphore : dispatch_semaphore_t
//    let _device : MTLDevice
//    let _commandQueue : MTLCommandQueue
//    let _pipelineState : MTLRenderPipelineState
//    let _depthState : MTLDepthStencilState
////    simd::float4x4 _projectionMatrix
//    var _models : [RoxigaModel]
//    let _sampler : MTLSamplerState
//
//
//    func initWithMetalKitView(view : MTKView) {
//        _device = view.device
//        _inFlightSemaphore = dispatch_semaphore_create(kMaxBuffersInFlight)
//        self.loadMetalWithView(view)
//    }
//
//    func loadMetalWithView(view : MTKView) {
//        view.depthStencilPixelFormat = MTLPixelFormatDepth32Float_Stencil8
//        view.colorPixelFormat = MTLPixelFormatBGRA8Unorm_sRGB
//        view.sampleCount = 1
//
//        let defaultLibrary = _device.newDefaultLibrary()
//        let vertexFunction = defaultLibrary.newFunctionWithName = "vertexShader"
//        let fragmentFunction = defaultLibrary.newFunctionWithName = "fragmentShader"
//
//        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
//        pipelineStateDescriptor.label = "MyPipeline"
//        pipelineStateDescriptor.sampleCount = view.sampleCount
//        pipelineStateDescriptor.vertexFunction = vertexFunction
//        pipelineStateDescriptor.fragmentFunction = fragmentFunction
//        pipelineStateDescriptor.colorAttachments[0.pixelFormat = view.colorPixelFormat
//        pipelineStateDescriptor.depthAttachmentPixelFormat = view.depthStencilPixelFormat
//        pipelineStateDescriptor.stencilAttachmentPixelFormat = view.depthStencilPixelFormat
//
//        NSError error = NULL
//        _pipelineState = [_device newRenderPipelineStateWithDescriptor:pipelineStateDescriptor error:&error
//        if (!_pipelineState) {
//            NSLog("Failed to created pipeline state, error %", error)
//        }
//
//        let depthStateDesc = MTLDepthStencilDescriptor()
//        depthStateDesc.depthCompareFunction = MTLCompareFunctionLess
//        depthStateDesc.depthWriteEnabled = YES
//    //    _depthState = [_device newDepthStencilStateWithDescriptor:depthStateDesc
//
//        _commandQueue = _device.newCommandQueue
//
//        let samplerDescriptor = MTLSamplerDescriptor()
//        samplerDescriptor.minFilter = MTLSamplerMinMagFilterNearest
//        samplerDescriptor.magFilter = MTLSamplerMinMagFilterLinear
//        samplerDescriptor.sAddressMode = MTLSamplerAddressModeRepeat
//        samplerDescriptor.tAddressMode = MTLSamplerAddressModeRepeat
//    //    _sampler = [_device newSamplerStateWithDescriptor:samplerDescriptor
//
//        let renderbufferAttachment = pipelineStateDescriptor.colorAttachments[0]
//        renderbufferAttachment.blendingEnabled = YES
//        renderbufferAttachment.rgbBlendOperation = MTLBlendOperationAdd
//        renderbufferAttachment.alphaBlendOperation = MTLBlendOperationAdd
//        renderbufferAttachment.sourceRGBBlendFactor = MTLBlendFactorSourceAlpha
//        renderbufferAttachment.sourceAlphaBlendFactor = MTLBlendFactorSourceAlpha
//        renderbufferAttachment.destinationRGBBlendFactor = MTLBlendFactorOneMinusSourceAlpha
//        renderbufferAttachment.destinationAlphaBlendFactor = MTLBlendFactorOneMinusSourceAlpha
//    }
//
//    func loadModel (model : RoxigaModel) -> RoxigaModel {
//        RoxigaModel instance = [model initWithDevice:_device
//        if (!instance) {
//            NSLog("ERROR: Failed creating a object!")
//            assert(0)
//        }
//        [instance setTexture:_device
//        [instance setColor:_device
//        [instance setMatrixAnimation:_device
//        [instance setUniformBuffer:_device
//        _models.push_back(instance)
//
//        return instance
//    }
//
//    func drawInMTKView(view : MTKView ) {
//        /// Per frame updates here
//
//        dispatch_semaphore_wait(_inFlightSemaphore, DISPATCH_TIME_FOREVER)
//
//        let commandBuffer = _commandQueue.commandBuffer()
//        commandBuffer.label = "MyCommand"
//
//        __block dispatch_semaphore_t block_sema = _inFlightSemaphore
//        commandBuffer.addCompletedHandler(buffer) {
//            dispatch_semaphore_signal(block_sema)
//        }
//
//        /// Delay getting the currentRenderPassDescriptor until we absolutely need it to avoid
//        ///   holding onto the drawable and blocking the display pipeline any longer than necessary
//        let renderPassDescriptor = view.currentRenderPassDescriptor()
//
//        if (renderPassDescriptor != nil) {
//            simd::float4x4 viewMatrix = AAPL::Math::lookAt(_eye, _center, _up)
//            /// Final pass rendering code here
//            MTLRenderPassColorAttachmentDescriptor colorAttachment = renderPassDescriptor.colorAttachments[0]
//            colorAttachment.clearColor = _bgColor
//
//            MTLRenderCommandEncoder renderEncoder =
//                    [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor
//            renderEncoder.label = "MyRenderEncoder"
//
//            [renderEncoder pushDebugGroup:"DrawModel"
//
//            [renderEncoder setFrontFacingWinding:MTLWindingCounterClockwise
//            [renderEncoder setCullMode:MTLCullModeBack
//            [renderEncoder setRenderPipelineState:_pipelineState
//            [renderEncoder setDepthStencilState:_depthState
//            [renderEncoder setFragmentSamplerState:_sampler atIndex:0
//
//            for model in models {
////                model.updateDynamicBufferState()
////                model.transform:_projectionMatrix viewMatrix:viewMatrix]
////                model.encoderrenderEncoder
//            }
//
//            renderEncoder.popDebugGroup()
//            renderEncoder.endEncoding()
//            commandBuffer.presentDrawable(view.currentDrawable)
//        }
//        commandBuffer.commit()
//    }
//    func mtkView:(nonnull MTKView )view drawableSizeWillChange:(CGSize)size {
//        float aspect = size.width / size.height
//        _projectionMatrix = AAPL::Math::perspective_fov(65, aspect, 0.1f, 10000.0f)
//    }
//}
//
