//
//  HUDViewController.h
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HUDDelegate <NSObject>


- (void)lionsButtonTapped;
- (void)tigerButtonTapped;

@end

@interface HUDViewController : UIViewController

@property (nonatomic, weak) id<HUDDelegate> delegate;






@end
