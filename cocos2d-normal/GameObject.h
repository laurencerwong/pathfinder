//
//  GameObject.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCSprite.h"

@interface GameObject : CCSprite
{
    float innerHitCircleRadius_;
    int actionerID_;
    int currentActionPoints_;
}

@property float innerHitCircleRadius;
@property int actionerID;
@property int currentActionPoints;

@end
