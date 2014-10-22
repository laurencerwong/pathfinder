//
//  BattleObject.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ccTypes.h"
#import "CameraDummyObject.h"


@interface Battle : NSObject
{
    NSMutableArray *combatants_;
    int numFinishedCombatants_;
    CGPoint battleLocation_;
    BOOL isFinished_;
}

@property (nonatomic, retain)NSMutableArray *combatants;
@property BOOL isFinished;
@property CGPoint battleLocation;
@property int numFinishedCombatants;
-(BOOL)containsCombatant:(int)inCombatant;
-(void)addCombatant:(int)inCombatant;
-(id)initWithCombatants:(int)inCombatant1 and:(int)inCombatant2;
-(id)initWithCombatant:(int)inCombatant1;
-(void)update:(ccTime)delta;
-(void)startRunningBattle;
@end
