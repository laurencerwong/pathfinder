//
//  ButtonWithText.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/11/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCMenuItem.h"
#import "CCLabelTTF.h"

@interface ButtonWithContent : CCMenuItemImage
{
    CCSprite *content_;
    CGPoint originalPosition_;
}
@property (nonatomic, retain)CCSprite *content;
@property CGPoint originalPosition;

+(id)ButtonWithText:(NSString *)text NormalImage:(NSString *)normalImage SelectedImage:(NSString *)selectedImage Target:(id)target Selector:(SEL)selector;
+(id)ButtonWithIcon:(NSString *)fileName NormalImage:(NSString *)normalImage SelectedImage:(NSString *)selectedImage Target:(id)target Selector:(SEL)selector;
+(id)ButtonWithNoContent:(NSString *)normalImage SelectedImage:(NSString *)selectedImage Target:(id)target Selector:(SEL)selector;
@end
