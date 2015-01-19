//
//  TopViewController.h
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol TopDelegate <NSObject>

- (void)topRevealButtonTapped;
- (void)swipeRightGesture;
- (void)swipeLeftGesture;

@end

@interface TopViewController : UIViewController

@property (nonatomic, weak) id<TopDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *topViewControllerCollectionView;
@property NSMutableArray *photosArray;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeft;

@property AVQueuePlayer *myAudioPlayer;

@end
