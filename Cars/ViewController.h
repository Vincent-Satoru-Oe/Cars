//
//  ViewController.h
//  Car Game
//
//  Created by Eric Sutton on 3/13/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "Car.h"
#import "Coin.h"
#import <UIKit/UIKit.h>

int y;
BOOL start;
int scoreNumber;
int highScore;
int totalCoins;
BOOL isPlayButton;
BOOL gameIsPaused;
BOOL gameNotOver;

static NSInteger maxCarsPerLane = 2;

static NSInteger l0x = 38;
static NSInteger l1x = 116;
static NSInteger l2x = 205;
static NSInteger l3x = 285;
static NSInteger top = -50;
static NSInteger defaultY = 350;
static NSInteger defaultSpeed = 5;

@interface ViewController : UIViewController
{
    NSTimer *timer;
    NSTimer *scorer;
    NSTimer *carSpawner;
    NSTimer *coinSpawner;
    
    NSMutableArray *lane0;
    NSMutableArray *lane1;
    NSMutableArray *lane2;
    NSMutableArray *lane3;
    
    NSMutableArray *lane0Coin;
    NSMutableArray *lane1Coin;
    NSMutableArray *lane2Coin;
    NSMutableArray *lane3Coin;
    
    UIButton *button;
    
    NSInteger alpha;
    
    IBOutlet UILabel *highestScore;    // highest score label
    IBOutlet UILabel *developerName;   // developer name label
    IBOutlet UILabel *tapToStart;      // tap to start label
    IBOutlet UILabel *swipeToMove;     // swipe to start label
    IBOutlet UILabel *gamePausedLabel;
    IBOutlet UILabel *totalCoinsLabel;

    Car *playerCar;
    UIImageView *playerCarView;

    IBOutlet UILabel *score;

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
-(void) newGame;             // start a new game
-(void) scoring;             // number of cars cut off
-(void) endGame;             // when to end the game
-(void) checkCollision;      // see if player hit a car
-(void) spawnCar;            // spawn new car
-(void) deleteAllCars;
-(void) deletePlayerCar;
-(void) pause:(id) sender;
-(void) pauseButton;
-(void) moveCoins;
-(void) deleteAllCoins;
-(void) checkCollisionWithCoins;
-(void) spawnCoin;
-(void) deleteSingleCoin:(id) sender;
-(void) coinIncrement;


@end
