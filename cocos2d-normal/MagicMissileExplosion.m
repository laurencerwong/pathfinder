//
//  MagicMissileExplosion.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "MagicMissileExplosion.h"
#import "CCAnimation.h"
#import "CCSpriteFrameCache.h"
#import "CGPointExtension.h"
#import "CCActionInterval.h"
#import "CCActionInstant.h"
#import "CCTextureCache.h"

@implementation MagicMissileExplosion
@synthesize time = time_;
@synthesize killMe = killMe_;


+(id)magicMissileExplosionAtPoint:(CGPoint)point
{
    return [[self alloc] initAtPoint:(CGPoint)point];
}

- (id)initAtPoint:(CGPoint)point
{
    self = [super init];
    if (self) {
        self.position = point;
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:@"Smoke.png"]];
        [self setDuration:-1];
        [self setLife:5.0];
        [self setLifeVar:0.5];
        [self setTotalParticles:25];
        [self setSpeed:50];
        [self setStartSize:20];
        [self setEndSize:0];
        [self setStartColor:ccc4f(1.0, 1.0, 1.0, 0.5)];
        [self setStartColorVar:ccc4f(0.1, 0.0, 0.0, 0.0)];
        [self setEndColor:ccc4f(0.7f, 0.7f, 0.7f, 0.0f)];
        [self setEndColorVar:ccc4f(0.0f, 0.0f, 0.0f, 0.0f)];
        [self setSpeedVar:50];
        [self setPositionType: kCCPositionTypeRelative];
    }
    return self;
}

-(void)update:(ccTime)delta
{
    [super update:delta];
    self.time += delta;
    if(self.time >= 3.0)
    {
        [self stopSystem];
    }
    if([self particleCount] == 0)
    {
        self.killMe = YES;
    }
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
