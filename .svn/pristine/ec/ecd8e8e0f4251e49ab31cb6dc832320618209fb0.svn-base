//
//  ChangeEquipment.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "ChangeEquipment.h"
#import "CharacterObject.h"
#import "OnGuard.h"

@implementation ChangeEquipment

-(void)onEnter:(CharacterObject *)inCharacterObject
{

    myCharacterObject = inCharacterObject;
    QuietLog(@"Character %d entered changeEquipment", [myCharacterObject actionerID]);

}

-(void)update:(ccTime)delta
{
    [myCharacterObject setState: [[OnGuard alloc] init]];
}

-(void)onExit
{
    
}


@end
