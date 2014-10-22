//
//  TargetCandidate.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "TargetCandidate.h"

@implementation TargetCandidate
@synthesize character = character_;
@synthesize potentialDamage = potentialDamage_;
@synthesize health = targetHealth_;
@synthesize distanceSq = distanceSq_;

- (id)initForTaget:(CharacterObject*)target FromCharacter:(CharacterObject*)me
{
    self = [super init];
    if (self) {
        character_ = target;
        potentialDamage_ = [me getTotalAttack] - [target getTotalDefense];
        targetHealth_ = target.currentHealth;
        distanceSq_ = ccpDistanceSQ(me.position, target.position);
    }
    return self;
}
@end
