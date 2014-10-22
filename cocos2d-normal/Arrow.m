//
//  Arrow.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Arrow.h"
#import "Simulator.h"
#import "BatchBattleSpriteHandler.h"

@implementation Arrow
@synthesize time = time_;
@synthesize killMe = killMe_;


+(id)arrowFromCharacter:(CharacterObject *)archer toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage
{
    return [[self alloc] initFromCharacter:archer toPoint:destinationPoint withDamage:inDamage];
}

- (id)initFromCharacter:(CharacterObject *)archer toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage
{
    self = [super initWithFile:@"Arrow.png"];
    if (self) {
        self.position = archer.position;
        destination = destinationPoint;
        
        CGPoint lastInterpolatedPointVector = ccpSub(destinationPoint, archer.position);
        CGPoint normalizedLastInterpolatedPointVector = ccpNormalize(lastInterpolatedPointVector);
        float rotationAmount = CC_RADIANS_TO_DEGREES(
                                                     acosf(
                                                           ccpDot(normalizedLastInterpolatedPointVector, ccp(1, 0))
                                                           )
                                                     );
        if(ccpCross(ccp(1, 0), normalizedLastInterpolatedPointVector) > 0)
        {
            rotationAmount = -1 * rotationAmount;
        }
        self.rotation = rotationAmount;
        
        velocity = 1000;
        float timeToDestination = ccpLength(lastInterpolatedPointVector) / velocity;
        [self runAction: [CCMoveTo actionWithDuration:timeToDestination position:destination]];
        firedFrom = archer;
        damage = inDamage;
    }
    return self;
}

-(void)update:(ccTime)delta
{
    self.time += delta;
    if(self.time > 5.0)
    {
        self.killMe = YES; //probably missed since an arrow shouldn't be flying around for 5.0s
        [[BatchBattleSpriteHandler sharedBatchBattleSpriteHandler] incrementNumFinishedProjectiles];
        return;
    }
    CharacterObject *collidingCharacter = [[Simulator sharedSimulator] getNearestCollidingCharacterToNode:self fromCharacter:firedFrom];
    if(collidingCharacter)
    {
        if([collidingCharacter hasCollisionWithNode:self])
        {
            [collidingCharacter takeDamage:damage];
            [[BatchBattleSpriteHandler sharedBatchBattleSpriteHandler] displayArrowEffectAtPosition:collidingCharacter.position fromPosition:firedFrom.position];
            [[BatchBattleSpriteHandler sharedBatchBattleSpriteHandler] incrementNumFinishedProjectiles];
            self.killMe = YES;
        }
    }
}

-(void)setKillMe:(BOOL)killMe
{
    killMe_ = killMe;
}

-(CCNode *)getAsNode
{
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
@end
