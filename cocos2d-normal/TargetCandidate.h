//
//  TargetCandidate.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 12/3/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterObject.h"

//Storage class for candidates
@interface TargetCandidate : NSObject
{
    CharacterObject *character_;
    int potentialDamage_;
    int targetHealth_;
    float distanceSq_;
}
@property (nonatomic, readonly) CharacterObject *character;
@property (readonly) int potentialDamage;
@property (readonly) int health;
@property (readonly) float distanceSq;
-(id)initForTaget:(CharacterObject*)target FromCharacter:(CharacterObject*)me;
@end
