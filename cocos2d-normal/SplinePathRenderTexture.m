//
//  SplinePathRenderTexture.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/20/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "SplinePathRenderTexture.h"
#import "CCFileUtils.h"
#import "CCGLProgram.h"
#import "ccShaders.h"

@implementation SplinePathRenderTexture
@synthesize toColor = toColor_;

+ (id)splinePathRenderTextureWithWidth:(int)width Height:(int)height
{
    return [[self alloc] initWithWidth:width Height:height];
}

- (id)initWithWidth:(int)width Height:(int)height
{
    self = [super initWithWidth:width height:height pixelFormat:kCCTexture2DPixelFormat_RGB5A1];
    if (self) {
        [self.sprite.texture setAliasTexParameters];
        const GLchar * fragmentSource = (GLchar*) [[NSString stringWithContentsOfFile:[[CCFileUtils sharedFileUtils] fullPathForFilename:@"ChangeColor.fsh"] encoding:NSUTF8StringEncoding error:nil] UTF8String];
        
        if(fragmentSource == NULL)
        {
            assert(false);
        }
        oldShaderProgram = self.sprite.shaderProgram;
        self.sprite.shaderProgram  = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureA8Color_vert fragmentShaderByteArray:fragmentSource];
        [self.sprite.shaderProgram addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
        [self.sprite.shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
        [self.sprite.shaderProgram link];
        [self.sprite.shaderProgram updateUniforms];
        [self.sprite.shaderProgram use];
        
        fromColor_ = ccc4f(1, 1, 1, 1);
        toColor_ = ccc4f(1, 1, 1, 1);
        toColorLocation = glGetUniformLocation(self.sprite.shaderProgram->_program, "v_toColor");
        glUniform4f(toColorLocation, toColor_.r, toColor_.g, toColor_.b, toColor_.a);
        fromColorLocation = glGetUniformLocation(self.sprite.shaderProgram->_program, "v_fromColor");
        glUniform4f(fromColorLocation, fromColor_.r, fromColor_.g, fromColor_.b, fromColor_.a);
        timeLocation = glGetUniformLocation(self.sprite.shaderProgram->_program, "f_time");
        glUniform1f(timeLocation, 1.0);
        [self.sprite setBlendFunc:(ccBlendFunc){GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA}];
    }
    return self;
}

-(void)setToFadeOut
{
    //hella HELLA hacky way to fade out without implementing the cocos2d standard that lets you use ccfadeout
    CCRenderTexture *rt = [CCRenderTexture renderTextureWithWidth:self.contentSize.width height:self.contentSize.height];
    [rt beginWithClear:0 g:0 b:0 a:0];
    self.sprite.flipX = YES;
    self.sprite.position = CGPointMake(self.sprite.contentSize.width/2, self.sprite.contentSize.height/2);
    [self.sprite visit];
    [rt end];
    self.sprite.texture = rt.sprite.texture;
    self.sprite.textureRect = rt.sprite.textureRect;
    self.sprite.position = CGPointMake(0, 0);
    self.sprite.shaderProgram = oldShaderProgram;
     
    //self.toColor = ccc4f(toColor_.r, toColor_.g, toColor_.b, 0.0);
    
}


-(void)update:(ccTime)delta
{
    if(time + delta <= 1)
    {
        time += delta;
    }
    [self.sprite.shaderProgram use];
    glUniform1f(timeLocation, time);
    
}

-(void)setToColor:(ccColor4F)color
{
    fromColor_ = toColor_;
    toColor_ = color;
    time = 0.0;
    [self.sprite.shaderProgram use];
    glUniform4f(fromColorLocation, fromColor_.r, fromColor_.g, fromColor_.b, fromColor_.a);
    glUniform4f(toColorLocation, toColor_.r, toColor_.g, toColor_.b, toColor_.a);
    glUniform1f(timeLocation, time);
}

@end
