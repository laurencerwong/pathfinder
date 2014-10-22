//
//  Swordsman.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/2/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CharacterObject.h"

@interface Swordsman : CharacterObject

+(int) SwordsmanWithStats:(Stats *)s AndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;
+(int) SwordsmanWithRandStatsAndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;

@end
