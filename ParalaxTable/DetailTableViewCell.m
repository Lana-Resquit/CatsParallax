//
//  DetailTableViewCell.m
//  ParalaxTable
//
//  Created by Kristy on 02.06.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "DetailPlaceDataController.h"
#import "DetailGalleryCollectionViewCell.h"


@interface DetailTableViewCell ()

@property (nonatomic, strong) DetailPlaceDataController *detailPlaceDataController;

@end

@implementation DetailTableViewCell


- (void)awakeFromNib {
    
    [self setupCollectionView];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView reloadData];
    
    self.detailPlaceDataController = [[DetailPlaceDataController alloc]init];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark <UICollectionViewDataSource>


-(void)setupCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.detailPlaceDataController photosCount];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   DetailGalleryCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"slideGalleryCell" forIndexPath:indexPath];
    
    [self.collectionView setNeedsUpdateConstraints];
    [self.collectionView setNeedsLayout];
    
    Photo *gallery = [self.detailPlaceDataController photoAtIndex:indexPath.row];
    cell.photoGallery.image = gallery.photo;
    NSLog(@"%@", cell);
    NSLog(@"%@", gallery.photo);
    NSLog(@"%@", cell.photoGallery.image);
    
    
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

@end
