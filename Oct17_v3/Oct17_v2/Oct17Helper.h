//
//  Oct17Helper.h
//  Oct17
//
//  Created by John Tabbone on 10/17/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Oct17Helper : NSObject

+(void) tinyCircleAt:(CGFloat)x y:(CGFloat)y;
+(UIColor *)randomUIColor;
+(UIView *) makeBox;
+(void) circleIn:(CGRect)aRect;
+(void) rectIn: (CGRect) aRect;

@end
