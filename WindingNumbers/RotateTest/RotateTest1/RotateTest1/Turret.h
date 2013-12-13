//
//  Turret.h
//  BoxClass
//
//  Created by John Tabbone on 10/23/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Turret : UIView
-(id)initTurret;
@property (nonatomic) float degrees;
- (void) setDegrees:(float)aDegrees;
@end
