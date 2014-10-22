//
//  Node.h
//  cocos2d-normal
//
//  Created by Keith DeRuiter on 11/24/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    CGPoint position_;
    int cost_;
    int heuristic_;
    
    Node *parent_;
    
    NSMutableArray *neighbors_;
}

@property CGPoint position;
@property (nonatomic, retain) Node *parent;
@property (nonatomic, retain) NSMutableArray *neighbors;
@property int cost;
@property int heuristic;

-(id) initWithPosition:(CGPoint)position;
-(id) initWithPosition:(CGPoint)position Cost:(int)cost Parent:(Node*)parent;
-(int) fCost;

- (NSString *)description;

@end
