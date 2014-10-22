//
//  Selected.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/9/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Selected.h"
#import "WaitingForOrder.h"
#import "CharacterObject.h"
#import "QuietLog.h"

@implementation Selected

-(void)onEnter:(CharacterObject *)inCharacterObject
{
    QuietLog(@"Character %d entered selected", [myCharacterObject actionerID]);
    myCharacterObject = inCharacterObject;

}

-(void)update:(ccTime)delta
{
    if(![myCharacterObject isSelected])
    {
        [myCharacterObject setState:[[WaitingForOrder alloc] init] ];
    }
}

-(void)onExit
{
    
}


@end
