

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect)rect
{
	// Drawing code
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
    
    UIDevice *device = [UIDevice currentDevice];
	NSString *deviceName= [NSString stringWithFormat:@"%@: %@",@"MODEL",device.model];
	NSString *idName = [NSString stringWithFormat:@"%@: %@",@"DEVICE ID",[device.identifierForVendor UUIDString]];
	NSString *sysName = [NSString stringWithFormat:@"%@: %@",@"SYS NAME",device.systemName];
	NSString *sysVersionName = [NSString stringWithFormat:@"%@: %@",@"SYS VERISON",device.systemVersion];
    
    font = [UIFont systemFontOfSize: 12.0];
	[deviceName drawAtPoint: CGPointMake(0.0, 200.0) withFont: font];
    [idName drawAtPoint: CGPointMake(0.0, 220.0) withFont: font];
    [sysName drawAtPoint: CGPointMake(0.0, 240.0) withFont: font];
    [sysVersionName drawAtPoint: CGPointMake(0.0, 260.0) withFont: font];
    
    NSURL *url = [[NSURL alloc] initWithString:
                  @"http://finance.yahoo.com/d/quotes.csv?s=AAPL&f=sl1t1"];
    
	NSError *error;
    NSString *quote = [[NSString alloc]
                        initWithContentsOfURL: url
                        encoding: NSUTF8StringEncoding
                        error: &error
                        ];
       
	if (quote == nil) {
		quote = [error localizedDescription];
	}
    
    NSString *displayQuote = [NSString stringWithFormat:@"%@ %@",@"AAPL: ",quote];

    font = [UIFont systemFontOfSize: 14.0];
	[displayQuote drawAtPoint: CGPointMake(0.0, 310.0) withFont: font];
    
}

@end
