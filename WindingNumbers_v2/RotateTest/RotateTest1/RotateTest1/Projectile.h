//
//  Projectile.h
//  BoxClass
//
//  Created by John Tabbone on 10/27/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "Box.h"

@interface Projectile : UIView
@property (nonatomic) float theta;
@property (nonatomic) float slope;
-(id)initWithFrame:(CGRect) aRect Theta:(float)aTheta;
@end
