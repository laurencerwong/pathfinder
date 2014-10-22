//
//  Lance.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Lance.h"

@implementation Lance
- (id)init
{
    self = [super init];
    if (self) {
        Stats *s = [[Stats alloc] init];
        s.attack = 12;
        s.defense = 5;
        
        self.range = 40;
        
        self.stats = s;
        self.state = EquipmentActivated;
        self.type = LanceType;
        self.name = @"Lance";
    }
    return self;
}
@end
