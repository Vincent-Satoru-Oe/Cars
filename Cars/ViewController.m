//
//  ViewController.m
//  Car Game
//
//  Created by Eric Sutton on 3/12/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#include "math.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) click:(UIButton *) sender {
    NSLog(@"clicking the button worked");
    [self deletePlayerCar];
    playerCar.image = [UIImage imageNamed:@"RedCar.png"];
    NSString *colorChange = @"RedCar.png";

    playerCar = [[Car alloc] changePlayerCar:colorChange];

    playerCar.imageView = [[UIImageView alloc] initWithImage:playerCar.image];
    [self.view addSubview:playerCar.imageView];
    [playerCar refreshImageView];
    chosenColor = @"RedCar.png";

}

-(void) button {
    
    UILabel *redLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 30, 30)];
    [redLabel setText:@""];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [view setUserInteractionEnabled:NO];

    [view addSubview:redLabel];

    UIButton *btnRed = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRed addSubview:view];
    [btnRed setFrame:CGRectMake(100, 400, 30, 30)];
    [btnRed setBackgroundColor: [UIColor redColor]];
    [btnRed addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRed];
}
-(void) checkCollision {
    int upper = 66;
    int lower = 0;
    if (playerCar.currentLane == 0) {
        for (Car *car in lane0) {
            if ( (abs(playerCar.imageView.center.y - car.imageView.center.y) < upper) && (playerCar.currentLane == 0) && ((abs(playerCar.imageView.center.y - car.imageView.center.y) > lower))) {
                [self endGame];
            }
        }
    }
    else if (playerCar.currentLane == 1) {
        for (Car *car in lane1) {
            if ((abs(playerCar.imageView.center.y - car.imageView.center.y) < upper) && (playerCar.currentLane == 1) && ((abs(playerCar.imageView.center.y - car.imageView.center.y) > lower))) {
                [self endGame];
            }
        }
    }
    else if (playerCar.currentLane == 2) {
        for (Car *car in lane2) {
            if ( (abs(playerCar.imageView.center.y - car.imageView.center.y) < upper) && (playerCar.currentLane == 2) && ((abs(playerCar.imageView.center.y - car.imageView.center.y) > lower)) ) {
                [self endGame];
            }
        }
    }
    else {
        for (Car *car in lane3) {
            if ( (abs(playerCar.imageView.center.y - car.imageView.center.y) < upper) && (playerCar.currentLane == 3) && ((abs(playerCar.imageView.center.y - car.imageView.center.y) > lower)) ) {
                [self endGame];
            }
        }
    }
}

-(void) movePlayerCar {
    
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
    [self checkCollision];
}

-(void) moveSurroundingCars {
    for (Car *car in lane0) {
        [car moveDown];
        if (car.position.y > 560) {
            [lane0 removeObject:car];
            break;
        }
    }
    for (Car *car in lane1) {
        [car moveDown];
        if (car.position.y > 560) {
            [lane1 removeObject:car];
            break;
        }
    }
    for (Car *car in lane2) {
        [car moveDown];
        if (car.position.y > 560) {
            [lane2 removeObject:car];
            break;
        }
    }
    for (Car *car in lane3) {
        [car moveDown];
        if (car.position.y > 560) {
            [lane3 removeObject:car];
            break;
        }
    }
}

-(void) newGame {
    scoreNumber = 0;
    highestScore.hidden = NO;
    developerName.hidden = NO;
    tapToStart.hidden = NO;
    swipeToMove.hidden = NO;
    start = YES;
    score.text = [NSString stringWithFormat:@"Score: "];
    highestScore.text = [NSString stringWithFormat:@"High Score: %i", highScore];
    
}

-(void) scoring {
    scoreNumber++;
    score.text = [NSString stringWithFormat:@"Score: %i", scoreNumber];
}

-(void) spawnCar {
    NSLog(@"spawning car");
    Car *newCar = [[Car alloc] initRandomCar];
    if (newCar.currentLane == 0) {
        [lane0 addObject:newCar];
    } else if (newCar.currentLane == 1) {
        [lane1 addObject:newCar];
    } else if (newCar.currentLane == 2) {
        [lane2 addObject:newCar];
    } else if (newCar.currentLane == 3) {
        [lane3 addObject:newCar];
    }
    [self.view addSubview:newCar.imageView];
}
-(void) deletePlayerCar {
    [playerCar.imageView removeFromSuperview];
    playerCar.imageView = nil;
    playerCar.image = nil;
    playerCar = nil;
}
-(void) deleteAllCars {

    for (int i = 0; i < [lane0 count]; i++)
    {
        Car *cars = lane0[i];
        [cars.imageView removeFromSuperview];
        [lane0 removeObjectAtIndex:i];
        cars = nil;
    }
}

-(void) endGame {
    if (scoreNumber > highScore) {
        highScore = scoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:highScore forKey:@"High Score Saved"];
    }
    
    [timer invalidate];
    [scorer invalidate];
    [carSpawner invalidate];
    [self performSelector:@selector(newGame) withObject:nil afterDelay:2];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
        [playerCar moveLeft];

    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
        [playerCar moveRight];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (start == YES) {
        [self startGame];
    }
}

- (void)startGame {
    [self deleteAllCars];
    [self deleteAllCars];
    [self deletePlayerCar];

    playerCar = [[Car alloc] initPlayerCar];
    [self.view addSubview:playerCar.imageView];
    //playerCar = playerCar.initPlayerCar;

    start = NO;

    lane0 = [[NSMutableArray alloc] init];
    lane1 = [[NSMutableArray alloc] init];
    lane2 = [[NSMutableArray alloc] init];
    lane3 = [[NSMutableArray alloc] init];

    highestScore.hidden = YES;
    developerName.hidden = YES;
    tapToStart.hidden = YES;
    swipeToMove.hidden = YES;
    
    road9.center = CGPointMake(160, 36);
    road8.center = CGPointMake(160, 100);
    road7.center = CGPointMake(160, 164);
    road6.center = CGPointMake(160, 228);
    road5.center = CGPointMake(160, 292);
    road4.center = CGPointMake(160, 356);
    road3.center = CGPointMake(160, 420);
    road2.center = CGPointMake(160, 484);
    road1.center = CGPointMake(160, 548);

    timer = [NSTimer scheduledTimerWithTimeInterval:.03 target:self selector:@selector(movePlayerCar) userInfo:Nil repeats:YES];

    scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoring) userInfo:nil repeats:YES];

    carSpawner = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(spawnCar) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self button];
    start = YES;
    
    playerCar = [[Car alloc] initPlayerCar];
    [self.view addSubview:playerCar.imageView];
    
    self.view.userInteractionEnabled = YES;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end