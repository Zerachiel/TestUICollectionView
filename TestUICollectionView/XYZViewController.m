//
//  XYZViewController.m
//  TestUICollectionView
//
//  Created by Martijn de Milliano on 26-12-13.
//  Copyright (c) 2013 Cafellow. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalLayoutConstraint;
@property int count;
@end

@implementation XYZViewController

- (IBAction)updateButtonPressed:(id)sender
{
    self.count += 10;
    [self.collectionView reloadData];
    self.verticalLayoutConstraint.constant = self.collectionView.contentSize.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.count = 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
}

@end
