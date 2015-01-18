//
//  TopViewController.h
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TopDelegate <NSObject>

- (void)topRevealButtonTapped;

@end

@interface TopViewController : UIViewController

@property (nonatomic, weak) id<TopDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *topViewControllerCollectionView;
@property NSMutableArray *photosArray;


@end
