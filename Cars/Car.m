//
//  Car.m
//  Cars
//
//  Created by Vincent Oe on 3/25/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "Car.h"
#import "ViewController.h"

#define randomValue() (arc4random() / 4294967296)

@implementation Car

-(NSString*) randomColor {
    NSArray *list = @[@"BlueCar.png", @"GreenCar.png", @"RedCar.png", @"YellowCar.png", @"PinkCar.png", @"OrangeCar.png"];
    NSInteger randomIndex = arc4random() % [list count];
    return [list objectAtIndex:randomIndex];
}

-(id)initRandomCar {
    if (self = [super init]) {
        NSLog(@"Spawning a car");
        NSString *temp = [self randomColor];
        self.image = [UIImage imageNamed:(@"%@", temp)];
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
            NSLog(@"in here");
            i = i + 1;
        }
        NSLog(@"value of i: %d", i);
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
        self.isPlayerCar = NO;

        [self refreshImageView];
    }
    return self;
}

-(id)initWithImage:(NSString *)imageName andSpeed:(NSInteger)speed {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:imageName];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
        self.speed = speed;
        self.position = CGPointMake(l0x, top);
        self.currentLane = 0;
        self.isPlayerCar = NO;
        
        [self refreshImageView];
    }
    return self;
}

-(id)initPlayerCar {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:@"BlueCar.png"];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
        self.speed = defaultSpeed;
        self.position = CGPointMake(l2x, defaultY);
        self.currentLane = 2;
        self.isPlayerCar = YES;

        [self refreshImageView];
    }
    return self;
}

-(void)moveLeft {
    if (self.currentLane > 0) {
        self.currentLane = self.currentLane - 1;
        if (self.currentLane == 2) {
            self.position = CGPointMake(l2x, defaultY);
        }
        else if (self.currentLane == 1) {
            self.position = CGPointMake(l1x, defaultY);
        }
        else if (self.currentLane == 0) {
            self.position = CGPointMake(l0x, defaultY);
        }
        else {
            NSLog(@"Error Occurred in Car.moveLeft()");
        }
        [self refreshImageView];
    }
}

-(void)moveRight {
    if (self.currentLane < 3)
    {
        self.currentLane = self.currentLane + 1;
        
        if (self.currentLane == 1)
        {
            self.position = CGPointMake(l1x, defaultY);
        }
        else if (self.currentLane == 2) {
            self.position = CGPointMake(l2x, defaultY);
        }
        else if (self.currentLane == 3) {
            self.position = CGPointMake(l3x, defaultY);
        }
        else {
            NSLog(@"Error Occurred in Car.moveLeft()");
        }
        [self refreshImageView];
    }
}

-(void)moveDown {
    self.position = CGPointMake(self.position.x, self.position.y + self.speed);
    [self refreshImageView];
}

-(void)refreshImageView {
    self.imageView.center = self.position;
}

@end