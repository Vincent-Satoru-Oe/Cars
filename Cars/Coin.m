//
//  Coin.m
//  Cars
//
//  Created by Eric Sutton on 3/31/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "Coin.h"
#import "ViewController.h"
#include <stdlib.h>

#define randomValue() (arc4random() / 4294967296)

@implementation Coin

-(id) initWithImage:(NSString*)imageName andSpeed:(NSInteger)speed {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:imageName];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
        self.speed = speed;
        self.position = CGPointMake(l0x, top);
        self.currentLane = 0;

        [self refreshImageView];
    }
    return self;
}
-(id) initCoin {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:(@"Coin.png")];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
    
        NSArray *speedDistribution = [NSArray arrayWithObjects:
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:2],
                                      [NSNumber numberWithFloat:50],
                                      [NSNumber numberWithFloat:150],
                                      [NSNumber numberWithFloat:300],
                                      [NSNumber numberWithFloat:500],
                                      [NSNumber numberWithFloat:700],
                                      [NSNumber numberWithFloat:850],
                                      [NSNumber numberWithFloat:950],
                                      [NSNumber numberWithFloat:999],
                                      [NSNumber numberWithFloat:1000], nil];
    
        float speedValue = arc4random() % 1000;
        int i = 0;
        while (speedValue >= [[speedDistribution objectAtIndex:i] floatValue]) {
            i = i + 1;
        }
        self.speed = (float)i/2.0;
        self.currentLane = arc4random() % 4;
        if (self.currentLane == 0) {
            self.position = CGPointMake(l0x, top);
        } else if (self.currentLane == 1) {
        self.position = CGPointMake(l1x, top);
        } else if (self.currentLane == 2) {
            self.position = CGPointMake(l2x, top);
        } else {
            self.position = CGPointMake(l3x, top);
        }
    
        [self refreshImageView];
    }
    return self;
}
    
-(void) moveDown {
    self.position = CGPointMake(self.position.x, self.position.y + self.speed);
    [self refreshImageView];
}
-(void)refreshImageView {
    self.imageView.center = self.position;
}

@end
