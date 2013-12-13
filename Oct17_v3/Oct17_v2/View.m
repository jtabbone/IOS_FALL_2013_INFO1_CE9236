

#import "View.h"
#import "Oct17Helper.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
    CGRect bounds = self.bounds;
    int width = bounds.size.width;
    int height = bounds.size.height;
    
    for (int i = 0; i < 100; i++)
    {
        
        CGFloat x = arc4random() % width;
        CGFloat y = arc4random() % height;

        [Oct17Helper tinyCircleAt:x y:y];
 
        UIView *backRec = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        backRec.backgroundColor = [Oct17Helper randomUIColor];
        backRec.center = CGPointMake(arc4random() % width, arc4random() % height);
        [self addSubview:backRec];
    
    }
    
    
    	// Text
    CGContextRef cgContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(cgContext, 1, 1, 1, 1) ;
    CGContextSetRGBFillColor(cgContext,0,0,0,1);
    
	NSString *string = @"한국어";
	CGPoint point = CGPointMake(0.0, 0.0);
	UIFont *font = [UIFont systemFontOfSize: 32.0];
	[string drawAtPoint: point withFont: font];
    
    string = @"عربي/عربى";
	point = CGPointMake(0.0, 40.0);
	[string drawAtPoint: point withFont: font];
    
    string = @"יהודית";
	point = CGPointMake(0.0, 80.0);
	[string drawAtPoint: point withFont: font];
    
    string = @"ελληνική γλώσσα";
	point = CGPointMake(0.0, 120.0);
	[string drawAtPoint: point withFont: font];

    font = [UIFont systemFontOfSize: 18.0];
    
    NSString *localizedString = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint:");
    string = [NSString stringWithFormat:@"%@ %@",@"Localized Text:", localizedString];
	point = CGPointMake(0.0, 160.0);
	[string drawAtPoint: point withFont: font];
    

    UIDevice *device = [UIDevice currentDevice];
	NSString *deviceName= [NSString stringWithFormat:@"%@: %@",@"MODEL",device.model];
	NSString *idName = [NSString stringWithFormat:@"%@: %@",@"DEVICE ID",[device.identifierForVendor UUIDString]];
	NSString *sysName = [NSString stringWithFormat:@"%@: %@",@"SYS NAME",device.systemName];
	NSString *sysVersionName = [NSString stringWithFormat:@"%@: %@",@"SYS VERISON",device.systemVersion];
    
    font = [UIFont systemFontOfSize: 12.0];
	[deviceName drawAtPoint: CGPointMake(0.0, 205.0) withFont: font];
    [idName drawAtPoint: CGPointMake(0.0, 225.0) withFont: font];
    [sysName drawAtPoint: CGPointMake(0.0, 245.0) withFont: font];
    [sysVersionName drawAtPoint: CGPointMake(0.0, 265.0) withFont: font];
    
    
    CGRect r = CGRectMake( 10,height*2/3,width/3,width/3);
    [Oct17Helper circleIn:r];
    
    r = CGRectMake( width/2,height*2/3,width/3,width/3);
    [Oct17Helper rectIn:r];

    
	// Put in shapes
	//in pixels

	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  bounds.origin.x and bounds.origin.y are the coordinates of
	 the upper left corner of the View.
	*/
/*
 CGRect r = CGRectMake(
		bounds.origin.x,
		bounds.origin.y,
		2 * radius,
		2 * radius
	);

	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);	//unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
	CGContextFillPath(c);
*/ 
 }

@end
