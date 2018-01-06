#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <simd/simd.h>
#import <vector>
#import "ShaderTypes.h"

@interface RoxigaModel : NSObject
{
@protected
	std::vector<id <MTLTexture>> _texture;
	std::vector<std::vector<float>> _vertices;
	std::vector<std::vector<float>> _matricies;
	std::vector<id<MTLBuffer>> _vertexBuffer;
	std::vector<id <MTLBuffer>>  _matrixBuffer;
	id <MTLBuffer> _dynamicUniformBuffer;
	std::vector<id<MTLBuffer>> _colorBuffer;
	uint32_t _uniformBufferOffset;
	uint8_t _uniformBufferIndex;
	void* _uniformBufferAddress;
	std::vector<NSString*> _textureName;
	std::vector<simd::float4> _diffuse;
	std::vector<uint32_t> _vertexSize;
	uint32_t _animationSize;
	float _time;
	Uniforms * _uniforms;
	
@public
	bool _visible;
	uint32_t _maxBonesSize;
	simd::float3 _translation;
	simd::float3 _rotation;
	simd::float3 _scaling;
	int _currentAnimation;
	bool _isPlaying;
	bool _loop;
}
- (instancetype)initWithDevice:(id <MTLDevice>)device;
- (void)encoder:(id <MTLRenderCommandEncoder>)renderEncoder;
- (void)transform:(simd::float4x4)projectionMatrix viewMatrix:(simd::float4x4)viewMatrix;
- (void)updateDynamicBufferState;
- (void)setTexture:(id <MTLDevice>)device;
- (void)setColor:(id <MTLDevice>)device;
- (void)setMatrixAnimation:(id <MTLDevice>)device;
- (void)setUniformBuffer:(id <MTLDevice>)device;
- (void)playAnimation:(int)animation loop:(bool)loop;
- (void)stopAnimation;
- (void)setMaterial:(NSString*)texture r:(float)red g:(float)green b:(float)blue a:(float)alpha;
@end

