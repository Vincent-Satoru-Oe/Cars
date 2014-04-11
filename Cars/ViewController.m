//
//  ViewController.m
//  Car Game
//
//  Created by Eric Sutton on 3/12/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Coin.h"
#include "math.h"

@interface ViewController ()

@end

#define randomValue() (arc4random() % ((unsigned)RAND_MAX + 1))

@implementation ViewController

-(void) coinIncrement {
    totalCoins++;
    totalCoinsLabel.text = [NSString stringWithFormat:@"Total Coins:   %i", totalCoins];
}

-(void) deleteSingleCoin:(id) sender {
    Coin *coin = sender;
    [coin.imageView removeFromSuperview];
    coin.imageView = nil;
    coin.image = nil;
    coin = nil;
}
-(void) moveCoins {
    for (Coin *coin in lane0Coin) {
        [coin moveDown];
        if (coin.position.y > 560) {
            [lane0Coin removeObject:coin];
            break;
        }
    }
    for (Coin *coin in lane1Coin) {
        [coin moveDown];
        if (coin.position.y > 560) {
            [lane1Coin removeObject:coin];
            break;
        }
    }
    for (Coin *coin in lane2Coin) {
        [coin moveDown];
        if (coin.position.y > 560) {
            [lane2Coin removeObject:coin];
            break;
        }
    }
    for (Coin *coin in lane3Coin) {
        [coin moveDown];
        if (coin.position.y > 560) {
            [lane3Coin removeObject:coin];
            break;
        }
    }
}

-(void) deleteAllCoins {
    for (int i = 0; i < [lane0Coin count]; i++) {
        Coin *coin = lane0Coin[i];
        [coin.imageView removeFromSuperview];
        coin = nil;
    }
    for (int i = 0; i < [lane1Coin count]; i++) {
        Coin *coin = lane1Coin[i];
        [coin.imageView removeFromSuperview];
        coin = nil;
    }
    for (int i = 0; i < [lane2Coin count]; i++) {
        Coin *coin = lane2Coin[i];
        [coin.imageView removeFromSuperview];
        coin = nil;
    }
    for (int i = 0; i < [lane3Coin count]; i++) {
        Coin *coin = lane3Coin[i];
        [coin.imageView removeFromSuperview];
        coin = nil;
    }
}

-(void) checkCollisionWithCoins {
    NSInteger lane = playerCar.currentLane;
    if (lane == 0) {
        for (Coin *coin in lane0Coin) {
            if (abs(playerCar.imageView.center.y - coin.imageView.center.y) <= 69) {
                [self coinIncrement];
                [self deleteSingleCoin:coin];
            }
        }
    }
    else if (lane == 1) {
        for (Coin *coin in lane1Coin) {
            if (abs(playerCar.imageView.center.y - coin.imageView.center.y) <= 69) {
                [self coinIncrement];
                [self deleteSingleCoin:coin];
            }
        }
    }
    else if (lane == 2) {
        for (Coin *coin in lane2Coin) {
            if (abs(playerCar.imageView.center.y - coin.imageView.center.y) <= 69) {
                [self coinIncrement];
                [self deleteSingleCoin:coin];
            }
        }
    }
    else {
        for (Coin *coin in lane3Coin) {
            if (abs(playerCar.imageView.center.y - coin.imageView.center.y) <= 69) {
                [self coinIncrement];
                [self deleteSingleCoin:coin];
            }
        }
    }
}

-(void) spawnCoin {
    Coin *coin = [[Coin alloc] initCoin];
    if (coin.currentLane == 0) {
        [lane0Coin addObject:coin];
    } else if (coin.currentLane == 1 ) {
        [lane1Coin addObject:coin];
    } else if (coin.currentLane == 2 ) {
        [lane2Coin addObject:coin];
    } else if (coin.currentLane == 3 ) {
        [lane3Coin addObject:coin];
    }
    [self.view addSubview:coin.imageView];
    [coin refreshImageView];
}



-(void) pause:(id) sender {
    if (isPlayButton) {
        gamePausedLabel.hidden = YES;
        self.view.userInteractionEnabled = YES;
        UIImage *btnImage1 = [UIImage imageNamed:@"PauseButton.png"];
        [button setImage:btnImage1 forState:UIControlStateNormal];
        isPlayButton = NO;
        timer = [NSTimer scheduledTimerWithTimeInterval:.03 target:self selector:@selector(movePlayerCar) userInfo:Nil repeats:YES];
        scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoring) userInfo:nil repeats:YES];
        carSpawner = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(spawnCar) userInfo:nil repeats:YES];
        coinSpawner = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(spawnCoin) userInfo:nil repeats:YES];
        gameIsPaused = NO;
    }
    else {
        gamePausedLabel.hidden = NO;
        UIImage *btnImage2 = [UIImage imageNamed:@"PlayButton.png"];
        [button setImage:btnImage2 forState:UIControlStateNormal];
        isPlayButton = YES;
        [timer invalidate];
        [scorer invalidate];
        [carSpawner invalidate];
        [coinSpawner invalidate];
        gameIsPaused = YES;
    }
}

