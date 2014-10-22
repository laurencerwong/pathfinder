//
//  SplinePathRenderTexture.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/20/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCRenderTexture.h"

@interface SplinePathRenderTexture : CCRenderTexture
{
    int fromColorLocation;
    int toColorLocation;
    int timeLocation;
    float time;
    ccColor4F fromColor_;
    ccColor4F toColor_;
    CCGLProgram *oldShaderProgram;
}
@property (nonatomic)ccColor4F toColor;


+ (id)splinePathRenderTextureWithWidth:(int)width Height:(int)height;
- (void)setToFadeOut;

@end
