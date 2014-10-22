//
//  GhostCharacter.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "GhostCharacter.h"
#import "CCActionInterval.h"

@implementation GhostCharacter

-(void)becomeGhostOf:(CharacterObject *)character
{
    self.visible = YES;
    [self runAction:[CCFadeIn actionWithDuration:0.2]];
    self.texture = character.texture;
    self.textureAtlas = character.textureAtlas;
    self.textureRect = character.textureRect;
    self.position = character.position;
}
-(void)becomeInvisible
{
    if(self.opacity > 0)
    {
        [self runAction:[CCFadeOut actionWithDuration:0.2]];
    }
}
@end
