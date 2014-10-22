//
//  Action.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/13/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Action.h"

@implementation Action
@synthesize type = type_;
- (id)initWithType:(ActionType)type
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}
+(id)actionWithType:(ActionType)type
{
    return [[self alloc] initWithType:type];
}
+(NSString *)enumToString:(ActionType)type
{
    NSString *returnValue = nil;
    switch(type)
    {
        case MoveAction:
            returnValue = @"MoveAction";
            break;
        case UseEquipmentAction:
            returnValue = @"UseEquipmentAction";
            break;
        case ChangeEquipmentAction:
            returnValue = @"ChangeEquipmentAction";
            break;
        case CombatMoveAction:
            returnValue = @"CombatMoveAction";
            break;
        case NoAction:
            returnValue = @"NoAction";
            break;
        default:
            returnValue = @"ERROR: NO STRING FOR ENUM - THIS SHIT SHOULDNT EVER HAPPEN";
            break;
    }
    return returnValue;
}
@end
