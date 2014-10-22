//
//  BattleObject.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Battle.h"
#import "CGPointExtension.h"
#import "Simulator.h"
#import "SpriteLayer.h"


@implementation Battle
@synthesize combatants = combatants_;
@synthesize isFinished = isFinished_;
@synthesize battleLocation = battleLocation_;
@synthesize numFinishedCombatants = numFinishedCombatants_;

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(id)initWithCombatant:(int)inCombatant1
{
    self = [super init];
    if (self) {
        self.combatants = [[NSMutableArray alloc] init];
        [self.combatants addObject:[NSNumber numberWithInt:inCombatant1]];
        CharacterObject *combatantObject1 = [[Simulator sharedSimulator] getCharacterObject:[NSNumber numberWithInt:inCombatant1]];
        battleLocation_ = [combatantObject1 position];
        self.isFinished = NO;
        
    }
    return self;
}


-(id)initWithCombatants:(int)inCombatant1 and:(int)inCombatant2
{
    self = [super init];
    if (self) {
        self.combatants = [[NSMutableArray alloc] init];
        [self.combatants addObject:[NSNumber numberWithInt:inCombatant1]];
        [self.combatants addObject:[NSNumber numberWithInt:inCombatant2]];
        CharacterObject *combatantObject1 = [[Simulator sharedSimulator] getCharacterObject:[NSNumber numberWithInt:inCombatant1]];
        CharacterObject *combatantObject2 = [[Simulator sharedSimulator] getCharacterObject:[NSNumber numberWithInt:inCombatant2]];
        battleLocation_ = ccpMidpoint([combatantObject1 position], [combatantObject2 position]);
        self.isFinished = NO;

    }
    return self;
}

-(void)addCombatant:(int)inCombatant
{
    if(![self containsCombatant:inCombatant])
    {
        NSNumber *newCombatant = [NSNumber numberWithInt:inCombatant];
        [self.combatants addObject:newCombatant];
        GameObject *combatantObject = [[Simulator sharedSimulator] getCharacterObject:newCombatant];
        if(!combatantObject)
        {
            assert(false && @"Combatant does not exist");
        }
        battleLocation_ = ccpLerp(battleLocation_, [combatantObject position], 1.0/([self.combatants count] + 1));
    }
}

-(void)startRunningBattle
{
    SpriteLayer *spriteLayer = (SpriteLayer *)[[Simulator sharedSimulator] currentLayerToAddThingsTo];
    [spriteLayer setCameraPositionTo:battleLocation_];
    for(NSNumber *n in self.combatants)
    {
        CharacterObject *tempCharacter = [[Simulator sharedSimulator] getCharacterObject:n];
        [tempCharacter startMovement];
    }
}

-(void)update:(ccTime)delta
{
    if(!self.isFinished)
    {
        for(NSNumber *n in self.combatants)
        {
            [[[Simulator sharedSimulator] getCharacterObject:n] update:delta];
        }
        if(self.numFinishedCombatants == [self.combatants count])
        {
            QuietLog(@"Battle finished");
            self.isFinished = YES;
            [[Simulator sharedSimulator] battleDone:self];
        }
    }
}

-(BOOL)containsCombatant:(int)inCombatant
{
    if([self.combatants count])
    {
        for(NSNumber *n in self.combatants)
        {
            if(n.intValue == inCombatant)
            {
                return YES;
            }
        }
        return NO;
    }
    else
    {
        return NO;
    }
}
@end
