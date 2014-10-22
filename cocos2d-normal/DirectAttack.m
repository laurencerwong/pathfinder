//
//  DirectAttack.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "DirectAttack.h"
#import "Simulator.h"
#import "TargetCandidate.h"

@implementation DirectAttack

- (id)initForCharacter:(CharacterObject *)character
{
    self = [super initForCharacter:character];
    if (self) {
        healthGain = 800;
    }
    return self;
}

-(int) computeUtilityAndInitialize
{
    //if(myCharacter.currentTarget == nil) {
    //    myCharacter.currentTarget = [self pickTarget];
    //}
    
    self.potentialTarget = [self pickTarget];   //Always pick a target, since gampley scene determines which behavior (and thus whitch target) to use
    
    CharacterObject *target = self.potentialTarget;
    
    int targetRemainingHealthAfterAttack = (target.currentHealth - ([myCharacter getTotalAttack] - [target getTotalDefense]));
    
    self.destination = target.position;
    self.desiredAction = [Action actionWithType:CombatMoveAction];
    
    int v;
    
    if(target != nil) {
        v = healthGain * abs(targetRemainingHealthAfterAttack);
    } else {
        v = INT_MIN + 1;
    }
    
    QuietLog(@"Utility for Direct Attack: %d  destination=(%.0f, %.0f)", v, self.destination.x, self.destination.y);
    
    return v;
}

-(CharacterObject *) pickTarget
{
    QuietLog(@"Picking New Direct Attack Target");
    
    NSArray *humanUnits = [[Simulator sharedSimulator] getUnitsForPlayer:0]; //Human
    
    NSMutableArray *targetCandidates = [[NSMutableArray alloc] init];
    
    //Pick people in range that aren't immune to my damage
    for(CharacterObject *c in humanUnits) {
        TargetCandidate *tc = [[TargetCandidate alloc] initForTaget:c FromCharacter:myCharacter];
        if([Behavior isCharacter:tc.character InStrikeRangeOfCharacter:myCharacter] && tc.potentialDamage > 0) {
            [targetCandidates addObject:tc];
        }
    }
    
    //pick best candidate by amount of health target will have remaining (try to minimize that value)
    [targetCandidates sortUsingComparator:^NSComparisonResult(id a, id b) {
        
        if([a isKindOfClass:[TargetCandidate class]] && [b isKindOfClass:[TargetCandidate class]]) {
            
            TargetCandidate *first = (TargetCandidate*)a;
            TargetCandidate *second = (TargetCandidate*)b;
            
            //I want to get as close to exactly killing them as possible
            int firstRemainingHealth = abs(first.health - first.potentialDamage);
            int secondRemainingHealth = abs(second.health - second.potentialDamage);
            
            if(firstRemainingHealth < secondRemainingHealth) {
                return NSOrderedAscending;
            } else if(firstRemainingHealth > secondRemainingHealth) {
                return NSOrderedDescending;
            }
        }
        return NSOrderedSame;
    }];
    
    if(targetCandidates == nil || targetCandidates.count == 0) {
        return nil;
    }
    TargetCandidate * candidate = (TargetCandidate*)[targetCandidates objectAtIndex:0];
    if(candidate == nil) {
        return nil;
    }
    CharacterObject *potentialTarget = candidate.character;
    return potentialTarget;
}

-(NSString *)description
{
    return @"DirectAttack";
}

@end



