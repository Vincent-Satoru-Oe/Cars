//
//  Coin.h
//  Cars
//
//  Created by Eric Sutton on 3/31/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coin : NSObject

@property UIImage *image;
@property UIImageView *imageView;
@property NSInteger speed;
@property CGPoint position;
@property NSInteger currentLane;

-(id) initCoin;
-(void) moveDown;
-(void)refreshImageView;

@end
