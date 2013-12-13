#import "Ball.h"
#import "Utility.h"

@interface Ball()



@end

@implementation Ball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initShape{
    
    int w = 40;
    int h = w;
    CGRect frame = CGRectMake(0, 0, w,h);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.deltaX = 0.0;
        self.deltaY = 2.0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


-(CGColorRef) color
{
    if (! _color)
        {
            _color = [[Utility randomColor] CGColor ];
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
