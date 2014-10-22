//
//  Equipment.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/13/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Equipment.h"

@implementation Equipment
@synthesize stats = stats_;
@synthesize state = state_;
@synthesize type = type_;
@synthesize range = range_;
@synthesize name = name_;

- (id)initWithStats:(Stats *)stats AndType:(EquipmentType)type
{
    self = [super init];
    if (self) {
        self.stats = stats;
        self.state = EquipmentActivated;
        self.type = type;
    }
    return self;
}
+ (id)equipmentWithStats:(Stats *)stats AndType:(EquipmentType)type;
{
    return [[self alloc] initWithStats:stats AndType:type];
}
-(void)use
{
    
}
@end
