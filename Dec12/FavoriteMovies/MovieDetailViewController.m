//
//  MovieDetailViewController.m
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieWebViewController.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UISwitch *favoriteSwitch;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.titleLabel setText:self.movieTitle];
    [self.yearLabel setText:self.year];
    [self.ratingLabel setText:self.rating];
    [self.imageView setImage:self.image];
    self.favoriteSwitch.on = self.favorite;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(UIButton *)sender {
    
}




- (IBAction)favoriteChanged:(UISwitch *)sender {
    if ( sender.on){
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"addFavorite" object:self.title];
    }
    else{
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"removeFavorite" object:self.title];
    }
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        // Assume self.view is the table view
    if ( [segue.identifier isEqualToString:@"WebViewSegue"]){
        MovieWebViewController *destVC = segue.destinationViewController;
        destVC.title = self.title;
        destVC.url = self.url;
        
    }
}
@end
