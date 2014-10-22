//
//  ProgressTimeWithBackground.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "ProgressTimerWithBackground.h"

@implementation ProgressTimerWithBackground
@synthesize timer = timer_;
@synthesize text = ratioDisplay;
+(id)progressWithSprite:(CCSprite *)sprite AndBackground:(CCSprite *)backgroundSprite
{
    return [[self alloc] initWithSprite:sprite AndBackground:backgroundSprite];
}

- (id)initWithSprite:(CCSprite *)sprite AndBackground:(CCSprite *)backgroundSprite
{
    self = [super init];
    if (self) {
        background = backgroundSprite;
        [self addChild:background z:0];
        background.position = CGPointMake([self contentSize].width/2, [self contentSize].height/2);
        self.timer = [CCProgressTimer progressWithSprite:sprite];
        self.timer.type = kCCProgressTimerTypeBar;
        self.timer.barChangeRate = CGPointMake(1, 0);
        self.timer.midpoint = CGPointMake(-1, 0);
        self.timer.percentage = 100.0;
        [self addChild:self.timer z:1];
        ratioDisplay = [CCLabelTTF labelWithString:@"0/0" fontName:@"Marker Felt" fontSize:10];
        [self addChild:ratioDisplay z:2];
        ratioDisplay.color = ccc3(50, 50, 50);
        self.contentSize = background.contentSize;
    }
    return self;
}

- (void)dealloc
{
    [self.timer dealloc];
    [background dealloc];
    [super dealloc];
}
@end
