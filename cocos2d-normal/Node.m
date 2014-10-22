//
//  Node.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Node.h"

@implementation Node

@synthesize position = position_;
@synthesize neighbors = neighbors_;
@synthesize parent = parent_;
@synthesize cost = cost_;
@synthesize heuristic = heuristic_;

float computeHeuristic(CGPoint position, CGPoint target);

- (id)initWithPosition:(CGPoint)position
{
    self = [super init];
    if (self) {
        self.position = position;
        self.cost = 0;
        parent_ = nil;
    }
    return self;
}

- (id)initWithPosition:(CGPoint)position Cost:(int)cost Parent:(Node*)parent
{
    self = [super init];
    if (self) {
        self.position = position;
        self.cost = cost;
        parent_ = parent;
    }
    return self;
}

-(void) addNeighbor:(Node*)node
{
    [neighbors_ addObject:node];
}

-(int) fCost
{
    return cost_ + heuristic_;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Position: (%.2f, %.2f)", position_.x, position_.y];
}


@end
