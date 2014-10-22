//
//  BowAndArrow.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "BowAndArrow.h"

@implementation BowAndArrow
- (id)init
{
    self = [super init];
    if (self) {
        Stats *s = [[Stats alloc] init];
        s.attack = 5;
        s.defense = 5;
        
        self.range = 120;
        
        self.stats = s;
        self.state = EquipmentActivated;
        self.type = BowType;
        self.name = @"Bow and Arrow";
    }
    return self;
}
@end
