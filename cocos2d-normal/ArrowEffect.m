//
//  ArrowEffect.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "ArrowEffect.h"
#import "CCAnimation.h"
#import "CCSpriteFrameCache.h"
#import "CGPointExtension.h"
#import "CCActionInterval.h"
#import "CCActionInstant.h"

@implementation ArrowEffect
@synthesize time = time_;
@synthesize killMe = killMe_;


+(id)arrowEffectAtPoint:(CGPoint)point fromPoint:(CGPoint)origin
{
    CGPoint lastInterpolatedPointVector = ccpSub(point, origin);
    CGPoint normalizedLastInterpolatedPointVector = ccpNormalize(lastInterpolatedPointVector);
    float rotationAmount = CC_RADIANS_TO_DEGREES(
                                                 acosf(
                                                       ccpDot(normalizedLastInterpolatedPointVector, ccp(0.7071, 0.7071)) //1/sqrt(2)
                                                       )
                                                 );
    if(ccpCross(ccp(0.7071, 0.7071), normalizedLastInterpolatedPointVector) > 0)
    {
        rotationAmount = rotationAmount + 180;
    }
    float rotation = rotationAmount;
    return [[self alloc] initAtPoint:point withRotation:rotation];
}

+(id)arrowEffectAtPoint:(CGPoint)point
{
    return [[self alloc] initAtPoint:(CGPoint)point withRotation:0];
}

- (id)initAtPoint:(CGPoint)point withRotation:(float)rotation
{
    self = [super init];
    if (self) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Arrowed.plist"];
        self.position = point;
        self.rotation = rotation;
        [self setupAnim];
    }
    return self;
}

-(void)update:(ccTime)delta
{
    
}

- (void) setupAnim
{
    NSMutableArray* files;
    files = [NSMutableArray arrayWithObjects:@"arrowed1.png", @"arrowed2.png", @"arrowed3.png", @"arrowed4.png", @"arrowed5.png", nil];
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:6];
    for (NSString *file in files)
    {
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:file];
        [frames addObject:frame];
    }
    // Start new animation
    CCAnimation* anim = [CCAnimation animationWithSpriteFrames:frames delay:0.1f];
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    CCSequence *animateAndThenDie = [CCSequence actions:animate,
                                     [CCCallBlock actionWithBlock:^()
                                      {
                                          self.killMe = YES;
                                      }], nil];
    [self runAction:animateAndThenDie];
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
