//
// Created by sumioka-air on 2018/05/05.
// Copyright (c) 2018 sho sumioka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MaterialXModel : NSObject {
//@protected

@public
    bool _visible;
}

- (void)setTexture:(id <MTLDevice>)device;

@end