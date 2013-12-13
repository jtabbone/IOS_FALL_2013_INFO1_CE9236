//
//  ViewController.m
//  RotateTest1
//
//  Created by John Tabbone on 10/25/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Box.h"
#import "Turret.h"
#import "Projectile.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface ViewController ()
@property float currentTheta;
@property (weak, nonatomic) IBOutlet UILabel *currntLabel;
@property (weak, nonatomic) IBOutlet UILabel *thetaLabel;
@property float theta;
@property (strong,nonatomic) Box* box;
@property (strong, nonatomic) Turret* turret;
@property (strong, nonatomic) Turret* topTurret;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
            _box = [[Box alloc] initWithFrame:CGRectMake(120,80,90,60)];
    [self.view addSubview:self.box];
    _turret = [[Turret alloc]initTurret];
    _turret.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT);
    [self.view addSubview:self.turret];
    
    _topTurret = [[Turret alloc]initTurret];
    _topTurret.center = CGPointMake(SCREEN_WIDTH/2, 0);
    [self.view addSubview:self.topTurret];
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sliderSlide:(UISlider *)sender
{
        //   NSLog(@"%f",sender.value);
    float theta = 180*sender.value;
    [self rotateTurret:theta];

}
- (IBAction)southFirePressed:(id)sender
{
    float theta =  180 - [self.currntLabel.text floatValue ];
    float m = tanf(theta * M_PI/180);
    Projectile* p = [[Projectile alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT, 10, 10) Theta:theta];
    p.center = CGPointMake(SCREEN_WIDTH/2,SCREEN_HEIGHT);
    [self.view addSubview:p];
    float dx = 100;
    if ( m < 0)
        dx = -100;
    
    float x = SCREEN_WIDTH/2+dx;
    float y = SCREEN_HEIGHT - m*( x - SCREEN_WIDTH/2)+0;
    NSLog(@"X: %f Y: %f M: %f",x,y,tanf(theta * M_PI/180));
    
    [UIView animateWithDuration:.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         p.center = CGPointMake(x,y);
                     }
                     completion:^(BOOL finished) {}];

}

- (IBAction)firePressed:(UIButton *)sender
{
    float theta =  [self.currntLabel.text floatValue ];
    float m = tanf(theta * M_PI/180);
    Projectile* p = [[Projectile alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, 10, 10) Theta:theta];
    p.center = CGPointMake(SCREEN_WIDTH/2,0);
    [self.view addSubview:p];
    float dx = 100;
    if ( m < 0)
        dx = -100;

    float x = SCREEN_WIDTH/2+dx;
    float y = m*( x - SCREEN_WIDTH/2)+0;
    NSLog(@"X: %f Y: %f M: %f",x,y,tanf(theta * M_PI/180));

        [UIView animateWithDuration:.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             p.center = CGPointMake(x,y);
                         }
                         completion:^(BOOL finished) {}];
          
    
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self southFirePressed:event] ;
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    float theta =   (p.x/SCREEN_WIDTH) * 180 ;
    [self rotateTurret:theta];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    float theta =   (p.x/SCREEN_WIDTH) * 180;
    [self rotateTurret:theta];
}

-(void) rotateTurret:(float)aTheta
{
    self.currntLabel.text = [NSString stringWithFormat:@"%f",aTheta];
    [UIView beginAnimations:nil context:NULL];
    self.turret.transform = CGAffineTransformMakeRotation( aTheta * M_PI/180);
     _box.transform = CGAffineTransformMakeRotation( aTheta * M_PI/180);
        self.topTurret.transform = CGAffineTransformMakeRotation( aTheta * M_PI/180);
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
