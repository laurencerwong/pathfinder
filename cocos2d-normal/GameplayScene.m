//
//  GameplayScene.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/4/13.
//  Copyright 2013 Instructor. All rights reserved.
//

//
//  GameplayScene.m
//  cocox2d-box2d
//
//  Created by Keith DeRuiter on 9/22/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "GameplayScene.h"
#import "MainMenuLayer.h"
#import "CharacterObject.h"
#import "BatchBattleSpriteHandler.h"
#import "AStarPathfinding.h"
#import "Node.h"
#import "Warrior.h"
#import "Behavior.h"

@implementation GameplayScene

@synthesize tileMapLayer = tileMapLayer_;
@synthesize spriteLayer = spriteLayer_;
@synthesize uiLayer = uiLayer_;
@synthesize inTutorial = inTutorial_;

- (id)init
{
    self = [super init];
    if (self) {
        inTutorial_ = YES;
        
        [UIApplication sharedApplication].statusBarHidden = YES;
        self.tileMapLayer = [TileMapLayer node];
        self.spriteLayer = [SpriteLayer node];
        self.uiLayer = [UILayer node];
        self.spriteLayer.tileMapLayer = self.tileMapLayer;
        [AStarPathfinding sharedPathfinder].tileMapLayer = self.tileMapLayer;
        [[AStarPathfinding sharedPathfinder] initializeNodes];
        
        [self.spriteLayer initializeTileMap];
        [self.spriteLayer initializeCamera];
        [self.spriteLayer registerCharacterSelectionListener:(id<CharacterSelectionListener>*)self];
        [self.spriteLayer registerCharacterSelectionListener:(id<CharacterSelectionListener>*)self.uiLayer];
        
        [self addChild:self.tileMapLayer];
        [self addChild:self.spriteLayer];
        [self addChild:self.uiLayer z:5];
        
        [self.tileMapLayer runAction:[CCFollow actionWithTarget:self.spriteLayer.camera]];
        [self.spriteLayer runAction:[CCFollow actionWithTarget:self.spriteLayer.camera]];
        
        previousSimulatorState = TacticalState;
        roundNumber = 1;
        [self scheduleUpdate];
    }
    return self;
}

-(void) update:(ccTime)delta
{
    //check for phase change
    [[BatchBattleSpriteHandler sharedBatchBattleSpriteHandler] update:delta withLayer:self.spriteLayer];
    SimulatorStates currentSimulatorState = [Simulator sharedSimulator].simulatorState;
    if(currentSimulatorState != previousSimulatorState) {
        previousSimulatorState = currentSimulatorState;
        [self simulatorPhaseChangedTo:currentSimulatorState];
    }
    //
    
    
    //give the spritelayer the buttons that were pressed
    self.spriteLayer.buttonsPressed = [self.uiLayer getButtonsPressed];
    
    //End the turn
    if(self.spriteLayer.buttonsPressed & EndTurnButton && [Simulator sharedSimulator].simulatorState == TacticalState) {
        [self endTurn];
    }
    
    if(!self.inTutorial) {
        [self.tileMapLayer update:delta];
        [self.spriteLayer update:delta];
        [self.uiLayer update:delta];
    } else {
        [self.tileMapLayer updateTutorial:delta];
        [self.spriteLayer updateTutorial:delta];
        [self.uiLayer updateTutorial:delta];
    }
}

-(void) endTurn
{
    [self.spriteLayer endTurn];
    
    [self runComputerTurn];
    

    
    //Run comp turn in own thread
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,
//                                             (unsigned long)NULL), ^(void) {
//        [self runComputerTurn];
//    });
    
// Hacked into end of run computer method
    if([self.spriteLayer allPlayersFinished])
    {
        [[Simulator sharedSimulator] preSimulate];
        [[Simulator sharedSimulator] moveAllCharacters];
        [self.spriteLayer startNewRound];
    }
}

