//
//  main.m
//  Oct3
//
//  Created by John Tabbone on 10/3/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RantasticAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        
        NSLog(@"Hello from NSLog.");
        UIScreen *screen = [UIScreen mainScreen];
        NSLog(@"This is the description of the screen: %@" ,[screen description]);
        
        int i=0;
        NSLog(@"This is the vlue of i before: %d" ,i);
        
        i+=(++i*2);
        NSLog(@"This is the vlue of i after: %d" ,i);
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([RantasticAppDelegate class]));
    }
}
