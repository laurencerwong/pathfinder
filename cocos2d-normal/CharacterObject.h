//
//  CharacterObject.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/4/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "GameObject.h"
#import "cocos2d.h"
#import "Stats.h"
#import "WaitingForOrder.h"
#import "Equipment.h"
#import "Action.h"
#import "SplinePolygon.h"
//#import "Behavior.h"

@class Behavior;

typedef enum CharacterDirection : NSInteger{
    DirectionUp,
    DirectionDown,
    DirectionRight,
    DirectionLeft,
    DirectionUpRight,
    DirectionUpLeft,
    DirectionDownRight,
    DirectionDownLeft
} CharacterDirection;

@interface CharacterObject : GameObject
{
    Equipment *e1, *e2, *currentEquipment_;
    AIState *currentState;
    Stats *stats_;
    Action *action_;
    CCPointArray *touchPath_;
    NSMutableArray *distancesBetweenPoints;
    NSMutableArray *speedArray;
    float distanceFromLastArrow;
    float desiredSpeed;
    int currentHealth_;
    int playerID_;
    BOOL hasFinishedMoving_;
    BOOL isSelected_;
    BOOL isDead_;
    GLchar *fragmentSource;

    CGPoint lastPosition;

    //temp label
    CCLabelTTF *myNumber;
    //end temp
    
    //Pre Simulation Variables
    CGPoint currentPreSimPosition;
    int lastKnownControlPointIndex;
    float lastTime;
    float lastRemainingDistance;
    
    int repeatTag;
    float rangeDirection;
    
    //character direction for animation
    CharacterDirection characterDirection_;
    
    SplinePolygon *mySpline_;
    
    //AI behavior vaiables
    CharacterObject *currentTarget_;
    NSMutableArray *behaviors_;
}


@property (nonatomic,readwrite,retain) CCPointArray *touchPath;
@property (nonatomic, readonly, retain) Equipment *currentEquipment;
@property (nonatomic, retain) Action *action;
@property (nonatomic, retain) Stats *stats;
@property (nonatomic, retain) CCRenderTexture *pathTexture;
@property (nonatomic)BOOL isSelected;
@property (nonatomic)BOOL hasFinishedMoving;
@property int currentHealth;
@property int playerID;
@property BOOL isDead;
@property CharacterDirection characterDirection;
@property CharacterDirection currentDirection;
//temp code begin
@property CGPoint preSimPoint;
//temp code end
@property (nonatomic, retain) SplinePolygon *mySpline;

//AI
@property (nonatomic, retain) CharacterObject* currentTarget;
@property (nonatomic, retain) NSMutableArray *behaviors;

-(BOOL)hasAlreadyMoved;
+(int)characterObjectWithFile:(NSString *)filename AndPlayerID:(int)inPlayerID AndColor:(ccColor4F)inColor;
-(id)initializeWithFile:(NSString *)filename AndPlayerID:(int)inPlayerID AndColor:(ccColor4F)color;
-(BOOL)hasCollisionWith:(CharacterObject *)character;
-(BOOL)hasPreCollisionWith:(CharacterObject *)character;
-(void)generateSpline;
-(void)setPositionToTime:(float)t;
-(void)resetPath;
-(void)startMovement;
-(BOOL) addControlPoint:(CGPoint)controlPoint;
-(void)setState:(AIState *)newState;
-(void)setToBeIdle;
-(BOOL)makeAccuracyCheckWithPlayer:(CharacterObject *)character;
-(int)getTotalAttack;
-(int)getTotalDefense;
//for debug
-(float)getRange;
-(int)maxHealth;
-(int)maxActionPoints;
-(void)takeDamage:(int)damage;
-(void)tellSimulatorFinishedMoving;
-(void)fadeOutSpline;
-(void)setEquipment:(Equipment *)inEquipment1 AndEquipment:(Equipment *)inEquipment2;
-(void)doAttackAnimation;
-(void)dealDamageToCharacter:(CharacterObject *)character;
-(BOOL)hasCollisionWithNode:(CCNode *)node;

-(void) addAIBehavior:(Behavior*)behavior;

@end
