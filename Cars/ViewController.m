//
//  ViewController.m
//  Car Game
//
//  Created by Eric Sutton on 3/12/14.
//  Copyright (c) 2014 Eric Sutton. All rights reserved.
//

//New line here

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)generateNewCars {
//    NSArray *myImageNames = [NSArray arrayWithObjects:@"Blue Car.png", @"Orange Car.png", @"Green  Car.png", @"Pink Car.png", @"Yellow Car.png", @"Red Car.png", nil];
//    int index = arc4random() % [myImageNames count];
//    
//    UIImage *myImage = [UIImage imageNamed:[myImageNames objectAtIndex:index]];
//    leftLaneCar1.image = myImage;
//    leftLaneCar2.image = myImage;
//    leftLaneCar3.image = myImage;
}

-(void) movePlayerCar
{
    [self hitCar];
    
    //playersCar.center = CGPointMake(playersCar.center.x, playersCar.center.y + y);
    
    road9.center = CGPointMake(road9.center.x, road9.center.y + 10);
    road8.center = CGPointMake(road8.center.x, road8.center.y + 10);
    road7.center = CGPointMake(road7.center.x, road7.center.y + 10);
    road6.center = CGPointMake(road6.center.x, road6.center.y + 10);
    road5.center = CGPointMake(road5.center.x, road5.center.y + 10);
    road4.center = CGPointMake(road4.center.x, road4.center.y + 10);
    road3.center = CGPointMake(road3.center.x, road3.center.y + 10);
    road2.center = CGPointMake(road2.center.x, road2.center.y + 10);
    road1.center = CGPointMake(road1.center.x, road1.center.y + 10);
    //[playerCar drawAtPoint:CGPointMake(199, 448)];

//    leftLaneCar1.center = CGPointMake(leftLaneCar1.center.x, leftLaneCar1.center.y + 10);
//    leftLaneCar2.center = CGPointMake(leftLaneCar2.center.x, leftLaneCar2.center.y + 10);
//    leftLaneCar3.center = CGPointMake(leftLaneCar3.center.x, leftLaneCar3.center.y + 10);

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
    playersCar.hidden = YES;
    [timer invalidate];
    [scorer invalidate];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (start == YES) {
        highScore.hidden = YES;
        developerName.hidden = YES;
        tapToStart.hidden = YES;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(movePlayerCar) userInfo:Nil repeats:YES];
    
        scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoring) userInfo:nil repeats:YES];
    
        start = NO;
        
        playersCar.hidden = NO;
        
        road9.center = CGPointMake(160, 36);
        road8.center = CGPointMake(160, 100);
        road7.center = CGPointMake(160, 164);
        road6.center = CGPointMake(160, 228);
        road5.center = CGPointMake(160, 292);
        road4.center = CGPointMake(160, 356);
        road3.center = CGPointMake(160, 420);
        road2.center = CGPointMake(160, 484);
        road1.center = CGPointMake(160, 548);
        
        playersCar.center = CGPointMake(199, 448);
        
        playerCar = [UIImage imageWithContentsOfFile:@"BlueCar"];
        [playerCar drawAtPoint:CGPointMake(199, 448)];

//        leftLaneCar1.center = CGPointMake(39, -30);
//        leftLaneCar2.center = CGPointMake(39, -100);
//        leftLaneCar3.center = CGPointMake(39, -150);
//        
//        centerLeftLaneCar1.center = CGPointMake(121, 30);
//        centerLeftLaneCar2.center = CGPointMake(121, 100);
//        centerLeftLaneCar3.center = CGPointMake(121, 150);
//        
//        centerRightLaneCar1.center = CGPointMake(199, -30);
//        centerRightLaneCar2.center = CGPointMake(199, -100);
//        centerRightLaneCar3.center = CGPointMake(199, -150);
//        
//        leftLaneCar1.center = CGPointMake(277, -30);
//        leftLaneCar2.center = CGPointMake(277, -100);
//        leftLaneCar3.center = CGPointMake(277, -150);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    start = YES;
    playersCar.hidden = NO;
    playerCar = [UIImage imageWithContentsOfFile:@"BlueCar"];
    [playerCar drawAtPoint:CGPointMake(199, 448)];
    
    //highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"High Score Saved"];
    //intro3.text = [NSString stringWithFormat:@"High Score: %i", highScore];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
