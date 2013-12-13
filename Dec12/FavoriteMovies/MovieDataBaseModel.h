//
//  MovieDataBaseModel.h
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDataBaseModel : NSObject

+(MovieDataBaseModel*) getInstance;

@property (strong, nonatomic) NSArray* movieArray;
@property (strong, nonatomic) NSMutableArray* favoritesArray;

-(void) addFavoriteMovie:(NSString*) aTitle;
-(void) removeFavoriteMovie:(NSString*) aTitle;

@end
