//
//  NavigateAppDelegate.h
//  Navigate
//
//  Created by Mark Meretzky on 11/8/13.
//  Copyright (c) 2013 Mark Meretzky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigateAppDelegate: UIResponder <UIApplicationDelegate> {
	NSArray *titles;
}

- (void) nextStation;

@property (strong, nonatomic) UIWindow *window;
@end
