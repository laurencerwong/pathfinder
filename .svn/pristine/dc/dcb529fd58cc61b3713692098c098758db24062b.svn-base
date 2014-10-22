//
//  MagicMissile.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCParticleSystemQuad.h"
#import "TimedSprite.h"
#import "CharacterObject.h"

@interface MagicMissile : CCParticleMeteor <TimedSprite>
{
    BOOL killMe_;
    float time_;
    float velocity;
    CharacterObject *firedFrom;
    int damage;
    CGPoint destination;
    float timeToDestination;
}
@property float time;
+(id)magicMissileFromCharacter:(CharacterObject *)wizard toPoint:(CGPoint)destinationPoint withDamage:(int)inDamage;
@end
