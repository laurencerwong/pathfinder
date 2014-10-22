//
//  DamageSprite.m
//  cocos2d-normal
//
//  Created by Laurence Wong on 11/18/13.
//  Copyright (c) 2013 Instructor. All rights reserved.
//

#import "DamageSprite.h"
#import "CGPointExtension.h"

@implementation DamageSprite
@synthesize killMe = killMe_;

+(id)damageSpriteWithNumber:(int)damage AtPosition:(CGPoint)position
{
    return [[self alloc] initWithNumber:damage AtPosition:position];
}

-(id)initWithNumber:(int)damage AtPosition:(CGPoint)position;
{
    self = [super initWithString:[NSString stringWithFormat:@"%d", damage] fontName:@"Marker Felt" fontSize:32];
    if (self) {
        maxTime = 2.0;
        self.color = ccc3(255, 50, 50);
        
        time = 0;
        self.killMe = NO;
        self.position = position;
    }
    return self;
    
}

-(CCNode *)getAsNode
{
    return self;
}

-(void)update:(ccTime)delta
{
    if(time > maxTime)
    {
        self.killMe = YES;
    }
    else
    {
        self.position = ccp(self.position.x + sinf(time*6.28), self.position.y + 0.5);
        self.opacity = (1.0 - (time/maxTime)) * (GLubyte)255;
        self.scale = (1.0 - time/maxTime);
    }
    time += delta;
}
@end
