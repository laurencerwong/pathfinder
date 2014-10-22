//
//  CameraDummyObject.m
//  cocox2d-box2d
//
//  Created by Student on 10/5/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CameraDummyObject.h"
#import "QuietLog.h"

@implementation CameraDummyObject

@synthesize currentPlayerPosition = currentPlayerPosition_;
@synthesize desiredPosition = desiredPosition_;

- (id)init
{
    self = [super init];
    if (self) {
        CGSize s = [[CCDirector sharedDirector]winSize];

        pConstant = 5.2;
        dConstant = 2.2;
        
        self.position = ccp(s.width/2, s.height/2);
    }
    return self;
}

-(void) update:(ccTime)delta
{
    lastDelta = currentDelta;
    currentDelta = ccpSub(self.position, self.desiredPosition);

    CGPoint deltaPosition = ccpMult(currentDelta, pConstant);
    
    deltaPosition = ccpAdd(deltaPosition, ccpMult(ccpSub(lastDelta, currentDelta), dConstant));
    
    self.position = ccpSub(self.position, ccpMult(deltaPosition, delta));
    
    //QuietLog(@"updating camera: at(%f,%f)  desired(%f,%f)", self.position.x, self.position.y, self.desiredPosition.x, self.desiredPosition.y);
}
@end
