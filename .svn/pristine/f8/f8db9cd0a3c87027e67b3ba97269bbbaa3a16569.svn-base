//
//  Slash.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Slash.h"
#import "CCAnimation.h"
#import "CCSpriteFrameCache.h"
#import "CCActionInterval.h"
#import "CCActionInstant.h"


@implementation Slash
@synthesize time = time_;
@synthesize killMe = killMe_;


+(id)slashAtPoint:(CGPoint)point
{
    return [[self alloc] initAtPoint:(CGPoint)point];
}

- (id)initAtPoint:(CGPoint)point
{
    self = [super init];
    if (self) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"SlashAnimation.plist"];
        self.position = point;
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
    files = [NSMutableArray arrayWithObjects:@"slash1.png", @"slash2.png", @"slash3.png", @"slash4.png", @"slash5.png", @"slash6.png", nil];
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:6];
    for (NSString *file in files)
    {
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:file];
        [frames addObject:frame];
    }
    // Start new animation
    CCAnimation* anim = [CCAnimation animationWithSpriteFrames:frames delay:0.05f];
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
