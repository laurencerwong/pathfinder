//
//  Archer.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CharacterObject.h"

@interface Archer : CharacterObject
+(int) ArcherWithStats:(Stats *)s AndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;
+(int) ArcherWithRandStatsAndEquipment1:(Equipment *)equipment1 AndEquipment2:(Equipment *)equipment2 AndPlayerID:(int)playerID AndColor:(ccColor4F)color;
@end
