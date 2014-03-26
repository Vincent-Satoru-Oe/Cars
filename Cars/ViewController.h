//
//  ViewController.h
//  Car Game
//
//  Created by Eric Sutton on 3/13/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import <UIKit/UIKit.h>
int y;
BOOL start;
int scoreNumber;
int highScore;

@interface ViewController : UIViewController
{
    NSTimer *timer;
    NSTimer *scorer;
    
    IBOutlet UILabel *highScore;       // high score
    IBOutlet UILabel *developerName;   // developer name
    IBOutlet UILabel *tapToStart;      // label that says tap to start
    
    UIImage *playerCar;
    UIImageView *playerCarView;
    
    IBOutlet UILabel *score;

    // The players Car
    IBOutlet UIImageView *playersCar;
    
    // White lines on the road
    IBOutlet UIImageView *road1;
    IBOutlet UIImageView *road2;
    IBOutlet UIImageView *road3;
    IBOutlet UIImageView *road4;
    IBOutlet UIImageView *road5;
    IBOutlet UIImageView *road6;
    IBOutlet UIImageView *road7;
    IBOutlet UIImageView *road8;
    IBOutlet UIImageView *road9;
}

-(void) movePlayerCar;       // moves players cars
-(void) moveSurroundingCars; // move surrounding cars
-(void) newGame;             // start a new gae
-(void) scoring;             // number of cars cut off
-(void) hitCar;              // hit another car
-(void) endGame;             // when to end the game
-(void) changeLanes;         // changes lane of players car
//-(void) aMethod:(id)whichButton;

@end
