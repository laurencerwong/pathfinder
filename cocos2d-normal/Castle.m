//
//  Castle.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Castle.h"

@implementation Castle

+(int)castleWithPlayerID:(int)playerID AndColor:(ccColor4F)color
{
    Castle *me = [[self alloc] initWithPlayerID:playerID AndColor:color];
    return me.actionerID;
}

- (id)initWithPlayerID:(int)playerID AndColor:(ccColor4F)color
{
    self = [super initializeWithFile:(NSString *)@"Icon.png" AndPlayerID:playerID AndColor:color];
    if (self) {
        Stats *s = [[Stats alloc] init];
        s.attack = 0;
        s.defense = 0;
        s.maxHealth = 1000;
        s.speed = 0;
        s.luck = 0;
        self.stats = s;
    }
    return self;
}

@end
