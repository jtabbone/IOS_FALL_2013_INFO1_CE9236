//
//  MovieDetailViewController.h
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController

@property (strong,nonatomic) NSString* movieTitle;
@property (strong,nonatomic) NSString* year;
@property (strong,nonatomic) NSString* rating;
@property (strong,nonatomic) NSURL* url;
@property (strong, nonatomic) UIImage* image;
@property (nonatomic) BOOL favorite;

@end
