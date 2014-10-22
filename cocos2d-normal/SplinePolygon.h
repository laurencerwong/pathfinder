//
//  SplinePolygon.h
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/22/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "CCNode.h"

typedef struct
{
    float x;
    float y;
} SplineVertex;

typedef struct
{
    float x;
    float y;
    float z;
} Vertex3D;

enum SplinePolygonState
{
    Empty,
    GotInitialPoint,
    Normal
};

@interface SplinePolygon : CCNode
{
    CGPoint firstPoint;
    CGPoint lastPoint;
    SplineVertex *points;
    ccColor4B *colorPoints;
    CGPoint currentNormal;
    int pointIndex;
    int numPoints;
    int blockCount;
    int blockSize;
    
    float width_;
    
    int fromColorLocation;
    int toColorLocation;
    int timeLocation;
    float distance;
    float time;
    ccColor4F fromColor_;
    ccColor4F toColor_;
    
    enum SplinePolygonState currentState;
}
@property float width;
@property (nonatomic)ccColor4F toColor;

-(void) addSplinePoint:(CGPoint)point;
-(void) setToFadeOut;
-(void) clearPoints;
-(void) addArrowFromPoint:(CGPoint)point1 to:(CGPoint)point2;
-(CGPoint) lastPoint;

@end