-(void) pauseButton {
    isPlayButton = NO;
    gameIsPaused = NO;
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(pause:)
     forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *btnImage = [UIImage imageNamed:@"PauseButton.png"];
    [button setImage:btnImage forState:UIControlStateNormal];

    [button setBackgroundColor:[UIColor greenColor]];

    button.frame = CGRectMake(280, 0, 30, 30);
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 15;

    [self.view addSubview:button];
}

-(void) checkCollision {
    NSInteger lane = playerCar.currentLane;
    if (lane == 0) {
        for (Car *car in lane0) {
            if (abs(playerCar.imageView.center.y - car.imageView.center.y) <= 69) {
                [self endGame];
            }
        }
    } else if (lane == 1) {
        for (Car *car in lane1) {
            if (abs(playerCar.imageView.center.y - car.imageView.center.y) <= 69) {
                [self endGame];
            }
        }

    } else if (lane == 2) {
        for (Car *car in lane2) {
            if (abs(playerCar.imageView.center.y - car.imageView.center.y) <= 69) {
                [self endGame];
            }
        }

    } else if (lane == 3) {
        for (Car *car in lane3) {
            if (abs(playerCar.imageView.center.y - car.imageView.center.y) <= 69) {
                [self endGame];
            }
        }
    }
}

-(void) moveCars {
    road9.center = CGPointMake(road9.center.x, road9.center.y + defaultSpeed);
    road8.center = CGPointMake(road8.center.x, road8.center.y + defaultSpeed);
    road7.center = CGPointMake(road7.center.x, road7.center.y + defaultSpeed);
    road6.center = CGPointMake(road6.center.x, road6.center.y + defaultSpeed);
    road5.center = CGPointMake(road5.center.x, road5.center.y + defaultSpeed);
    road4.center = CGPointMake(road4.center.x, road4.center.y + defaultSpeed);
    road3.center = CGPointMake(road3.center.x, road3.center.y + defaultSpeed);
    road2.center = CGPointMake(road2.center.x, road2.center.y + defaultSpeed);
    road1.center = CGPointMake(road1.center.x, road1.center.y + defaultSpeed);

    if (road1.center.y > 560)
        road1.center = CGPointMake(road1.center.x, -10);
    else if (road2.center.y > 560)
        road2.center = CGPointMake(road2.center.x, -10);
    else if (road3.center.y > 560)
        road3.center = CGPointMake(road3.center.x, -10);
    else if (road4.center.y > 560)
        road4.center = CGPointMake(road4.center.x, -10);
    else if (road5.center.y > 560)
        road5.center = CGPointMake(road5.center.x, -10);
    else if (road6.center.y > 560)
        road6.center = CGPointMake(road6.center.x, -10);
    else if (road7.center.y > 560)
        road7.center = CGPointMake(road7.center.x, -10);
    else if (road8.center.y > 560)
        road8.center = CGPointMake(road8.center.x, -10);
    else if (road9.center.y > 560)
        road9.center = CGPointMake(road9.center.x, -10);

    [self moveSurroundingCars];
    [self moveCoins];
    [self checkCollision];
    [self checkCollisionWithCoins];
}

-(void) moveSurroundingCars {
    int count = [lane0 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *car = lane0[i];
            
            [car moveDown];
            if (car.position.y > 560) {
                [lane0 removeObject:car];
                break;
            }
        }
    }
    count = [lane1 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *car = lane1[i];
            [car moveDown];
            if (car.position.y > 560) {
                [lane1 removeObject:car];
                break;
            }
        }
    }
    count = [lane2 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *car = lane2[i];
            [car moveDown];
            if (car.position.y > 560) {
                [lane2 removeObject:car];
                break;
            }
        }
    }
    count = [lane3 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *car = lane3[i];
            [car moveDown];
            if (car.position.y > 560) {
                [lane3 removeObject:car];
                break;
            }

        }
    }
}

-(void) newGame {
    highestScore.hidden = NO;
    totalCoinsLabel.hidden = NO;
    developerName.hidden = NO;
    tapToStart.hidden = NO;
    swipeToMove.hidden = NO;
    start = YES;
    score.text = [NSString stringWithFormat:@"Score: %i", scoreNumber];
    highestScore.text = [NSString stringWithFormat:@"High Score: %i", highScore];
    totalCoinsLabel.text = [NSString stringWithFormat:@"Total Coins: %i", totalCoins];

}

-(void) scoring {
    scoreNumber++;
    score.text = [NSString stringWithFormat:@"Score:   %i", scoreNumber];
}

-(void) willSpawnCar {
    //float v = randomValue();
}

