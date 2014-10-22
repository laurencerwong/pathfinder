//
//  LongSword.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/23/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "LongSword.h"

@implementation LongSword
- (id)init
{
    self = [super init];
    if (self) {
        Stats *s = [[Stats alloc] init];
        s.attack = 15;
        s.defense = 5;
        
        self.range = 20;
        
        self.stats = s;
        self.state = EquipmentActivated;
        self.type = SwordType;
        self.name = @"Long Sword";
    }
    return self;
}
@end
