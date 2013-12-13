#import <QuartzCore/QuartzCore.h>
#import "Ball.h"
#import "BBViewController.h"
#import "Utility.h"


#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
#define MAX_BALL 500
@interface BBViewController ()

@property (strong,nonatomic ) NSTimer* bgTimer;
@property (strong,nonatomic) NSMutableArray* ballArray;
@property (strong, nonatomic) CADisplayLink* displayLink;

@end

int ballCount = 0;


@implementation BBViewController



- (void)viewDidLoad
{
    
    _bgTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/2.0f
                                                target:self
                                              selector:@selector(spawnBall)
                                              userInfo:nil
                                               repeats:YES];
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.displayLink setPaused:NO];
   
    
    
}

-(void)stepWorld
{

        // move Ball Array
    for( Ball* ball in self.ballArray){
        
        ball.center =  CGPointMake( ball.center.x + ball.deltaX, ball.center.y + ball.deltaY);
        if (ball.center.x > SCREEN_WIDTH || ball.center.x <= 0) {
            ball.deltaX *= -1;
        }
        if (ball.center.y < -10 || ball.center.y > SCREEN_HEIGHT){
                // this ball hit the ground or bounced on the ceiling
                //            [self.deleteList addObject:ball];
            ball.deltaY *= -1;
        }
        
    }
 }



-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.displayLink setPaused:! self.displayLink.paused];
    if (self.bgTimer.isValid){
            [self.bgTimer invalidate];
    }
    else{
        
        _bgTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/2.0f
                                                    target:self
                                                  selector:@selector(spawnBall)
                                                  userInfo:nil
                                                   repeats:YES];
    }
    
    /*    float pauseStart = 0.0;
    float timeIntervalSinceNow = 0.0;

    if ( self.bgTimer.fireDate == INFINITY){ // resume timer
        float pauseTime = -1*[pauseStart timeIntervalSinceNow];
        [timer setFireDate:[previousFireDate initWithTimeInterval:pauseTime sinceDate:previousFireDate]]
    
        
    }
    else{
        pauseStart = [[NSDate dateWithTimeIntervalSinceNow:0] retain];
        previousFiringDate = [self.bgTimer firingDate];
        [self.bgTimer setFiringDate:INFINITY]
    }
    
        

  */  
    
}


-(void)spawnBall
{
    
    if ( ballCount < MAX_BALL){
        ballCount++;    
        Ball * ball = [[Ball alloc]initShape];
    
        int radX = (int)((int)arc4random() %(int) SCREEN_WIDTH);
        int radY = -10;
        ball.center = CGPointMake(radX, radY);
        ball.deltaY = (int) (arc4random() % 4)+1;
    
        ball.deltaX = (int) (arc4random() % 5)+1;
        ball.deltaY = (int) (arc4random() % 5)+1;
        
        [self.ballArray addObject:ball];
        [self.view addSubview:ball];
    }
}

-(NSMutableArray*) ballArray
{
    if ( !_ballArray )
        {
        _ballArray = [[NSMutableArray alloc]init];
        }
    return _ballArray;
}

-(CADisplayLink*) displayLink
{
    if ( !_displayLink)
        {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(stepWorld)];
        
        }
    return _displayLink;
}




-( NSTimer* ) bgTimer
{
    if ( !_bgTimer)
        {
        _bgTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                    target:self
                                                  selector:@selector(spawnBall)
                                                  userInfo:nil
                                                   repeats:YES];
        
        }
    return _bgTimer;
}




@end
