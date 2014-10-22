//
//  ColoredSprite.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "ColoredSprite.h"
#import "CCFileUtils.h"
#import "CCGLProgram.h"
#import "ccShaders.h"

@implementation ColoredSprite
@synthesize color = toColor_;

+(id)ColoredSpriteWithFile:(NSString *)filename AndColor:(ccColor4F)inColor
{
    return [[self alloc] initWithFile:filename AndColor:inColor];
}
- (id)initWithFile:(NSString *)filename AndColor:(ccColor4F)inColor
{
    self = [super initWithFile:filename];
    if (self) {
        const GLchar * fragmentSource = (GLchar*) [[NSString stringWithContentsOfFile:[[CCFileUtils sharedFileUtils] fullPathForFilename:@"ChangeColor.fsh"] encoding:NSUTF8StringEncoding error:nil] UTF8String];
        
        if(fragmentSource == NULL)
        {
            assert(false);
        }
        self.shaderProgram  = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureA8Color_vert fragmentShaderByteArray:fragmentSource];
        [self.shaderProgram addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
        [self.shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
        [self.shaderProgram link];
        [self.shaderProgram updateUniforms];
        [self.shaderProgram use];
        
        fromColor_ = ccc4f(1, 1, 1, 1);
        toColor_ = inColor;
        toColorLocation = glGetUniformLocation(self.shaderProgram->_program, "v_toColor");
        glUniform4f(toColorLocation, inColor.r, inColor.g, inColor.b, inColor.a);
        fromColorLocation = glGetUniformLocation(self.shaderProgram->_program, "v_fromColor");
        glUniform4f(fromColorLocation, fromColor_.r, fromColor_.g, fromColor_.b, fromColor_.a);
        timeLocation = glGetUniformLocation(self.shaderProgram->_program, "f_time");
        glUniform1f(timeLocation, 1.0);
        [self scheduleUpdate];
    }
    return self;
}
-(void)update:(ccTime)delta
{
    if(time + delta <= 1)
    {
        time += delta;
    }
    [self.shaderProgram use];
    glUniform1f(timeLocation, time);
    
}

-(void)setColor:(ccColor4F)color
{
    fromColor_ = toColor_;
    toColor_ = color;
    time = 0.0;
    [self.shaderProgram use];
    glUniform4f(fromColorLocation, fromColor_.r, fromColor_.g, fromColor_.b, fromColor_.a);
    glUniform4f(toColorLocation, color.r, color.g, color.b, color.a);
    glUniform1f(timeLocation, time);
}
@end