-(void) spawnCar {
    Car *newCar = [[Car alloc] initRandomCar];
    if (newCar.currentLane == 0) { // && ([lane0 count] < maxCarsPerLane)
        [lane0 addObject:newCar];
    } else if (newCar.currentLane == 1 ) { // && ([lane0 count] < maxCarsPerLane)
        [lane1 addObject:newCar];
    } else if (newCar.currentLane == 2 ) { // && ([lane2 count] < maxCarsPerLane)
        [lane2 addObject:newCar];
    } else if (newCar.currentLane == 3 ) { //&& ([lane3 count] < maxCarsPerLane)
        [lane3 addObject:newCar];
    }
    [self.view addSubview:newCar.imageView];
    [newCar refreshImageView];
}

-(void) deletePlayerCar {
    [playerCar.imageView removeFromSuperview];
    playerCar.imageView = nil;
    playerCar.image = nil;
    playerCar = nil;
}

-(void) deleteAllCars {
    int count = [lane0 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *cars = lane0[i];
            [cars.imageView removeFromSuperview];
            cars = nil;
        }
    }
    count = [lane1 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *cars = lane1[i];
            [cars.imageView removeFromSuperview];
            cars = nil;
        }
    }
    count = [lane2 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *cars = lane2[i];
            [cars.imageView removeFromSuperview];
            cars = nil;
        }
    }
    count = [lane3 count];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            Car *cars = lane3[i];
            [cars.imageView removeFromSuperview];
            cars = nil;
        }
    }
}

-(void) endGame {
    if (scoreNumber > highScore) {
        highScore = scoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:highScore forKey:@"High Score Saved"];
    }
    gameNotOver = NO;
    [button setEnabled:NO];
    [timer invalidate];
    [scorer invalidate];
    [carSpawner invalidate];
    [self performSelector:@selector(newGame) withObject:nil afterDelay:2];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft && !gameIsPaused && gameNotOver)
        [playerCar moveLeft];

    else if (swipe.direction == UISwipeGestureRecognizerDirectionRight && !gameIsPaused && gameNotOver) {
        [playerCar moveRight];
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (start == YES) {
        [self startGame];
        scoreNumber = 0;
        score.text = [NSString stringWithFormat:@"Score:   %i", scoreNumber];
    }
}

- (void)startGame {
    [self deleteAllCars];
    [self deletePlayerCar];
    [self deleteAllCoins];
    [self pauseButton];

    playerCar = [[Car alloc] initPlayerCar];
    [self.view addSubview:playerCar.imageView];

    alpha = 1;

    lane0 = [[NSMutableArray alloc] init];
    lane1 = [[NSMutableArray alloc] init];
    lane2 = [[NSMutableArray alloc] init];
    lane3 = [[NSMutableArray alloc] init];
    
    lane0Coin = [[NSMutableArray alloc] init];
    lane1Coin = [[NSMutableArray alloc] init];
    lane2Coin = [[NSMutableArray alloc] init];
    lane3Coin = [[NSMutableArray alloc] init];

    start = NO;
    [button setEnabled:YES];
    gameNotOver = YES;
    highestScore.hidden = YES;
    developerName.hidden = YES;
    tapToStart.hidden = YES;
    swipeToMove.hidden = YES;
    button.enabled = YES;

    road9.center = CGPointMake(160,  36);
    road8.center = CGPointMake(160, 100);
    road7.center = CGPointMake(160, 164);
    road6.center = CGPointMake(160, 228);
    road5.center = CGPointMake(160, 292);
    road4.center = CGPointMake(160, 356);
    road3.center = CGPointMake(160, 420);
    road2.center = CGPointMake(160, 484);
    road1.center = CGPointMake(160, 548);

    timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(moveCars) userInfo:Nil repeats:YES];
    scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoring) userInfo:nil repeats:YES];
    carSpawner = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(spawnCar) userInfo:nil repeats:YES];
    coinSpawner = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnCoin) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    start = YES;
    [button setEnabled:YES];
    button.enabled = NO;
    gamePausedLabel.hidden = YES;
    totalCoinsLabel.hidden = NO;
    self.view.userInteractionEnabled = YES;
    score.text = [NSString stringWithFormat:@"Score:   %i", scoreNumber];
    totalCoinsLabel.text = [NSString stringWithFormat:@"Total Coins: %i", totalCoins];
    [button setEnabled:NO];

    
    // Swipe Gesture Variables
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    // Adding the swipe gesture on image view
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];

    highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"High Score Saved"];
    highestScore.text = [NSString stringWithFormat:@"High Score: %i", highScore];
    
    //totalCoins = [[NSUserDefaults standardUserDefaults] integerForKey:@"High Score Saved"];
    totalCoinsLabel.text = [NSString stringWithFormat:@"Total Coins: %i", totalCoins];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
