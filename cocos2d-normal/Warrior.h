//
//  Warrior.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/23/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CharacterObject.h"

@interface Warrior : CharacterObject

+(int) WarriorWithStats:(Stats *)s AndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;
+(int) WarriorWithRandStatsAndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;

@end
