//
//  TileMapLayer.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/5/13.
//  Copyright 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface TileMapLayer : CCLayer
{
    CCTMXTiledMap *tileMap_;
    CCTMXLayer *background_;
    CCTMXLayer *meta_;
    
    int **traversableGrid;
}

@property (strong) CCTMXTiledMap *tileMap;
@property (strong) CCTMXLayer *background;
@property (strong) CCTMXLayer *meta;

+(CCScene *) scene;
-(CGPoint) tileCoordForPosition:(CGPoint) position;
-(CGPoint) positionForTileCoord:(CGPoint) tileCoord;
-(BOOL) isValidTileCoord:(CGPoint)tileCoord;
-(BOOL) isTileCollidable:(CGPoint)tileCoord;
-(BOOL) isTileCollidableFast:(CGPoint)tileCoord;
-(void) updateTutorial:(ccTime)delta;

@end
