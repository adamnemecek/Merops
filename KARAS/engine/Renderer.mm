//#import <simd/simd.h>
//#import <ModelIO/ModelIO.h>
//#import "RoxigaModel.h"
//#import "Renderer.h"
//#import "AAPLTransforms.h"
//#import "ShaderTypes.h"
//#import <vector>
//
//static const NSUInteger kMaxBuffersInFlight = 3;
//
//@implementation Renderer {
//    dispatch_semaphore_t _inFlightSemaphore;
//    id <MTLDevice> _device;
//    id <MTLCommandQueue> _commandQueue;
//    id <MTLRenderPipelineState> _pipelineState;
//    id <MTLDepthStencilState> _depthState;
//    simd::float4x4 _projectionMatrix;
//    std::vector<RoxigaModel *> _models;
//    id <MTLSamplerState> _sampler;
//}
//
//- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)view; {
//    self = [super init];
//    if (self) {
//        _device = view.device;
//        _inFlightSemaphore = dispatch_semaphore_create(kMaxBuffersInFlight);
//        [self loadMetalWithView:view];
//    }
//
//    return self;
//}
//
//- (void)loadMetalWithView:(nonnull MTKView *)view; {
//    view.depthStencilPixelFormat = MTLPixelFormatDepth32Float_Stencil8;
//    view.colorPixelFormat = MTLPixelFormatBGRA8Unorm_sRGB;
//    view.sampleCount = 1;
//
//    id <MTLLibrary> defaultLibrary = [_device newDefaultLibrary];
//
//    id <MTLFunction> vertexFunction = [defaultLibrary newFunctionWithName:@"vertexShader"];
//
//    id <MTLFunction> fragmentFunction = [defaultLibrary newFunctionWithName:@"fragmentShader"];
//
//    MTLRenderPipelineDescriptor *pipelineStateDescriptor = [[MTLRenderPipelineDescriptor alloc] init];
//    pipelineStateDescriptor.label = @"MyPipeline";
//    pipelineStateDescriptor.sampleCount = view.sampleCount;
//    pipelineStateDescriptor.vertexFunction = vertexFunction;
//    pipelineStateDescriptor.fragmentFunction = fragmentFunction;
//    pipelineStateDescriptor.colorAttachments[0].pixelFormat = view.colorPixelFormat;
//    pipelineStateDescriptor.depthAttachmentPixelFormat = view.depthStencilPixelFormat;
//    pipelineStateDescriptor.stencilAttachmentPixelFormat = view.depthStencilPixelFormat;
//
//    NSError *error = NULL;
//    _pipelineState = [_device newRenderPipelineStateWithDescriptor:pipelineStateDescriptor error:&error];
//    if (!_pipelineState) {
//        NSLog(@"Failed to created pipeline state, error %@", error);
//    }
//
//    MTLDepthStencilDescriptor *depthStateDesc = [[MTLDepthStencilDescriptor alloc] init];
//    depthStateDesc.depthCompareFunction = MTLCompareFunctionLess;
//    depthStateDesc.depthWriteEnabled = YES;
//    _depthState = [_device newDepthStencilStateWithDescriptor:depthStateDesc];
//
//    _commandQueue = [_device newCommandQueue];
//
//    MTLSamplerDescriptor *samplerDescriptor = [[MTLSamplerDescriptor alloc] init];
//    samplerDescriptor.minFilter = MTLSamplerMinMagFilterNearest;
//    samplerDescriptor.magFilter = MTLSamplerMinMagFilterLinear;
//    samplerDescriptor.sAddressMode = MTLSamplerAddressModeRepeat;
//    samplerDescriptor.tAddressMode = MTLSamplerAddressModeRepeat;
//    _sampler = [_device newSamplerStateWithDescriptor:samplerDescriptor];
//
//    MTLRenderPipelineColorAttachmentDescriptor *renderbufferAttachment = pipelineStateDescriptor.colorAttachments[0];
//    renderbufferAttachment.blendingEnabled = YES;
//    renderbufferAttachment.rgbBlendOperation = MTLBlendOperationAdd;
//    renderbufferAttachment.alphaBlendOperation = MTLBlendOperationAdd;
//    renderbufferAttachment.sourceRGBBlendFactor = MTLBlendFactorSourceAlpha;
//    renderbufferAttachment.sourceAlphaBlendFactor = MTLBlendFactorSourceAlpha;
//    renderbufferAttachment.destinationRGBBlendFactor = MTLBlendFactorOneMinusSourceAlpha;
//    renderbufferAttachment.destinationAlphaBlendFactor = MTLBlendFactorOneMinusSourceAlpha;
//}
//
//- (RoxigaModel *)loadModel:(id)model {
//    RoxigaModel *instance = [model initWithDevice:_device];
//    if (!instance) {
//        NSLog(@"ERROR: Failed creating a object!");
//        assert(0);
//    }
//    [instance setTexture:_device];
//    [instance setColor:_device];
//    [instance setMatrixAnimation:_device];
//    [instance setUniformBuffer:_device];
//    _models.push_back(instance);
//
//    return instance;
//}
//
//- (void)drawInMTKView:(nonnull MTKView *)view {
//    /// Per frame updates here
//
//    dispatch_semaphore_wait(_inFlightSemaphore, DISPATCH_TIME_FOREVER);
//
//    id <MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
//    commandBuffer.label = @"MyCommand";
//
//    __block dispatch_semaphore_t block_sema = _inFlightSemaphore;
//    [commandBuffer addCompletedHandler:^(id <MTLCommandBuffer> buffer) {
//        dispatch_semaphore_signal(block_sema);
//    }];
//
//    /// Delay getting the currentRenderPassDescriptor until we absolutely need it to avoid
//    ///   holding onto the drawable and blocking the display pipeline any longer than necessary
//    MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;
//
//    if (renderPassDescriptor != nil) {
//        simd::float4x4 viewMatrix = AAPL::Math::lookAt(_eye, _center, _up);
//        /// Final pass rendering code here
//        MTLRenderPassColorAttachmentDescriptor *colorAttachment = renderPassDescriptor.colorAttachments[0];
//        colorAttachment.clearColor = _bgColor;
//
//        id <MTLRenderCommandEncoder> renderEncoder =
//                [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
//        renderEncoder.label = @"MyRenderEncoder";
//
//        [renderEncoder pushDebugGroup:@"DrawModel"];
//
//        [renderEncoder setFrontFacingWinding:MTLWindingCounterClockwise];
//        [renderEncoder setCullMode:MTLCullModeBack];
//        [renderEncoder setRenderPipelineState:_pipelineState];
//        [renderEncoder setDepthStencilState:_depthState];
//        [renderEncoder setFragmentSamplerState:_sampler atIndex:0];
//
//        for (int i = 0; i < _models.size(); ++i) {
//            [_models[i] updateDynamicBufferState];
//            [_models[i] transform:_projectionMatrix viewMatrix:viewMatrix];
//            [_models[i] encoder:renderEncoder];
//        }
//
//        [renderEncoder popDebugGroup];
//        [renderEncoder endEncoding];
//        [commandBuffer presentDrawable:view.currentDrawable];
//    }
//
//    [commandBuffer commit];
//}
//
//- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
//    float aspect = size.width / size.height;
//    _projectionMatrix = AAPL::Math::perspective_fov(65, aspect, 0.1f, 10000.0f);
//}
//
//@end
