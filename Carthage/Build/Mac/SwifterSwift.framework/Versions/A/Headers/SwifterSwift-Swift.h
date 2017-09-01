// Generated by Apple Swift version 3.1 (swiftlang-802.0.53 clang-802.0.42)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import CoreLocation;
@import Foundation;
@import AppKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

@interface CLLocation (SWIFT_EXTENSION(SwifterSwift))
/// SwifterSwift: Calculate the half-way point along a great circle path between the two points.
/// \param start Start location.
///
/// \param end End location.
///
///
/// returns:
/// Location that represents the half-way point.
+ (CLLocation * _Nonnull)midLocationWithStart:(CLLocation * _Nonnull)start end:(CLLocation * _Nonnull)end SWIFT_WARN_UNUSED_RESULT;
/// SwifterSwift: Calculate the half-way point along a great circle path between self and another points.
/// \param point End location.
///
///
/// returns:
/// Location that represents the half-way point.
- (CLLocation * _Nonnull)midLocationTo:(CLLocation * _Nonnull)point SWIFT_WARN_UNUSED_RESULT;
/// SwifterSwift: Calculates the bearing to another CLLocation.
/// \param destination Location to calculate bearing.
///
///
/// returns:
/// Calculated bearing degrees in the range 0° … 360°
- (double)bearingTo:(CLLocation * _Nonnull)destination SWIFT_WARN_UNUSED_RESULT;
@end


@interface NSAttributedString (SWIFT_EXTENSION(SwifterSwift))
@end

@class NSColor;

@interface NSAttributedString (SWIFT_EXTENSION(SwifterSwift))
/// SwifterSwift: Add color to NSAttributedString.
/// \param color text color.
///
///
/// returns:
/// a NSAttributedString colored with given color.
- (NSAttributedString * _Nonnull)coloredWith:(NSColor * _Nonnull)color SWIFT_WARN_UNUSED_RESULT;
@end


@interface NSAttributedString (SWIFT_EXTENSION(SwifterSwift))
/// SwifterSwift: Underlined string.
@property (nonatomic, readonly, strong) NSAttributedString * _Nonnull underlined;
/// SwifterSwift: Struckthrough string.
@property (nonatomic, readonly, strong) NSAttributedString * _Nonnull struckthrough;
@end


@interface NSColor (SWIFT_EXTENSION(SwifterSwift))
@end


@interface NSColor (SWIFT_EXTENSION(SwifterSwift))
@end


@interface NSColor (SWIFT_EXTENSION(SwifterSwift))
@end


@interface NSColor (SWIFT_EXTENSION(SwifterSwift))
/// SwifterSwift: Create NSColor from hexadecimal value with optional transparency.
/// \param hex hex Int (example: 0xDECEB5).
///
/// \param transparency optional transparency value (default is 1).
///
- (nonnull instancetype)initWithHex:(NSInteger)hex transparency:(CGFloat)transparency;
/// SwifterSwift: Create NSColor from hexadecimal string with optional transparency (if applicable).
/// \param hexString hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
///
/// \param transparency optional transparency value (default is 1).
///
- (nullable instancetype)initWithHexString:(NSString * _Nonnull)hexString transparency:(CGFloat)transparency;
/// SwifterSwift: Create NSColor from RGB values with optional transparency.
/// \param red red component.
///
/// \param green green component.
///
/// \param blue blue component.
///
/// \param transparency optional transparency value (default is 1).
///
- (nonnull instancetype)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue transparency:(CGFloat)transparency;
@end


@interface NSView (SWIFT_EXTENSION(SwifterSwift))
/// SwifterSwift: Add array of subviews to view.
/// \param subviews array of subviews to add to self.
///
- (void)addSubviews:(NSArray<NSView *> * _Nonnull)subviews;
/// SwifterSwift: Remove all subviews in view.
- (void)removeSubviews;
@end


@interface NSView (SWIFT_EXTENSION(SwifterSwift))
@property (nonatomic, strong) NSColor * _Nullable borderColor;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat height;
@property (nonatomic, strong) NSColor * _Nullable shadowColor;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic) float shadowOpacity;
@property (nonatomic) CGFloat shadowRadius;
/// SwifterSwift: Size of view.
@property (nonatomic) CGSize size;
/// SwifterSwift: Width of view.
@property (nonatomic) CGFloat width;
@end

#pragma clang diagnostic pop