//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)onMenuButtonTapped:(UIBarButtonItem *)sender
{
    [self.delegate topRevealButtonTapped];
}


@end
