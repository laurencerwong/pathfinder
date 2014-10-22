//
//  MagicMissileExplosion.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCParticleExamples.h"
#import "TimedSprite.h"

@interface MagicMissileExplosion : CCParticleExplosion <TimedSprite>
{
    BOOL killMe_;
}
@property float time;

+(id)magicMissileExplosionAtPoint:(CGPoint)point;
@end
