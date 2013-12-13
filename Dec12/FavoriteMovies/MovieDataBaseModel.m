//
//  MovieDataBaseModel.m
//  FavoriteMovies
//
//  Created by John Tabbone on 11/12/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "MovieDataBaseModel.h"

@interface MovieDataBaseModel()  

@property (strong, nonatomic) NSMutableArray* dataArray;

@end


@implementation MovieDataBaseModel

static MovieDataBaseModel* model = nil;

+(MovieDataBaseModel*) getInstance
{
    if ( !model){
        model = [[[self class]alloc]init];
    }
    return model;
}



- (id) init {
    if ( self=[super init]){
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveNotify:)
                                                     name:@"addFavorite"
                                                   object:nil ];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveNotify:)
                                                     name:@"removeFavorite"
                                                   object:nil ];
        
    }
    return self;
}


-(NSMutableArray*) getDataArray
{
    if ( !_dataArray){
        _dataArray = [[NSMutableArray alloc] init];
        NSMutableDictionary* d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla" forKey:@"NAME"];
        [d setObject:@"7.3" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1954] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0047034/?ref_=nv_sr_3"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla1.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];

         d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla Raids Again" forKey:@"NAME"];
        [d setObject:@"6.0" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1955] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0048127/?ref_=fn_al_tt_9"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla2.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla vs. Gigan" forKey:@"NAME"];
        [d setObject:@"5.4" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1972] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0068371/?ref_=fn_al_tt_4"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla3.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla vs. Mechagodzilla" forKey:@"NAME"];
        [d setObject:@"6.0" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1972] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0071565/?ref_=fn_al_tt_6"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla4.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla vs. the Sea Monster" forKey:@"NAME"];
        [d setObject:@"4.6" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1966] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0060464/?ref_=fn_tt_tt_12"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla5.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];

        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla, King of the Monsters" forKey:@"NAME"];
        [d setObject:@"6.6" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1956] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0197521/?ref_=fn_tt_tt_15"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla6.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Godzilla vs. The Smog Monster" forKey:@"NAME"];
        [d setObject:@"5.6" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1971] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0067148/?ref_=fn_tt_tt_18"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla7.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Mothra vs. Godzilla" forKey:@"NAME"];
        [d setObject:@"6.3" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1964] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0058379/?ref_=fn_tt_tt_23"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla8.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];

        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Mothra vs. Godzilla" forKey:@"NAME"];
        [d setObject:@"6.3" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1964] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0058379/?ref_=fn_tt_tt_23"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla9.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        d = [[NSMutableDictionary alloc]init];
        [d setObject:@"Son of Godzilla" forKey:@"NAME"];
        [d setObject:@"5.0" forKey:@"RATING"];
        [d setObject:[NSString stringWithFormat:@"%d",1967] forKey:@"YEAR"];
        [d setObject:[NSURL URLWithString:@"http://www.imdb.com/title/tt0061856/?ref_=fn_tt_tt_11"] forKey:@"URL"];
        [d setObject:[UIImage imageNamed:@"godzilla10.jpg"] forKey:@"IMG"];
        [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
        [_dataArray addObject:d];
        
        
    }
    return _dataArray;
}


-(NSArray* ) movieArray
{
    if ( !_movieArray){
        _movieArray = [[NSArray alloc]initWithArray:[self getDataArray]];
    }
    return _movieArray;
}

-(NSMutableArray* ) favoritesArray
{
    if ( ! _favoritesArray){
        _favoritesArray = [[NSMutableArray alloc]init] ;
    }
    return _favoritesArray;
}

-(void) addFavoriteMovie:(NSString*) aTitle
{
    for ( NSMutableDictionary* d in self.movieArray){
        if ([aTitle isEqualToString:[d objectForKey:@"NAME"]]) {
             [d setObject:[NSNumber numberWithBool:YES] forKey:@"FAVORITE"];
            [self.favoritesArray addObject:d];
        }
    }
}

-(void) removeFavoriteMovie:(NSString*) aTitle{
    for ( NSMutableDictionary* d in self.movieArray){
        if ([aTitle isEqualToString:[d objectForKey:@"NAME"]]) {
            [d setObject:[NSNumber numberWithBool:NO] forKey:@"FAVORITE"];
            [self.favoritesArray removeObject:d];
        }
    }
    
}

-(void) didReceiveNotify:( NSNotification*) aNotification
{
    if ( [[aNotification name] isEqualToString:@"addFavorite"]){
        NSString* title = [aNotification object];
        [self addFavoriteMovie:title];
    }
    if ( [[aNotification name] isEqualToString:@"removeFavorite"]){
        NSString* title = [aNotification object];
        [self removeFavoriteMovie:title];
    }
    
}

@end
