//
//  AppDelegate.m
//  Oct31
//
//  Created by John Tabbone on 10/30/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"could not get the main bundle");
		return YES;
	}
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);
    
        //The path is the filename.
	NSString *path =
    [bundle pathForResource: @"SecretAgentMan" ofType: @"mp3"];
	if (path == nil) {
		NSLog(@"could not find the path");
		return YES;
	}
	NSLog(@"path == \"%@\"", path);
    
	NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
    
	NSError *error = nil;
	player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
	if (player == nil) {
		NSLog(@"error == %@", error);
		return YES;
	}
    
	player.volume = 1.0;		//the default
	player.numberOfLoops = 0;	//negative number for infinite loop
	NSLog(@"player.numberOfChannels == %lu",
          (unsigned long)player.numberOfChannels); //mono or stereo
    
	if (![player prepareToPlay]) {	//! means "not"
		NSLog(@"could not prepare to play");
		return YES;
	}
    
	if (![player play]) {
		NSLog(@"could not play");
	}
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
