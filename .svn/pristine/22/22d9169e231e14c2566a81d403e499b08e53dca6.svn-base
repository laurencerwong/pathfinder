//
//  MagicMissile.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "MagicMissile.h"
#import "BatchBattleSpriteHandler.h"
#import "Simulator.h"

@implementation MagicMissile
@synthesize time = time_;
@synthesize killMe = killMe_;

+(id)magicMissileFromCharacter:(CharacterObject *)wizard toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage
{
    return [[self alloc] initFromCharacter:wizard toPoint:destinationPoint withDamage:inDamage];
}

- (id)initFromCharacter:(CharacterObject *)wizard toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage
{
    self = [super init];
    if (self) {
        self.position = wizard.position;
        destination = destinationPoint;
        
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:@"BloodTexture.png"]];
        [self setLife:2.0];
        [self setLifeVar:0.5];
        [self setSpeed:0];
        [self setSpeedVar:0];
        [self setGravity:ccpMult(ccpNormalize(ccpSub(destinationPoint, wizard.position)), -10)];
        [self setStartSize:35];
        [self setEndSize:0];
        [self setStartColor:ccc4f(1.0, 1.0, 1.0, 1.0)];
        [self setStartColorVar:ccc4f(0.2, 0.0, 0.0, 1.0)];
        [self setEndColor:ccc4f(0.0f, 0.0f, 0.0f, 1.0f)];
        [self setEndColorVar:ccc4f(0.0f, 0.0f, 0.0f, 1.0f)];
        //[self setAngleVar:180];
        [self setPosVar:ccp(5, 5)];
        [self setSpeedVar:0];
        [self setPositionType: kCCPositionTypeRelative];

        CGPoint lastInterpolatedPointVector = ccpSub(destinationPoint, wizard.position);
        velocity = 100;
        timeToDestination = ccpLength(lastInterpolatedPointVector) / velocity;
        [self setDuration:-1];
        [self runAction: [CCSequence actions:
                          [CCMoveTo actionWithDuration:timeToDestination position:destination],
                          [CCCallBlock actionWithBlock:^(void)
                           {
                               self.killMe = YES;
                           }],
         nil
         ]];
        timeToDestination*=2;

        
        firedFrom = wizard;
        damage = inDamage;
    }
    return self;
}

-(void)update:(ccTime)delta
{
    [super update:delta];
    self.time += delta;
    
    if(self.time > timeToDestination)
    {
        [self stopSystem ];
    }
    if([self particleCount] == 0)
    {
        QuietLog(@"Killing particle system");
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
            [[BatchBattleSpriteHandler sharedBatchBattleSpriteHandler] displayMagicExplosionAtPosition:collidingCharacter.position];
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
