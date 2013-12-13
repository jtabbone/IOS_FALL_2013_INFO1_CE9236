//
//  Projectile.m
//  BoxClass
//
//  Created by John Tabbone on 10/27/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "Projectile.h"
#import "Utility.h"

@interface Projectile()

@property (nonatomic) CGColorRef color;
@end

@implementation Projectile

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.theta = 90;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


-(id)initWithFrame:(CGRect) aRect Theta:(float)aTheta
{
    self = [super initWithFrame:aRect];
    if (self) {
            // Initialization code
        self.theta = aTheta;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(CGColorRef) color
{
    if (! _color)
        {
        _color = [[UIColor blackColor] CGColor ];
        }
    return _color;
}


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)aRect
{
        // Drawing code
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    CGColorRef color = self.color;
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, aRect);
    CGContextSetFillColorWithColor(c,color);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
}


@end
