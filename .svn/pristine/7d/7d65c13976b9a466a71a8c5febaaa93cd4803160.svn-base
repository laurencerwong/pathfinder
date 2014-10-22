//
//  AStarPathfinding.m
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "AStarPathfinding.h"
#import "QuietLog.h"
#import "PriorityQueue.h"

@implementation AStarPathfinding

static AStarPathfinding *sharedPathfinder = nil;

@synthesize tileMapLayer = tileMapLayer_;

@synthesize open = spOpenNodes;
@synthesize closed = spClosedNodes;
@synthesize path = shortestPath;

- (id)init
{
    self = [super init];
    if (self) {        
//        sharedNodes = [[NSMutableArray arrayWithCapacity:INITIAL_NODE_CAPACITY] retain];
//        for(int i = 0; i < INITIAL_NODE_CAPACITY; i++) {
//            [sharedNodes addObject:[[Node alloc] init]];
//        }
//        nextFreeSharedNode = 0;
    }
    return self;
}

+(AStarPathfinding*) sharedPathfinder {
    @synchronized(self) {
        if (sharedPathfinder == nil)
            sharedPathfinder = [[self alloc] init];
    }
    return sharedPathfinder;
}

//////////////////////

-(void) initializeNodes
{
    if(self.tileMapLayer == nil) {
        QuietLog(@"TileMapLayer is nil, cannot initialize grid");
        return;
    }
    
    int mapWidth = self.tileMapLayer.tileMap.mapSize.width;
    int mapHeight = self.tileMapLayer.tileMap.mapSize.height;
    
    //Set up grid
    nodeGrid = malloc(mapWidth * sizeof(Node**));
    for(int i = 0; i < mapWidth; i++) {
        nodeGrid[i] = malloc(mapHeight * sizeof(Node*));
    }
    
    for(int i = 0; i < mapWidth; i++) {
        for(int j = 0; j < mapHeight; j++) {
            nodeGrid[i][j] = [[Node alloc] initWithPosition:ccp(i, j)];
            //QuietLog(@"Node Initialized: %@", nodeGrid[i][j]);
        }
    }
    
    //Set neighbors for each node
    for(int i = 0; i < mapWidth; i++) {
        for(int j = 0; j < mapHeight; j++) {
            //get the neighbors
            
            NSMutableArray *neighborNodes = [NSMutableArray arrayWithCapacity:8];
            NSMutableArray *neighborPoints = [self getTraverseableNeighborsForTileCoord:ccp(i, j)];
            Node *n = nodeGrid[i][j];
            
            for(NSValue *v in neighborPoints) {
                CGPoint pos = [v CGPointValue];
                [neighborNodes addObject:(nodeGrid[(int)pos.x][(int)pos.y])];
            }
            
            [n setNeighbors:neighborNodes];
        }
    }
}


/////////////////////

////
//Essentially means that you are freeing all nodes
-(void) resetNextFreeSharedNode
{
    nextFreeSharedNode = 0;
}

-(void) increaseSharedNodes
{
    for(int i = sharedNodes.count; i < sharedNodes.count + INITIAL_NODE_CAPACITY; i++) {
        [sharedNodes addObject:[[Node alloc] init]];
    }
}

-(Node*) getNodeWithPosition:(CGPoint)position
{
    if(nextFreeSharedNode >= sharedNodes.count) {
        [self increaseSharedNodes];
    }
    Node *n = [sharedNodes objectAtIndex:nextFreeSharedNode];
    n.position = position;
    nextFreeSharedNode++;
    return n;
}
////

- (NSArray *)getTraverseableNeighborsForTileCoord:(CGPoint)tileCoord
{
    if(tileMapLayer_ == nil) {
        return nil;
    }
    
	NSMutableArray *neighbors = [NSMutableArray arrayWithCapacity:8];
    
    BOOL t = NO;
    BOOL l = NO;
    BOOL b = NO;
    BOOL r = NO;
    
	// Top Neighbor
	CGPoint p = ccp(tileCoord.x, tileCoord.y - 1);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
        t = YES;
	}
    
	// Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
        l = YES;
	}
    
	// Bottom Neighbor
	p = ccp(tileCoord.x, tileCoord.y + 1);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
        b = YES;
	}
    
	// Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
        r = YES;
	}
    
    
	// Top Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y - 1);
	if (t && l && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
	}
    
	// Bottom Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y + 1);
	if (b && l && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
	}
    
	// Top Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y - 1);
	if (t && r && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
	}
    
	// Bottom Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y + 1);
	if (b && r && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:[NSValue valueWithCGPoint:p]];
	}
    
	return [NSArray arrayWithArray:neighbors];
}



////////////
////////////








