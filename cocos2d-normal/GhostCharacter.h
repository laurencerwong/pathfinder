//
//  GhostCharacter.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//
#import "CharacterObject.h"

@interface GhostCharacter : CCSprite
{
    
}
-(void)becomeGhostOf:(CharacterObject *)character;
-(void)becomeInvisible;
@end
