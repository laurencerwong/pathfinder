//
//  HelloWorldLayer.h
//  cocos2d-normal
//
//  Created by Instructor on 9/18/13.
//  Copyright Instructor 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CharacterObject.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    int touchesMovedCounter;
    int MaxTouchesMovedCounter; //touchesMovedCounter and MaxTouchesMovedCounter are used for changing frequency of recording points
    CCPointArray *touchPath;
    CCPointArray *splinePath;
    CCSequence *moveAlongSpline;
    int tempSpriteID;
    
    //temp code begin
    
    CGPoint preSimPoint1, preSimPoint2;
    
    //temp code end
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event;
-(BOOL) ccTouchMoved:(UITouch*)touch withEvent:(UIEvent *)event;
-(BOOL) ccTouchEnded:(UITouch*)touch withEvent:(UIEvent *)event;
-(void) createSplineFromPoints:(CCPointArray *)inPoints;

@end
