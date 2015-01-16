//
//  HUDViewController.m
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onLionButton:(UIButton *)sender
{
    [self.delegate lionsButtonTapped];
}

- (IBAction)onTigerButton:(UIButton *)sender
{
    [self.delegate tigerButtonTapped];
}

@end
