//
//  ColoredSprite.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCSprite.h"

@interface ColoredSprite : CCSprite
{
    int fromColorLocation;
    int toColorLocation;
    int timeLocation;
    float time;
    ccColor4F fromColor_;
    ccColor4F toColor_;
}
@property (nonatomic)ccColor4F color;
+(id)ColoredSpriteWithFile:(NSString *)filename AndColor:(ccColor4F)inColor;
@end
