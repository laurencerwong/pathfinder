//
//  Arrow.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCSprite.h"
#import "TimedSprite.h"
#import "CharacterObject.h"

@interface Arrow : CCSprite <TimedSprite>
{
    BOOL killMe_;
    float time_;
    float velocity;
    CharacterObject *firedFrom;
    int damage;
    CGPoint destination;
}
@property float time;
+(id)arrowFromCharacter:(CharacterObject *)archer toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage;
@end
