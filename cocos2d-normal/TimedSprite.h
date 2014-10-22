//
//  TimedSprite.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/22/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimedSprite <NSObject>

@property BOOL killMe;

-(void)update:(ccTime)delta;
-(CCNode *) getAsNode;

@end
