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

@interface RootViewController () <TopDelegate, HUDDelegate>

@property (nonatomic, weak) TopViewController *myTopViewDelegate;
@property (nonatomic, weak) HUDViewController *myHUDViewDelegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewLeftHorizontalContstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewRightHorizontalConstraint;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

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



- (void)lionsButtonTapped
{

}

- (void)tigerButtonTapped
{

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToNav"])
    {
        NSLog(@"lol lol");
        UINavigationController *navVC = segue.destinationViewController;
        TopViewController *topViewVC = [navVC.viewControllers objectAtIndex:0];
        NSLog(@"%@", navVC.viewControllers);
        topViewVC.delegate = self;
    }

    if ([segue.identifier isEqualToString:@"segueToHUD"])
    {
        HUDViewController *hudVC = segue.destinationViewController;
        hudVC.delegate = self;
    }


}




@end
