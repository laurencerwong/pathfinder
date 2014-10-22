//
//  Moving.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Moving.h"
#import "CharacterObject.h"
#import "Simulator.h"
#import "Combat.h"
#import "ChangeEquipment.h"
#import "OnGuard.h"
#import "UseEquipment.h"

@implementation Moving

-(void)onEnter:(CharacterObject *)inCharacterObject
{

    myCharacterObject = inCharacterObject;
    QuietLog(@"Character %d entered moving", [myCharacterObject actionerID]);

}

-(void)update:(ccTime)delta
{
    CharacterObject *collidingCharacter = [[Simulator sharedSimulator] getNearestCollidingCharacterTo:myCharacterObject];
    if(collidingCharacter && [[myCharacterObject action] type] == CombatMoveAction)
    {
        [myCharacterObject tellSimulatorFinishedMoving];
        [myCharacterObject setState:[[Combat alloc] init]];
    }
    else if([myCharacterObject hasFinishedMoving] && [[myCharacterObject  action] type] == ChangeEquipmentAction)
    {
        [myCharacterObject setState:[[ChangeEquipment alloc] init]];
    }
    else if([myCharacterObject hasFinishedMoving] && [[myCharacterObject action] type] == MoveAction)
    {
        [myCharacterObject setState:[[OnGuard alloc] init]];
    }
    else if([myCharacterObject hasFinishedMoving] && [[myCharacterObject action] type] == UseEquipmentAction)
    {
        [myCharacterObject setState:[[UseEquipment alloc] init]];
    }
}

-(void)onExit
{
    
}


@end
