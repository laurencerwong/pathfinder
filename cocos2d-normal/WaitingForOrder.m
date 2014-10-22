//
//  WaitingForOrder.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "WaitingForOrder.h"
#import "Selected.h"
#import "CharacterObject.h"
#import "Moving.h"
#import "UseEquipment.h"
#import "Simulator.h"
#import "Action.h"
#import "QuietLog.h"


@implementation WaitingForOrder

-(void)onEnter:(CharacterObject *)inCharacterObject
{
    myCharacterObject = inCharacterObject;
    characterIsDoneWithActions = NO;
    if([[Simulator sharedSimulator] simulatorState] == CombatState) //you would only enter WaitingForOrder during Simulator CombatState if the character came from another state
    {
        characterIsDoneWithActions = YES;
        
    }
    QuietLog(@"Character %d entered waitingForOrder", [myCharacterObject actionerID]);
    
}

-(void)update:(ccTime)delta
{
    if([[Simulator sharedSimulator] simulatorState] == CombatState && !characterIsDoneWithActions)
    {
        
        switch([[myCharacterObject action] type])
        {
            case ChangeEquipmentAction:
            case CombatMoveAction:
            case MoveAction:
                [myCharacterObject setState:[[Moving alloc] init]];
                break;
            case UseEquipmentAction:
                if([[myCharacterObject currentEquipment] state] == EquipmentActivated)
                {
                    [myCharacterObject setState:[[UseEquipment alloc] init]];
                }
                else if([[myCharacterObject currentEquipment] state] == EquipmentNotActivated)
                {
                    [myCharacterObject setState:[[Moving alloc] init]];
                }
                break;
            default:
                //QuietLog(@"No action is on character %d", [myCharacterObject actionerID]);
                break;
        }
    }
    else if([myCharacterObject isSelected])
    {
        [myCharacterObject setState:[[Selected alloc] init]];
    }
}

-(void)onExit
{
    
}

@end