- (NSArray *)getTraverseableNeighborNodesForTileCoord:(CGPoint)tileCoord
{
    if(tileMapLayer_ == nil) {
        return nil;
    }
    
	NSMutableArray *neighbors = [NSMutableArray arrayWithCapacity:8];
    
    BOOL t = NO;
    BOOL l = NO;
    BOOL b = NO;
    BOOL r = NO;
    
	// Top Neighbor
	CGPoint p = ccp(tileCoord.x, tileCoord.y - 1);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
        t = YES;
	}
    
	// Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
        l = YES;
	}
    
	// Bottom Neighbor
	p = ccp(tileCoord.x, tileCoord.y + 1);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
        [neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
        b = YES;
	}
    
	// Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y);
	if ([self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
        [neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
        r = YES;
	}
    
    
	// Top Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y - 1);
	if (t && l && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
	}
    
	// Bottom Left Neighbor
	p = ccp(tileCoord.x - 1, tileCoord.y + 1);
	if (b && l && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
	}
    
	// Top Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y - 1);
	if (t && r && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
	}
    
	// Bottom Right Neighbor
	p = ccp(tileCoord.x + 1, tileCoord.y + 1);
	if (b && r && [self.tileMapLayer isValidTileCoord:p] && ![self.tileMapLayer isTileCollidableFast:p]) {
		[neighbors addObject:nodeGrid[(int)p.x][(int)p.y]];
	}
    
	return [NSArray arrayWithArray:neighbors];
}



-(NSArray *)computePreallocNodePathFrom:(CGPoint)origin To:(CGPoint)target
{
    // Init shortest path properties
	spOpenNodes = [NSMutableArray array];
	spClosedNodes = [NSMutableArray array];
	shortestPath = nil;
    
    BOOL deadPath = NO;
	
	// Get current tile coordinate and desired tile coord
	CGPoint fromTileCoord = [self.tileMapLayer tileCoordForPosition:origin];
    CGPoint toTileCoord = [self.tileMapLayer tileCoordForPosition:target];
	
    QuietLog(@"Going from tile:(%.0f, %.0f) to tile:(%.0f, %.0f)", fromTileCoord.x, fromTileCoord.y, toTileCoord.x, toTileCoord.y);
    
	// Check that there is a path to compute (skip, since nil return we want to compute that short path and combat move anyways)
	if (CGPointEqualToPoint(fromTileCoord, toTileCoord)) {
        QuietLog(@"Already at target");
        deadPath = YES;
        //		return nil;
	}
	
	// Must check that the desired location is walkable
	// In our case it's really easy, because only wall are unwalkable
    if ([self.tileMapLayer isTileCollidable:toTileCoord]) {
        QuietLog(@"Target was collideable, not generating path");
        deadPath = YES;
        //		return nil;
    }
	
	// Start by adding the from position to the open list
    nodeGrid[(int)fromTileCoord.x][(int)fromTileCoord.y].parent = nil;
    [self insertInOpenNodes:nodeGrid[(int)fromTileCoord.x][(int)fromTileCoord.y]];
	
	do {
		// Get the lowest F cost Node (always the first, since list is ordered)
		Node *currentNode = [spOpenNodes objectAtIndex:0];
        
        //QuietLog(@"Expanding node at: (%.0f, %.0f)", currentNode.position.x, currentNode.position.y);
        
		// Add the current Node to the closed set
		[spClosedNodes addObject:currentNode];
        
		// Remove it from the open list
		// Note that if we wanted to first removing from the open list, care should be taken to the memory
		[spOpenNodes removeObjectAtIndex:0];
		
		// If the currentNode is at the desired tile coordinate, we are done
		if (CGPointEqualToPoint(currentNode.position, toTileCoord)) {
            //QuietLog(@"Target Found!");
			[self constructPathFromNode:currentNode];
			spOpenNodes = nil; // Set to nil to release unused memory
			spClosedNodes = nil; // Set to nil to release unused memory
            
            QuietLog(@"Path: %@", shortestPath);
			break;
		}
		
		// Get the adjacent tiles coord of the current Node
        NSArray *adjNodes = currentNode.neighbors;
		for (Node *node in adjNodes) {
			
			// Check if the Node isn't already in the closed set
			if ([spClosedNodes containsObject:node]) {
				continue; // Ignore it
			}
			
			// Compute the cost form the current Node to that Node
			int moveCost = [self costToMoveFromNode:currentNode
                                     toAdjacentNode:node];
			
			// Check if the Node is already in the open list
            NSUInteger index = [spOpenNodes indexOfObject:node];			
			if (index == NSNotFound) { // Not on the open list, so add it
                
				// Set the current Node as the parent
				node.parent = currentNode;
                
				// The new cost is equal to the parent cost + the cost to move from the parent to it
				node.cost = currentNode.cost + moveCost;
				
				// Compute the cost heuristic which is the estimated movement cost to move from that Node to the desired tile coordinate
				node.heuristic = [self computeHeuristicFromCoord:node.position
                                                         toCoord:toTileCoord];
				
				// Adding it with the function which is preserving the list ordered by F score (cost + heuristic)
				[self insertInOpenNodes:node];
				
                //QuietLog(@"Adding new node at: (%.0f, %.0f) with Fcost = %.2f", node.position.x, node.position.y, [node fCost]);
                

			}
			else { // Already in the open list
				
				node = [spOpenNodes objectAtIndex:index]; // To retrieve the old one, which has its scores already computed
				
				// Check to see if the cost for that Node is lower if we use the current Node to get there
				if ((currentNode.cost + moveCost) < node.cost) {
                    //                    QuietLog(@"Found node at: (%.0f, %.0f) with Fcost = %.2f, A better pasth exists from (%.0f, %.0f) with Fcost = %.2f", node.position.x, node.position.y, [node fCost], currentNode.position.x, currentNode.position.y, [currentNode fCost] + moveCost);
					
					// The G score is equal to the parent G score + the cost to move from the parent to it
					node.cost = currentNode.cost + moveCost;
                    node.parent = currentNode.parent;   //ADDED, Necessary, yes?
                    
					
					// Because the G Score has changed, the F score may have changed too
					// So to keep the open list ordered we have to remove the Node, and re-insert it with
					// the insert function which is preserving the list ordered by F score
					
					// We have to retain it before removing it from the list
					//[node retain];
					
					// Now we can removing it from the list without be afraid that it can be released
					[spOpenNodes removeObjectAtIndex:index];
					
					// Re-insert it with the function which is preserving the list ordered by F score
					[self insertInOpenNodes:node];
					
					// Now we can release it because the oredered list retain it
					//[Node release];
				}
			}
		}
		
	} while ([spOpenNodes count] > 0);
	
	if (shortestPath == nil) { // No path found
		QuietLog(@"No path found!");
        return nil;
	} else {
        return shortestPath;
    }

}



/////////////
/////////////




-(int) checkOpenListForNodeWithState:(CGPoint) position
{
    for(int i = 0; i < spOpenNodes.count; i++) {
        Node *n = [spOpenNodes objectAtIndex:i];
        if(CGPointEqualToPoint(n.position, position)) {
            return i;
        }
    }
    return -1;
}

// Insert a path Node (Node) in the ordered open Nodes list (spOpenNodes)
- (void)insertInOpenNodes:(Node *)node
{
	int nodeFCost = [node fCost]; // Compute only once the Node F score's
	int count = [spOpenNodes count];
	int i = 0; // It will be the index at which we will insert the Node
	for (; i < count; i++) {
		if (nodeFCost <= [[spOpenNodes objectAtIndex:i] fCost]) { // if the Node F score's is lower or equals to the Node at index i
			// Then we found the index at which we have to insert the new Node
			break;
		}
	}
	// Insert the new Node at the good index to preserve the F score ordering
	[spOpenNodes insertObject:node atIndex:i];
}

// Go backward from a step (the final one) to reconstruct the shortest computed path
- (void)constructPathFromNode:(Node *)node
{
	shortestPath = [NSMutableArray array];
	
	do {
        NSValue *pt = [NSValue valueWithCGPoint:node.position];
        [shortestPath insertObject:pt atIndex:0]; // Always insert at index 0 to reverse the path
        //QuietLog(@"Added node's position to shortest path: %@", node);
		node = node.parent; // Go backward
	} while (node != nil); // Until there is not more parent
    
    while(shortestPath.count < 5) {    // Add in 2 points if there are not enough
        //CGPoint lerpPt = ccpLerp([[shortestPath objectAtIndex:0] CGPointValue],
        //                         [[shortestPath objectAtIndex:shortestPath.count - 1] CGPointValue],
        //                         1.0 - shortestPath.count * .2f); //Interpolate so it doesn't look bad
        
        //[shortestPath addObject:[NSValue valueWithCGPoint:lerpPt]];

        [shortestPath insertObject:[shortestPath objectAtIndex:0] atIndex:(0)];
        [shortestPath insertObject:[shortestPath objectAtIndex:shortestPath.count - 1] atIndex:(shortestPath.count - 1)];
    }
    
    //QuietLog(@"Shortest Path Constructed");
}



// Compute the heuristic from a position to another (from the current position to the final desired position)
- (int)computeHeuristicFromCoord:(CGPoint)fromCoord toCoord:(CGPoint)toCoord
{
    return ccpDistance(fromCoord, toCoord)*10;
}

// Compute the cost of moving from one node to a neighbor node
- (int)costToMoveFromNode:(Node *)fromNode toAdjacentNode:(Node *)toNode
{
	return ((fromNode.position.x != toNode.position.x) && (fromNode.position.y != toNode.position.y)) ? 14 : 10;
}




@end
