//
//  FavoritesViewController.m
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "FavoritesViewController.h"
#import "MovieDataBaseModel.h"

@interface FavoritesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray* favoriteArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation FavoritesViewController


-(NSMutableArray*) favoriteArray
{
    return [MovieDataBaseModel getInstance].favoritesArray;
}

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
    self.tableView.dataSource = self;
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        // Return the number of rows in the section.
        // If you're serving data from an array, return the length of the array
    return [self.favoriteArray count];
}

    // Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"FavoriteMovieCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
        // Set the data for this cell:
    
    NSMutableDictionary* d = (NSMutableDictionary*)[self.favoriteArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [d objectForKey:@"NAME"];
        //  cell.detailTextLabel.text = [d objectForKey:@"VAL"];
    cell.imageView.image = (UIImage*) [d objectForKey:@"IMG"];
    
        // set the accessory view:
    
    return cell;
}


@end
