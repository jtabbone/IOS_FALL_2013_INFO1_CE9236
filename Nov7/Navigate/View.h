//
//  View.h
//  Navigate
//
//  Created by Mark Meretzky on 11/8/13.
//  Copyright (c) 2013 Mark Meretzky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface View: UITextView {
	ViewController *__weak viewController;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *__weak) c;
@end
