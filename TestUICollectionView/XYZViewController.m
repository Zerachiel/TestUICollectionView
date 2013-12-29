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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstraint;

@end

@implementation XYZViewController

- (IBAction)updateButtonPressed:(id)sender
{
    NSLog(@"before: bounds = %@, contentSize = %@", NSStringFromCGRect(self.collectionView.bounds), NSStringFromCGSize(self.collectionView.contentSize));
    self.collectionView.contentSize = CGSizeMake(300, 2000);
    self.verticalConstraint.constant = self.collectionView.contentSize.height;
    self.collectionView.bounds = CGRectMake(0, 0, 300, 2000);
    [self.collectionView.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger index, BOOL *stop) {
        NSLog(@"constraint: %@", constraint);
    }];
    NSLog(@"update button pressed");
    NSLog(@"after: bounds = %@, contentSize = %@", NSStringFromCGRect(self.collectionView.bounds), NSStringFromCGSize(self.collectionView.contentSize));

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.collectionView.autoresizingMask = UIViewAutoresizingNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
}

@end
