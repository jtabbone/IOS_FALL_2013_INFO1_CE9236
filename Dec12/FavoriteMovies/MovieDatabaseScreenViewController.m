//
//  MovieDetailsViewController.m
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "MovieDatabaseScreenViewController.h"
#import "MovieDetailViewController.h"
#import "MovieDataBaseModel.h"

@interface MovieDatabaseScreenViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *movieTable;
@property (strong, nonatomic) NSArray* movieData;

@end

@implementation MovieDatabaseScreenViewController


/** ----- MovieDataController methods */

- (NSArray* ) movieData
{
    if ( ! _movieData ){
        _movieData = [MovieDataBaseModel getInstance].movieArray;
    }
    return _movieData;
}

/** ----- NSView methods */
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
    self.movieTable.dataSource = self;
        //    self.movieTable.delegate = self;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** ------- UITableDataSource methods */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        // Return the number of rows in the section.
        // If you're serving data from an array, return the length of the array
    return [self.movieData count];
}

    // Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MovieDBCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
        // Set the data for this cell:
    
    NSMutableDictionary* d = (NSMutableDictionary*)[self.movieData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [d objectForKey:@"NAME"];
    cell.detailTextLabel.text = [d objectForKey:@"VAL"];
    cell.imageView.image = (UIImage*) [d objectForKey:@"IMG"];
                                       
        // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/** --- UITableView delegate methods */
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;

}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"MovieDetailSegue"]){
            NSIndexPath *indexPath = [self.movieTable indexPathForSelectedRow];
            NSMutableDictionary* d = (NSMutableDictionary*)[self.movieData  objectAtIndex:indexPath.row];

            MovieDetailViewController *destVC = segue.destinationViewController;
            destVC.title = [d objectForKey:@"NAME"];
            destVC.rating = [d objectForKey:@"RATING"];
            destVC.year = [d objectForKey:@"YEAR"];
            destVC.url = (NSURL*)[d objectForKey:@"URL"];
            destVC.image = (UIImage*)[d objectForKey:@"IMG"];
            destVC.favorite = [((NSNumber*)[d objectForKey:@"FAVORITE"]) boolValue ];
    }
}

@end
