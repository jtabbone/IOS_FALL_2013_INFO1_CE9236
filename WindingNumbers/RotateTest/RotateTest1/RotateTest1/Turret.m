//
//  Turret.m
//  BoxClass
//
//  Created by John Tabbone on 10/23/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "Turret.h"
#import <QuartzCore/QuartzCore.h>

@implementation Turret

- (void) setDegrees:(float)aDegrees
{
            _degrees = aDegrees;
        //          NSLog(@"degrees: %f",_degrees);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initTurret{
    
    int w = 80;
    int h = 80;
    CGRect frame = CGRectMake(0, 0, w,h);
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.degrees = 90;
        
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)aRect
{
    float insetX = 20;
    float insetY = 20;
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    
    CGContextBeginPath(c);

    
    CGColorRef color = [[UIColor grayColor] CGColor];
 
        //   CGRect gunRect = CGRectInset(aRect, 35, 0);
    CGRect gunRect = CGRectInset(aRect, 0, 35);
    CGContextAddRect(c, gunRect);
    CGContextAddEllipseInRect(c, CGRectInset(aRect,insetX,insetY ));
    CGContextSetFillColorWithColor(c,color);
    
    CGContextFillPath(c);
    CGContextRestoreGState(c);
}


@end
