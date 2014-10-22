//
//  GameplayScene.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/4/13.
//  Copyright 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TileMapLayer.h"
#import "SpriteLayer.h"
#import "UILayer.h"
#import "Simulator.h"
#import "CharacterSelectionListener.h"

@interface GameplayScene : CCScene <CharacterSelectionListener> {
    TileMapLayer *tileMapLayer_;
    SpriteLayer *spriteLayer_;
    UILayer *uiLayer_;
    
    SimulatorStates previousSimulatorState;
    int roundNumber;
    BOOL inTutorial_;
}

@property (nonatomic, retain)TileMapLayer *tileMapLayer;
@property (nonatomic, retain)SpriteLayer *spriteLayer;
@property (nonatomic, retain)UILayer *uiLayer;
@property BOOL inTutorial;

+(CCScene *) scene;
-(void) characterSelected:(CharacterObject *)character;
-(void) characterDeSelected:(CharacterObject *)character;

@end
