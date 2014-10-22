//
//  Wizard.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Wizard.h"
#import "LowHealthRetreat.h"
#import "DirectAttack.h"
#import "Intercept.h"

@implementation Wizard

+(int)WizardWithStats:(Stats *)s AndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color
{
    Wizard *me = [[self alloc] initWithStats:s AndEquipment1:equipment1 AndEquipment2:equipment2 AndPlayerID:playerID AndColor:color];
    return me.actionerID;
}

+(int)WizardWithRandStatsAndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color
{
    Stats *s = [[Stats alloc] init];
    s.attack = 20 + arc4random() % 5;
    s.defense = 10 + arc4random() % 3;
    s.maxHealth = 75 + arc4random() %  50;
    s.speed = 12 + arc4random() %  3;
    s.luck = 75 + arc4random() %  30;
    Wizard *me = [[self alloc] initWithStats:s AndEquipment1:equipment1 AndEquipment2:equipment2 AndPlayerID:playerID AndColor: color];
    return me.actionerID;
    
}

- (id)initWithStats:(Stats *)s AndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color
{
    self = [super initializeWithFile:(NSString *)@"Icon.png" AndPlayerID:playerID AndColor:(ccColor4F)color];
    if (self) {
        self.stats = s;
        [self setEquipment:equipment1 AndEquipment:equipment2];
        [self addAIBehavior:[[LowHealthRetreat alloc] initForCharacter:self]];
        [self addAIBehavior:[[DirectAttack alloc] initForCharacter:self]];
        [self addAIBehavior:[[Intercept alloc] initForCharacter:self]];
    }
    return self;
}

@end
