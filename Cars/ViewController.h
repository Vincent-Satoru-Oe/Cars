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
//int randomPosition;
int scoreNumber;
int highScore;
static CGFloat lane0 = 38;
static CGFloat lane1 = 116;
static CGFloat lane2 = 205;
static CGFloat lane3 = 285;

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
    
    // Cars in each lane
    IBOutlet UIImageView *leftLaneCar1;
    IBOutlet UIImageView *leftLaneCar2;
    IBOutlet UIImageView *leftLaneCar3;

    IBOutlet UIImageView *centerLeftLaneCar1;
    IBOutlet UIImageView *centerLeftLaneCar2;
    IBOutlet UIImageView *centerLeftLaneCar3;

    IBOutlet UIImageView *centerRightLaneCar1;
    IBOutlet UIImageView *centerRightLaneCar2;
    IBOutlet UIImageView *centerRightLaneCar3;

    IBOutlet UIImageView *rightLaneCar1;
    IBOutlet UIImageView *rightLaneCar2;
    IBOutlet UIImageView *rightLaneCar3;
    
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
    
    // Test Car
    IBOutlet UIImageView *testCar1;
    IBOutlet UIImageView *testCar2;
    IBOutlet UIImageView *testCar3;
    IBOutlet UIImageView *testCar4;

}

-(void) movePlayerCar;       // moves players cars
-(void) moveSurroundingCars; // move surrounding cars
-(void) newGame;             // start a new gae
-(void) scoring;             // number of cars cut off
-(void) hitCar;              // hit another car
-(void) endGame;             // when to end the game
-(void) changeLanes;         // changes lane of players car

@end
