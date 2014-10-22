//
//  Simulator.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCLayer.h"
#import "ccTypes.h"
#import "Battle.h"
#import "CharacterObject.h"

typedef enum SimulatorStates : NSInteger{
    TacticalState,
    PreSimState,
    CombatState
    
} SimulatorStates;

@interface Simulator : NSObject
{
    NSMutableArray *playerUnits;
    NSMutableArray *nonCombatCharacters;
    int nextActionerID;
    int nextPlayerID;
    NSMutableArray *battles;
    Battle *currentlySimulatingBattle;
    CCLayer *currentLayerToAddThingsTo_;
    float maxTimeToSimulate;
    int simulationTimeDivisions;
    int charactersDoneMoving_;
    SimulatorStates simulatorState_;
    float deltaTime;
}

@property (nonatomic,readwrite,retain) CCLayer *currentLayerToAddThingsTo;
@property (atomic)int charactersDoneMoving;
@property SimulatorStates simulatorState;

+(Simulator *)sharedSimulator;
-(CharacterObject *)getCharacterObject:(NSNumber *)inActionerID;
-(int)addCharacterObject:(CharacterObject *)inCharacterObject forPlayer:(int)inPlayerID;
-(void)addBattle:(int)inActionerID1 with:(int)inActionerID2;
-(void)battleDone:(Battle *)battle;
-(CharacterObject *)findCharacterByTouch:(CGPoint)worldSpaceTouch;
-(NSArray *)getUnitsForPlayer:(int)inPlayerID;
-(void)preSimulate;
-(void)moveAllCharacters;
-(void)update:(ccTime)delta;
-(int)initializePlayer;
-(void)characterIsDoneMoving:(CharacterObject *)character;
-(CharacterObject *)getNearestCollidingCharacterTo:(CharacterObject *)character;
-(CharacterObject *)getNearestCollidingCharacterToNode:(CCNode *)node fromCharacter:(CharacterObject *)character;
-(BOOL) cullDeadCharactersInLayerLayer:(CCLayer*)layer;
-(NSArray*) getAllCharacterObjects;
-(int) checkForVictory;
-(void) wipeEverything;

@end
