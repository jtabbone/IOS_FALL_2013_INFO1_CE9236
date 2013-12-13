//
//  ViewController.m
//  Navigate
//
//  Created by Mark Meretzky on 11/8/13.
//  Copyright (c) 2013 Mark Meretzky. All rights reserved.
//

#import "ViewController.h"
#import "NavigateAppDelegate.h"
#import "View.h"

@interface ViewController ()

@end

@implementation ViewController

/*
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}
*/

- (id) initWithTitle: (NSString *) title {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;
	}
	return self;
}

- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame controller: self];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) nextStation {
	UIApplication *application = [UIApplication sharedApplication];
	NavigateAppDelegate *applicationDelegate = application.delegate;
	[applicationDelegate nextStation];
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
