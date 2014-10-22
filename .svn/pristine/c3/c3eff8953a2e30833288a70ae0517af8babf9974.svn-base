//
//  SpeechBubble.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/20/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCSprite.h"
#import "CCLabelTTF.h"
#import "TimedSprite.h"
#import "CharacterObject.h"

@interface SpeechBubble : CCNode <TimedSprite>
{
    CCLabelTTF *text_;
    CCSprite *speechBubbleLeftSide, *speechBubbleRightSide, *speechBubbleMiddle, *speechBubbleBottom;
    float sidePadding, topPadding;
    float time_;
    float maxTime_;
    BOOL killMe_;
    BOOL fadingOut;
    NSString *fontName;
    int fontSize;
    CharacterObject *myCharacterObject;
}

+(id) speechBubbleWithText:(NSString *)text fromCharacter:(CharacterObject *)character andTimeout:(float)time;
+(id) speechBubbleWithText:(NSString *)text andPosition:(CGPoint)position andTimeout:(float)time;
+(id) speechBubbleWithText:(NSString *)text andPosition:(CGPoint)position;
-(void)setOpacity:(GLubyte)opacity;
-(CGRect)getBoundingBox;
@end
