//
//  Combat.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Combat.h"
#import "CharacterObject.h"
#import "Simulator.h"
#import "WaitingForOrder.h"
#import "BatchBattleSpriteHandler.h"

@implementation Combat

-(void)onEnter:(CharacterObject *)inCharacterObject
{

    myCharacterObject = inCharacterObject;
    characterInCombatWith = [[Simulator sharedSimulator] getNearestCollidingCharacterTo:myCharacterObject];
    
    //do battle calculations
    [myCharacterObject dealDamageToCharacter:characterInCombatWith];
    [myCharacterObject stopActionByTag:1];
    
}

-(void)update:(ccTime)delta
{
    [myCharacterObject setState:[[WaitingForOrder alloc] init]];
}

-(void)onExit
{
    
}


@end
