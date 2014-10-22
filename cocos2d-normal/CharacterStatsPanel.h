//
//  CharacterStatsPanel.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/18/13.
//  Copyright 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterObject.h"

@interface CharacterStatsPanel : CCSprite {
    CCLabelTTF *statsAttackLabel;
    CCLabelTTF *statsDefenseLabel;
}

-(void) showStatsPanelForCharacter:(CharacterObject*)character;
-(void) hideStatsPanel;

@end
