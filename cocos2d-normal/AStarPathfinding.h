//
//  AStarPathfinding.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TileMapLayer.h"
#import "Node.h"
#import "PriorityQueue.h"

#define INITIAL_NODE_CAPACITY 1000

typedef enum ExploreState_ { Unexplored, Open, Closed } ExploreState;

@interface AStarPathfinding : NSObject
{
    TileMapLayer *tileMapLayer_;
    
    NSMutableArray *sharedNodes;
    int nextFreeSharedNode;
    
    //PriorityQueue *openNodesPQ;
    NSMutableArray *spOpenNodes;
	NSMutableArray *spClosedNodes;
    NSMutableArray *shortestPath;

    Node ** *nodeGrid;  //2-D array of Node*
    
}

@property (nonatomic, retain) TileMapLayer *tileMapLayer;

@property NSArray *open;
@property NSArray *closed;
@property NSArray *path;

+(AStarPathfinding*) sharedPathfinder;
-(NSMutableArray*) getTraverseableNeighborsForTileCoord:(CGPoint)tileCoord;
-(NSMutableArray*) computePathFrom:(CGPoint)origin To:(CGPoint)target;
-(NSMutableArray*) computePreallocNodePathFrom:(CGPoint)origin To:(CGPoint)target;
-(void) initializeNodes;

@end
