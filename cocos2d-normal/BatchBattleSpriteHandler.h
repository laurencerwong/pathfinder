//
//  BatchDamageSpriteHandler.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCNode.h"
#import "DamageSprite.h"
#import "CCLayer.h"
#import "CharacterObject.h"
#import "SpeechBubble.h"

@interface BatchBattleSpriteHandler : CCNode
{
    NSMutableArray *spritesToDisplayNextUpdate;
    NSMutableArray *batchBattleSprites;
    NSMutableArray *objectsToDelete;
    NSMutableArray *persistentMessagesToDisplay;
    SpeechBubble *currentPersistentBubble;
    CCTexture2D *bloodTexture;
    CCLayer *layer_;
    int numProjectiles_;
    int numFinishedProjectiles_;
    BOOL isInUpdate;
}

+(id)sharedBatchBattleSpriteHandler;
-(void)setLayer:(CCLayer *)layer;
-(void)displayDamage:(int)damage AtPosition:(CGPoint)position;
-(void)displayTimedMessage:(NSString *)message originatingFrom:(CGPoint)position withTimeout:(float)time;
-(void)displayPersistentMessage:(NSString *)message originatingFrom:(CGPoint)position;
-(void)displayTimedMessage:(NSString *)message fromCharacter:(CharacterObject *)character withTimeout:(float)time;
-(void)displaySlashAtPosition:(CGPoint)position;
-(BOOL)displayNextPersistentMessage;
-(void)displayBloodExplosionAtPosition:(CGPoint)position;
-(void)displayArrowEffectAtPosition:(CGPoint)position;
-(void)displayArrowEffectAtPosition:(CGPoint)position fromPosition:(CGPoint)origin;
-(BOOL)touchedPersistentMessage:(CGPoint)worldTouchLocation;
-(void)shootArrowFromCharacter:(CharacterObject *)character toPoint:(CGPoint)destination withDamage:(int)damage;
-(void)shootMagicFromCharacter:(CharacterObject *)character toPoint:(CGPoint)destination withDamage:(int)damage;
-(void)displayMagicExplosionAtPosition:(CGPoint)position;
//-(void)displaySpeech:(NSString *)text AtPosition:(CGPoint position);
-(void)update:(ccTime)delta withLayer:(CCLayer *)layer;
-(void)incrementNumFinishedProjectiles;
-(BOOL) projectilesFinished;
@end