-(void) runComputerTurn
{
    //Set their paths
    NSArray *units = [[Simulator sharedSimulator] getUnitsForPlayer:self.spriteLayer.currentPlayerID];
    
    NSArray *humanUnits = [[Simulator sharedSimulator] getUnitsForPlayer:0]; //Human
    
    //Decide fate for each of my units
    for(CharacterObject *c in units) {
        
        QuietLog(@"Picking behavior for character: %@", c);
        
        //Pick a bahavior
        int maxUtility = INT_MIN;
        Behavior *bestBehavior = nil;
        
        for(int i = 0; i < c.behaviors.count; i++) {
            Behavior *b = [c.behaviors objectAtIndex:i];
            int utility = [b computeUtilityAndInitialize];
            QuietLog(@"Evaluating Behavior: %@  with utility %d", b, utility);
            if(utility > maxUtility) {
                maxUtility = utility;
                bestBehavior = b;
            }
        }
        
        QuietLog(@"Picked behavior: %@", bestBehavior);
        
        
        //int targetIndex = arc4random()%humanUnits.count;
        //CGPoint targetPoint = ((CharacterObject*)[humanUnits objectAtIndex:targetIndex]).position;
        
        c.currentTarget = bestBehavior.potentialTarget;
        CGPoint targetPoint = bestBehavior.destination;
        NSMutableArray *path = [[AStarPathfinding sharedPathfinder] computePreallocNodePathFrom:c.position To:targetPoint];

        for(int i = 0; i < path.count; i++) {
            CGPoint pt = [(NSValue*)[path objectAtIndex:i] CGPointValue];
            if(![c addControlPoint:[self.tileMapLayer positionForTileCoord:pt]]) {
                break;
            }
        }
        c.action.type = CombatMoveAction;
        [c generateSpline];
    }
    
    spriteLayer_.open = [AStarPathfinding sharedPathfinder].open;
    spriteLayer_.closed = [AStarPathfinding sharedPathfinder].closed;
    spriteLayer_.path = [AStarPathfinding sharedPathfinder].path;
    
    [self.spriteLayer endTurn];
    
    
    //Hack for only 2 players with AI
//    [[Simulator sharedSimulator] preSimulate];
//    [[Simulator sharedSimulator] moveAllCharacters];
//    [self.spriteLayer startNewRound];
    
}

-(void) simulatorPhaseChangedTo:(SimulatorStates)newState
{
    switch (newState) {
        case TacticalState:
            QuietLog(@"New Simulator State: Tactical");
            
            roundNumber++;
            [self.uiLayer setMenuBackgroundColor:[self.spriteLayer currentPlayerColor]];
            if([[Simulator sharedSimulator] checkForVictory] != -1) {
                int winningPlayer = [[Simulator sharedSimulator] checkForVictory];
                if(winningPlayer != -1) {
                    [self endGameWithVictor:winningPlayer];
                    break;
                }
            }
            
            [self.uiLayer showPlayerTurnLabel:self.spriteLayer.currentPlayerID];
            [self.spriteLayer focusOnFirstUnitForCurrentPlayer];
            break;
        case PreSimState:
            QuietLog(@"New Simulator State: PreSim");
            break;
        case CombatState:
            QuietLog(@"New Simulator State: Combat");
            break;
        default:
            QuietLog(@"Unknown New Simulator State!");
            break;
    }
}

-(void) characterSelected:(CharacterObject *)character
{
    if(character) {
        QuietLog(@"CharacterSelected: %d", character.tag);
    }
    [self.uiLayer showStatsPanelForCharacterObject:character];
    CharacterObject *tempPlayer = [[self spriteLayer]currentlySelectedCharacter];
    [self.uiLayer showBarsWithHealth:[tempPlayer currentHealth] MaxHealth:[tempPlayer maxHealth] ActionPoints:[tempPlayer currentActionPoints] MaxActionPoints:[tempPlayer maxActionPoints]];
}

-(void) characterDeSelected:(CharacterObject *)character
{
    if(character) {
        QuietLog(@"CharacterDeSelected: %d", character.tag);
    }
    [self.uiLayer hideStatsPanel];
    [self.uiLayer hideBars];
}

-(void) endGameWithVictor:(int)winner
{
    QuietLog(@"PLAYER %d WON!", winner + 1);
    [self.uiLayer displayVictoryForPlayer:winner];
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:4.0 scene:[MainMenuLayer scene]]];
}

+(CCScene*) scene
{
    return [self node];
}

@end
