//
//  Stats.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/8/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stats : NSObject
{
    int attack_;
    int defense_;
    int speed_;
    int luck_;
    int maxHealth_;
}
@property int attack;
@property int defense;
@property int speed;
@property int luck;
@property int maxHealth;

@end
