//
//  Car.m
//  Cars
//
//  Created by Vincent Oe on 3/25/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "Car.h"
#import "ViewController.h"

static NSInteger defaultSpeed = 5;

@implementation Car

-(id)initRandomCar {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:@"BlueCar.png"];
        self.speed = defaultSpeed;
        self.position = CGPointMake(l0x, 50);
        self.isPlayerCar = NO;
    }
    return self;
}

-(id)initWithImage:(NSString *)imageName andSpeed:(NSInteger)speed {
    if (self = [super init]) {
        self.image = [UIImage imageNamed:imageName];
        self.speed = speed;
        self.position = CGPointMake(l0x, 50);
        self.isPlayerCar = NO;
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
        } else if (self.currentLane == 1) {
            self.position = CGPointMake(l1x, defaultY);
        } else if (self.currentLane == 0) {
            self.position = CGPointMake(l0x, defaultY);
        } else {
            NSLog(@"Error Occurred in Car.moveLeft()");
        }
    }
}

-(void)moveRight {
    if (self.currentLane < 3) {
        self.currentLane = self.currentLane + 1;
        if (self.currentLane == 1) {
            self.position = CGPointMake(l1x, defaultY);
        } else if (self.currentLane == 2) {
            self.position = CGPointMake(l2x, defaultY);
        } else if (self.currentLane == 3) {
            self.position = CGPointMake(l3x, defaultY);
        } else {
            NSLog(@"Error Occurred in Car.moveLeft()");
        }
    }
}

-(void)refreshImageView {
    self.imageView.center = self.position;
}

@end
