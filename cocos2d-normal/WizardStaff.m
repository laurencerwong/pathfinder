//
//  WizardStaff.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "WizardStaff.h"

@implementation WizardStaff
- (id)init
{
    self = [super init];
    if (self) {
        Stats *s = [[Stats alloc] init];
        s.attack = 15;
        s.defense = 5;
        
        self.range = 100;
        
        self.stats = s;
        self.state = EquipmentActivated;
        self.type = WizardStaffType;
        self.name = @"Wizard Staff";
    }
    return self;
}
@end
