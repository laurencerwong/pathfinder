//
//  Action.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/13/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ActionType : NSInteger{
    MoveAction,
    UseEquipmentAction,
    ChangeEquipmentAction,
    CombatMoveAction,
    NoAction //error case
    
} ActionType;

@interface Action : NSObject
{
    ActionType type_;
}

@property ActionType type;

+(id)actionWithType:(ActionType)type;
+(NSString *)enumToString:(ActionType)type;

@end
