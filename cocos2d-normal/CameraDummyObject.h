//
//  CameraDummyObject.h
//  cocox2d-box2d
//
//  Created by Student on 10/5/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "cocos2d.h"

@interface CameraDummyObject : CCNode
{
    CGPoint lastDelta;
    CGPoint currentDelta;
    
    float currentPlayerPosition_;
    
    CGPoint desiredPosition_;
    
    //constants
    float pConstant;
    float dConstant;
    
    
}

@property float currentPlayerPosition;
@property CGPoint desiredPosition;

//+(id) nodeWithPosition:(CGPoint)position;

@end
