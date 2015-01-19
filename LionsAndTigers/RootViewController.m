//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "TopViewController.h"
#import "HUDViewController.h"
#import "RootViewController.h"
#import "CustomCollectionViewCell.h"

@interface RootViewController () <TopDelegate>

@property (nonatomic, weak) TopViewController *myTopViewDelegate;
@property (nonatomic, weak) HUDViewController *myHUDViewController;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewLeftHorizontalContstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewRightHorizontalConstraint;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myHUDViewController.delegate = self.myTopViewDelegate;
}

- (void)swipeRightGesture
{
    self.topViewLeftHorizontalContstraint.constant = 100;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (void)swipeLeftGesture;
{
    self.topViewLeftHorizontalContstraint.constant = 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}


//Moves topview left constraint 100 points to the right
- (void)topRevealButtonTapped
{
    if (self.topViewLeftHorizontalContstraint.constant == 0)
    {
        NSLog(@"Delegate Called");
        self.topViewLeftHorizontalContstraint.constant = 100;
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
        return;
    }

    if (self.topViewLeftHorizontalContstraint.constant == 100)
    {
        self.topViewLeftHorizontalContstraint.constant = 0;
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
        return;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToNav"])
    {
        NSLog(@"lol lol");
        UINavigationController *navVC = segue.destinationViewController;
        self.myTopViewDelegate = [navVC.viewControllers objectAtIndex:0];
        NSLog(@"%@", navVC.viewControllers);
        self.myTopViewDelegate.delegate = self;
    }

    else if ([segue.identifier isEqualToString:@"segueToHUD"])
    {
        self.myHUDViewController = segue.destinationViewController;
    }
}




@end
