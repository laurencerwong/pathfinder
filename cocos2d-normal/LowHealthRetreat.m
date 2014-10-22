//
//  LowHealthRetreat.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "LowHealthRetreat.h"
#import "Simulator.h"
#import "TargetCandidate.h"

@implementation LowHealthRetreat

-(id) initForCharacter:(CharacterObject *)character
{
    self = [super init];
    if (self) {
        healthGain = 800;
    }
    return self;
}

-(int) computeUtilityAndInitialize
{
    int damage = myCharacter.maxHealth - myCharacter.currentHealth;
    int v = [self getUtilityForDamage:damage];
    
    CGPoint normalizedVectorToTarget = ccpNormalize(ccpSub(potentialTarget_.position, myCharacter.position));
    
    self.desiredAction = [Action actionWithType:MoveAction];
    self.destination = ccpAdd(myCharacter.position, ccpMult(ccpNeg(normalizedVectorToTarget), 20));     //Go 20 units in the direction away from my target
    
    QuietLog(@"Utility for Low Health: %d  destination=(%.0f, %.0f)", v, self.destination.x, self.destination.y);
    
    return v;
}

-(int) getUtilityForDamage:(int)damage
{
    return healthGain * pow(damage, 2);
}

-(CharacterObject *) pickTarget
{
    QuietLog(@"Picking New Retreat Target");
    
    NSArray *humanUnits = [[Simulator sharedSimulator] getUnitsForPlayer:0]; //Human
    
    NSMutableArray *targetCandidates = [[NSMutableArray alloc] init];
    
    //Pick people in range that aren't immune to my damage
    for(CharacterObject *c in humanUnits) {
        TargetCandidate *tc = [[TargetCandidate alloc] initForTaget:c FromCharacter:myCharacter];
        [targetCandidates addObject:tc];
    }
    
    //pick best candidate by amount of health target will have remaining (try to minimize that value)
    [targetCandidates sortUsingComparator:^NSComparisonResult(id a, id b) {
        
        if([a isKindOfClass:[TargetCandidate class]] && [b isKindOfClass:[TargetCandidate class]]) {
            
            TargetCandidate *first = (TargetCandidate*)a;
            TargetCandidate *second = (TargetCandidate*)b;
            
            //I want to get as close to exactly killing them as possible
            int firstDist = first.distanceSq;
            int secondDist = second.distanceSq;
            
            if(firstDist < secondDist) {
                return NSOrderedAscending;
            } else if(firstDist > secondDist) {
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
    return @"LowHealthRetreat";
}

@end
