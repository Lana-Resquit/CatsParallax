//
//  DetailViewController.m
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailGalleryCellCollectionViewCell.h"
#import "DetailPlaceDataController.h"
#import "Photo.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) DetailPlaceDataController *detailPlaceDataController;


@end

@implementation DetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    if (self.detailItem) {
        
        self.detailSummary.text = self.detailItem.summary;
        self.navItem.title = self.detailItem.title;
        
    
        
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.detailPlaceDataController = [[DetailPlaceDataController alloc]init];
    [self.collectionView reloadData];
    
    [self setupCollectionView];
   
}

-(void)setupCollectionView {
   // [self.collectionView registerClass:[DetailGalleryCellCollectionViewCell class] forCellWithReuseIdentifier:@"slideGalleryCell"];
//    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    [flowLayout setItemSize:CGSizeMake(400, 175)];
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
    DetailGalleryCellCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"slideGalleryCell" forIndexPath:indexPath];
    
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
    
    Photo *gallery = [self.detailPlaceDataController photoAtIndex:indexPath.row];
    cell.imageView.image = gallery.photo;
    NSLog(@"%@", cell);
    NSLog(@"%@", gallery.photo);
    NSLog(@"%@", cell.imageView.image);
    
    
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
