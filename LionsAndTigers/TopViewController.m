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
@property (weak, nonatomic) IBOutlet UIImageView *openingImage;

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

    self.photosArray = [NSMutableArray new];
    self.navigationItem.title = @"Lions and Tigers";
    self.openingImage.image = [UIImage imageNamed:@"lionTiger_pic"];

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

//Pull drawer out using a right swipe
- (IBAction)onSwipeRightGesture:(UISwipeGestureRecognizer *)sender
{
    [self.delegate swipeRightGesture];
}

//Put drawer back using left swipe
- (IBAction)onSwipeLeftGesture:(UISwipeGestureRecognizer *)sender
{
    [self.delegate swipeLeftGesture];
}

//Open the menu
- (IBAction)onMenuButtonTapped:(UIBarButtonItem *)sender
{
    [self.delegate topRevealButtonTapped];
    NSLog(@"%@", self.delegate);
}


//Load lion images and change title
- (void)lionsButtonTapped
{
    //Adding lion photos and changing the title
    [self.photosArray removeAllObjects];
    [self.photosArray addObjectsFromArray:self.lionsArray];
    NSLog(@"%lu", (unsigned long)self.photosArray.count);
    NSLog(@"%@", self.photosArray);
    [self.topViewControllerCollectionView reloadData];
    [self.delegate topRevealButtonTapped];
    self.navigationItem.title = @"Lion Pics";

    self.openingImage.hidden = YES;

    //start a background sound
    NSString *soundFilePath = @"/Users/evanvandenberg/Desktop/Mobile Makers/Week2/WeekendChallenge/LionsAndTigers/lionRoar.mp3";
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item1 = [AVPlayerItem playerItemWithURL:fileURL];
    self.myAudioPlayer = [[AVQueuePlayer alloc] initWithPlayerItem:item1];
    [self.myAudioPlayer play];
    
}


- (void)tigerButtonTapped
{
    //adding tiger photos and changing titles
    [self.photosArray removeAllObjects];
    [self.photosArray addObjectsFromArray:self.tigersArray];
    [self.topViewControllerCollectionView reloadData];
    [self.delegate topRevealButtonTapped];
    self.navigationItem.title = @"Tiger Pics";

    self.openingImage.hidden = YES;

    //start a background sound
    NSString *soundFilePath = @"/Users/evanvandenberg/Desktop/Mobile Makers/Week2/WeekendChallenge/LionsAndTigers/tigerGrowl.mp3";
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item1 = [AVPlayerItem playerItemWithURL:fileURL];
    self.myAudioPlayer = [[AVQueuePlayer alloc] initWithPlayerItem:item1];
    [self.myAudioPlayer play];



}





@end
