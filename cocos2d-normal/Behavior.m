//
//  Behavior.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "Behavior.h"
#import "CGPointExtension.h"

@implementation Behavior

@synthesize destination = destination_;
@synthesize desiredAction = desiredAction_;
@synthesize potentialTarget = potentialTarget_;

- (id)initForCharacter:(CharacterObject*)character
{
    self = [super init];
    if (self) {
        myCharacter = character;
        
        desiredAction_ = [Action actionWithType:NoAction];
        destination_ = ccp(0, 0);
    }
    return self;
}

-(int) computeUtilityAndInitialize
{
    QuietLog(@"DEFAULT BEHAVIOR UTILITY");
    return 0;
}

+(BOOL) isCharacter:(CharacterObject*)enemy InStrikeRangeOfCharacter:(CharacterObject*)me
{
    float distSq = ccpDistanceSQ(me.position, enemy.position);
    float myRangeSq = pow(me.currentEquipment.range + me.currentActionPoints, 2);
    
    if(distSq <= myRangeSq) {
        return YES;
    }
    return NO;
}

@end
