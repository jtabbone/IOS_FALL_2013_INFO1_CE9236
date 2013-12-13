//
//  ViewController.m
//  Oct31
//
//  Created by John Tabbone on 10/30/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonUp:(UIButton *)sender {
    
    UIImage * toImage = [UIImage imageNamed:@"ursulla.jpg"];
    [UIView transitionWithView:self.imageView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        self.imageView.image = toImage;
                    } completion:nil];
}

@end
