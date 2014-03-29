//
//  Car.m
//  Cars
//
//  Created by Vincent Oe on 3/25/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "Car.h"
#import "ViewController.h"
#include <stdlib.h>

@implementation Car
-(NSString*) randomColor {
    NSArray *list = @[@"BlueCar.png", @"GreenCar.png", @"RedCar.png", @"YellowCar.png", @"PinkCar.png", @"OrangeCar.png"];
    NSInteger randomIndex = arc4random() % [list count];
    return [list objectAtIndex:randomIndex];
}
-(id)initRandomCar {
    if (self = [super init]) {
        
        NSString *temp = [self randomColor];
        self.image = [UIImage imageNamed:(temp)];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
        self.speed = defaultSpeed;
        self.position = CGPointMake(l0x, -50);
        self.currentLane = 0;
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
        self.position = CGPointMake(l0x, -50);
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
-(id)changePlayerCar:(NSString *)color {
    self.image = [UIImage imageNamed:color];
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.speed = defaultSpeed;
    self.position = CGPointMake(l2x, defaultY);
    self.currentLane = 2;
    self.isPlayerCar = YES;
    
    [self refreshImageView];
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