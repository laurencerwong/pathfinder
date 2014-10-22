//
//  UILayer.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/8/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "cocos2d.h"
#import "Buttons.h"
#import "ProgressTimerWithBackground.h"
#import "ButtonWithContent.h"
#import "CharacterObject.h"
#import "CharacterStatsPanel.h"
#import "ColoredSprite.h"
#import "CharacterSelectionListener.h"

@interface UILayer : CCLayer <CharacterSelectionListener>
{
    int spaceBetweenMenuItems;
    int menuItemXOffset;
    int buttonsPressed_;
    ButtonWithContent *endTurnButton;
    CCMenu *menu;
    ColoredSprite *menuBackground;
    ProgressTimerWithBackground *healthBar;
    ProgressTimerWithBackground *actionPointBar;
    
    CCLabelTTF *playerTurnLabel;
    CCLabelTTF *victoryLabel;
    
    CharacterStatsPanel *statsPanel;
    CGPoint statsPanelOnscreenLocation;
    CGPoint statsPanelOffscreenLocation;
    
    CharacterObject *currentlySelectedCharacter;
}

-(int) getButtonsPressed;
-(void) hideBars;
-(void) showBarsWithHealth:(int)currentHealth MaxHealth:(int)maxHealth ActionPoints:(int)currentActionPoints MaxActionPoints:(int)maxActionPoints;
-(void) showPlayerTurnLabel:(int)playerNumber;
-(void) hidePlayerTurnLabel;
-(void) showStatsPanelForCharacterObject:(CharacterObject*)character;
-(void) hideStatsPanel;
-(void) setMenuBackgroundColor:(ccColor4F)color;
-(void) updateTutorial:(ccTime)delta;
-(void) displayVictoryForPlayer:(int)playerNumber;

@end
