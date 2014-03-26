//
//  ViewController.m
//  Car Game
//
//  Created by Eric Sutton on 3/12/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

//New line here

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)generateNewCars {
    
}

-(void) movePlayerCar
{
    [self hitCar];

    road9.center = CGPointMake(road9.center.x, road9.center.y + 10);
    road8.center = CGPointMake(road8.center.x, road8.center.y + 10);
    road7.center = CGPointMake(road7.center.x, road7.center.y + 10);
    road6.center = CGPointMake(road6.center.x, road6.center.y + 10);
    road5.center = CGPointMake(road5.center.x, road5.center.y + 10);
    road4.center = CGPointMake(road4.center.x, road4.center.y + 10);
    road3.center = CGPointMake(road3.center.x, road3.center.y + 10);
    road2.center = CGPointMake(road2.center.x, road2.center.y + 10);
    road1.center = CGPointMake(road1.center.x, road1.center.y + 10);

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
}

-(void) moveSurroundingCars
{
    
}

-(void) newGame
{
    
}

-(void) scoring
{
    scoreNumber++;
    score.text = [NSString stringWithFormat:@"Score: %i", scoreNumber];
}

-(void) hitCar
{
    
}


-(void) endGame
{
    //if (scoreNumber > highScore) {
    //    highScore = scoreNumber;
    //    [[NSUserDefaults standardUserDefaults] setInteger:highScore forKey:@"High Score Saved"];
    //}
    [timer invalidate];
    [scorer invalidate];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        // Move car left by calling function
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        // Move car right by calling function
        NSLog(@"swipeRight");
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (start == YES) {
        [self startGame];
    }
}

- (void)startGame {
    start = NO;

    lane0 = [[NSArray alloc] init];
    lane1 = [[NSArray alloc] init];
    lane2 = [[NSArray alloc] init];
    lane3 = [[NSArray alloc] init];
    
    highScore.hidden = YES;
    developerName.hidden = YES;
    tapToStart.hidden = YES;

    road9.center = CGPointMake(160, 36);
    road8.center = CGPointMake(160, 100);
    road7.center = CGPointMake(160, 164);
    road6.center = CGPointMake(160, 228);
    road5.center = CGPointMake(160, 292);
    road4.center = CGPointMake(160, 356);
    road3.center = CGPointMake(160, 420);
    road2.center = CGPointMake(160, 484);
    road1.center = CGPointMake(160, 548);

    timer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(movePlayerCar) userInfo:Nil repeats:YES];
    
    scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoring) userInfo:nil repeats:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
