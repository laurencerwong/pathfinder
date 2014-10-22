//
//  CharacterStatsPanel.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/18/13.
//  Copyright 2013 Instructor. All rights reserved.
//

#import "CharacterStatsPanel.h"


@implementation CharacterStatsPanel

- (id)init
{
    self = [super initWithFile:@"pressedEndTurnButton.png"];
    if (self) {
        statsAttackLabel = [CCLabelTTF labelWithString:@"Atk: 0" fontName:@"Marker Felt" fontSize:12];
        statsDefenseLabel = [CCLabelTTF labelWithString:@"Def: 0" fontName:@"Marker Felt" fontSize:12];
        
        statsAttackLabel.position = ccp(30, self.contentSize.height/2);
        statsDefenseLabel.position = ccp(80, self.contentSize.height/2);
        statsAttackLabel.visible = YES;
        statsDefenseLabel.visible = YES;
        
        [self addChild:statsAttackLabel];
        [self addChild:statsDefenseLabel];
    }
    return self;
}

-(void) showStatsPanelForCharacter:(CharacterObject *)character
{
    statsAttackLabel.string = [NSString stringWithFormat:@"Atk: %d", character.stats.attack];
    statsDefenseLabel.string = [NSString stringWithFormat:@"Def: %d", character.stats.defense];
    self.visible = YES;
}

-(void) hideStatsPanel
{
    QuietLog(@"Hiding stats panel: vis=no");
    self.visible = NO;
}


@end
