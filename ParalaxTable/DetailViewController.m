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
@property (weak, nonatomic) IBOutlet UITextView *detailDescrition;


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
    
    self.detailDescrition.editable = NO;
    self.detailDescrition.text = @"Этот цветок имеет волшебную притягательность и необыкновенную красоту, которая испокон веков привлекала к себе огромное внимание людей. Многие из них сочинили большое количество сказок и легенд о прекрасной розе, так как она пользовалась большой популярностью и любовью у всех народов мира.Орхидеи похожи на произведения искусства, радуют и обогащают нас своей красотой. И формы этих цветов самые изысканные. Они напоминают то птиц, то бабочек, то ящериц, то лебедей. Тонкие ароматы этих цветов кружат голову. Пожалуй, орхидеи - одно из самых совершенных творений природы, и недаром многие называют их аристократами среди растений.Собирать ромашку следует только в сухую погоду, в ранние утренние часы, когда в клетках всех растений активизируются процессы фотосинтеза и происходит повышенная выработка витаминов и других полезных веществ. В случае выпадения обильной утренней росы сбор ромашки производить не следует – лучше выбрать для этого сухое и теплое утро.Пион относится к классу многолетних растений и может быть травянистым, полукустарниковым либо кустарниковым. Данное растение может иметь несколько стеблей, высота которых редко превышает отметку в 1 м.По описанию - на букетные хризантемы, множество соцветий похожи на плотные шаровидные шапки незагнутых цветков. Самые поздние из всех моих хризантем и самые капризные. Цветение начинается только в конце сентября - начале октября, самый пик цветения - конец октября.Многолетнее красивоцветущее травянистое растение семейства сложноцветных или астровых (Asteraceae). В открытом грунте произрастает только в районах с очень теплым климатом, поэтому используется в первую очередь как оранжерейная (на срезку) или комнатная культура.Значение цветка варьируется и от цвета, так красные тюльпаны могут символизировать объяснение в любви (поверь мне), в то время как белые олицетворяют признание вины и желание получить прощение. Многоцветные же  тюльпаны сообщают девушке о том, что у нее прекрасные глаза. Также тюльпан может означать собой богатство и свидетельствовать о любви и взаимности чувств!Подснежник — многолетне луковичное растение. Луковица округлая, до 3 см в диаметре. Листья немногочисленные, узкие, плоские, линейные или ланцетные, блестящие темно-зеленого или серовато-зеленого цвета, шириной 1 см. Из луковицы вырастает одиночный цветок на прямой цветоножке. Листья появляются одновременно с цветками. Цветки поникающие, колокольчатой формы, белые с зелеными пятнышками на краю лепестка";
   
   
    
    
    
    
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
