#import "Box.h"
#import <QuartzCore/QuartzCore.h>

@implementation Box


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UIColor *)randomUIColor
{
    
    float red = arc4random() % 100 * 0.01;
    float green = arc4random() % 100 * 0.01;
    float blue = arc4random() % 100 * 0.01;
    float alpha = arc4random() % 100 * 0.01 + .3;
    
    UIColor * color =  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return color;
}


-(id)initShape{
    
    int w = (int)(arc4random() % 50)+40;
        //    int h = (int)(arc4random() % 50);
    int h = w;
    CGRect frame = CGRectMake(0, 0, w,h);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //       self.backgroundColor = [UIColor blueColor];
        
        _deltaX = 0.2;
        _deltaY = 0.5;
        
        self.backgroundColor = [self randomUIColor];
        self.layer.cornerRadius = 10;
            //self.layer.borderColor = [[self randomUIColor] CGColor];
            //self.layer.borderWidth = 4;
        
    }
    return self;
}

@end
