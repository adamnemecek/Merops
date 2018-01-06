//
//  RoxigaMain.h
//  RoxigaEngine
//
//  Created by 大西 武 on 2017/06/28.
//  Copyright © 2017年 大西 武. All rights reserved.
//


#pragma once

#import <MetalKit/MetalKit.h>
#import "Renderer.h"

@interface RoxigaMain : Renderer
{
}
-(void)touchesBegan:(NSSet<NSTouch *> *)touches withEvent:(NSEvent *)event view:(MTKView *)view;
-(void)touchesMoved:(NSSet<NSTouch *> *)touches withEvent:(NSEvent *)event view:(MTKView *)view;
-(void)touchesEnded:(NSSet<NSTouch *> *)touches withEvent:(NSEvent *)event view:(MTKView *)view;
@end
