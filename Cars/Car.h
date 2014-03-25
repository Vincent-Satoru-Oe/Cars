//
//  Car.h
//  Cars
//
//  Created by Vincent Oe on 3/25/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property UIImage *image;
@property NSInteger *speed;
@property CGPoint position;
@property BOOL *isPlayerCar;

-(id) initWithImage:(NSString*)imageName andSpeed:(NSInteger*)speed;
-(id) initRandomCar;
-(id) initPlayerCar;

@end
