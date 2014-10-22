//
//  Player.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/11/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum CharacterType {
    WarriorType,
    ArcherType,
    LancerType,
    SwordsmanType,
    WizardType
    };

@interface Player : NSObject
{
    int playerID_;
    BOOL hasFinishedTurn_;
    NSMutableArray *controllableCharacters_;
    int currentRow;
    int currentColumn;
    ccColor4F myColor_;
    //temp code begin
    //temp code end
}
@property int playerID;
@property BOOL hasFinishedTurn;
@property (nonatomic)ccColor4F myColor;
@property (nonatomic, retain) NSMutableArray *controllableCharacters;

-(id)initWithColor:(ccColor4F)inColor;
-(void)initializeDefaultCharactersWithPosition:(CGPoint)offset;
@end
