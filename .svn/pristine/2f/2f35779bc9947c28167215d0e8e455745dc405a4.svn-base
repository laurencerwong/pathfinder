//
//  Behavior.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
#import "CharacterObject.h"

@interface Behavior : NSObject
{
    CharacterObject *myCharacter;
    CharacterObject *potentialTarget_;
    
    CGPoint destination_;    //To know where to go
    Action *desiredAction_;  //To set combat state
}

@property CGPoint destination;
@property (nonatomic, retain) Action *desiredAction;
@property (nonatomic, retain) CharacterObject *potentialTarget;

-(id) initForCharacter:(CharacterObject*)character;

-(int) computeUtilityAndInitialize;
+(BOOL) isCharacter:(CharacterObject*)enemy InStrikeRangeOfCharacter:(CharacterObject*)me;


@end
