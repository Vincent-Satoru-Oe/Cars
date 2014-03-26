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
        self.speed = &(defaultSpeed);
        self.position = CGPointMake(l0x, 50);
        self.isPlayerCar = NO;
    }
    return self;
}

-(id)initWithImage:(NSString *)imageName andSpeed:(NSInteger *)speed {
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
        self.imageView.center = CGPointMake(199, 400);
        self.speed = &(defaultSpeed);
        self.position = CGPointMake(l2x, 448);
        self.currentLane = 2;
        self.isPlayerCar = YES;
    }
    return self;
}

@end
