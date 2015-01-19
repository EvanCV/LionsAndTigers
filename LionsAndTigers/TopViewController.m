//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Evan Vandenberg on 1/15/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "TopViewController.h"
#import "CustomCollectionViewCell.h"
#import "HUDViewController.h"

@interface TopViewController () <UICollectionViewDataSource, UICollectionViewDelegate, HUDDelegate>

@property (nonatomic, weak) HUDViewController *myHUDViewDelegate;
@property NSMutableArray *lionsArray;
@property NSMutableArray *tigersArray;

@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lionsArray = [[NSMutableArray alloc]initWithObjects:
                       [UIImage imageNamed:@"lion_1.jpeg"],
                       [UIImage imageNamed:@"lion_2.jpeg"],
                       [UIImage imageNamed:@"lion_3.jpeg"],
                       nil];

    self.tigersArray = [[NSMutableArray alloc]initWithObjects:
                        [UIImage imageNamed:@"tiger_1.jpeg"],
                        [UIImage imageNamed:@"tiger_2.jpeg"],
                        [UIImage imageNamed:@"tiger_3.jpeg"],
                        nil];

    self.photosArray = [[NSMutableArray alloc]initWithArray:self.lionsArray ];

    NSLog(@"%lu",(unsigned long)self.lionsArray.count);

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    cell.imageView.image = [self.photosArray objectAtIndex:indexPath.row];

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosArray.count;
}


- (IBAction)onMenuButtonTapped:(UIBarButtonItem *)sender
{
    [self.delegate topRevealButtonTapped];
    NSLog(@"%@", self.delegate);
}


- (void)lionsButtonTapped
{
    [self.photosArray removeAllObjects];
    [self.photosArray addObjectsFromArray:self.lionsArray];
    NSLog(@"%lu", (unsigned long)self.photosArray.count);
    NSLog(@"%@", self.photosArray);
    [self.topViewControllerCollectionView reloadData];
    [self.delegate topRevealButtonTapped];
    
}


- (void)tigerButtonTapped
{
    [self.photosArray removeAllObjects];
    [self.photosArray addObjectsFromArray:self.tigersArray];
    [self.topViewControllerCollectionView reloadData];
    [self.delegate topRevealButtonTapped];


}





@end
