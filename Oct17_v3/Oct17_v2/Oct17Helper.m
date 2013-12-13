//
//  Oct17Helper.m
//  Oct17
//
//  Created by John Tabbone on 10/17/13.
//  Copyright (c) 2013 John V. Tabbone, Inc. All rights reserved.
//

#import "Oct17Helper.h"

@implementation Oct17Helper


+(UIColor *)randomUIColor
{
    
    float red = arc4random() % 100 * 0.01;
    float green = arc4random() % 100 * 0.01;
    float blue = arc4random() % 100 * 0.01;
    float alpha = arc4random() % 100 * 0.01;
    
    UIColor * color =  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return color;
}

+(UIColor *)randomUIColorNoAlpha
{
    
    float red = arc4random() % 100 * 0.01;
    float green = arc4random() % 100 * 0.01;
    float blue = arc4random() % 100 * 0.01;
    
    UIColor * color =  [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    return color;
}




+(UIView *) makeBox
{
    UIView* box = [[UIView alloc]initWithFrame:CGRectMake(0,0,60,60)];
    box.backgroundColor = [Oct17Helper randomUIColor];
    box.layer.cornerRadius = 10;
    box.layer.shadowOpacity = 1;
    box.layer.shadowOffset = CGSizeMake(5,5);
    box.layer.shadowRadius = 20;
    box.layer.borderColor = [[Oct17Helper randomUIColor] CGColor];
    box.layer.borderWidth = 4;
    
    
    return box;
}

+(void) tinyCircleAt:(CGFloat)x y:(CGFloat)y
{
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c); 
    
    CGRect r = CGRectMake(x,y,10,10);
    CGColorRef color = [[Oct17Helper randomUIColor] CGColor ];    
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, r);
    CGContextSetFillColorWithColor(c,color);
        CGContextSetShadow(c, CGSizeMake(10, -20), 5);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
}

+(void) circleIn:(CGRect)aRect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c); 
    CGColorRef color = [[Oct17Helper randomUIColorNoAlpha] CGColor ];
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, aRect);
    CGContextSetFillColorWithColor(c,color);
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
}

+(void) rectIn: (CGRect) aRect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    CGColorRef color = [[Oct17Helper randomUIColorNoAlpha] CGColor ];
    CGContextBeginPath(c);
    CGContextAddRect(c, aRect);
    CGContextSetFillColorWithColor(c,color);
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
    /*
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    CGSize size = aRect.size;
    CGFloat min = MIN(size.width, size.height);
    CGFloat longSide = min * 15 / 16;
    CGFloat shortSide = longSide / 3;
        
              CGContextBeginPath(c);
        
                CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
        //    CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
              CGContextRotateCTM(c, 65 * M_PI / 180);	
        CGRect horizontal = CGRectMake(aRect.origin.x, aRect.origin.y, longSide, shortSide);

        CGContextRotateCTM(c, 65 * M_PI / 180);	
        CGContextAddRect(c, horizontal);
        
        CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
        CGContextFillPath(c);
        CGContextRestoreGState(c);
     */
    }
    


@end
