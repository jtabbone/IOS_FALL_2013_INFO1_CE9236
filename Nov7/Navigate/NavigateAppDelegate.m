//
//  NavigateAppDelegate.m
//  Navigate
//
//  Created by Mark Meretzky on 11/8/13.
//  Copyright (c) 2013 Mark Meretzky. All rights reserved.
//

#import "NavigateAppDelegate.h"
#import "ViewController.h"

@implementation NavigateAppDelegate

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	// Override point for customization after application launch.
	titles = [NSArray arrayWithObjects:
		@"8th Avenue",
		@"6th Avenue",
		@"Union Square",
		@"3rd Avenue",
		@"1st Avenue",
		nil
	];

	NSString *title = [titles objectAtIndex: 0];
	ViewController *firstController = [[ViewController alloc] initWithTitle: title];

	self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	self.window.backgroundColor = [UIColor whiteColor];

	self.window.rootViewController =
		[[UINavigationController alloc] initWithRootViewController: firstController];

	[self.window makeKeyAndVisible];
	return YES;
}

//Called when user touches a View.

- (void) nextStation {
	UINavigationController *navigationController =
		(UINavigationController *)self.window.rootViewController;

	NSUInteger i = navigationController.viewControllers.count;
	if (i < titles.count) {
		//We haven't reached the last station yet, so we can go farther.
		NSString *title = [titles objectAtIndex: i];
		ViewController *viewController = [[ViewController alloc] initWithTitle: title];
		[navigationController pushViewController: viewController animated: YES];
	}
}

- (void) applicationWillResignActive: (UIApplication *) application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void) applicationWillTerminate: (UIApplication *) application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
