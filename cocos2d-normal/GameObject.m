//
//  GameObject.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

@synthesize actionerID = actionerID_;
@synthesize  innerHitCircleRadius = innerHitCircleRadius_;
@synthesize currentActionPoints = currentActionPoints_;

- (id)initWithFile:(NSString *)filename
{
    self = [super initWithFile:filename];
    if (self) {
        self.innerHitCircleRadius = [self contentSize].width/2;
    }
    return self;
}
@end
