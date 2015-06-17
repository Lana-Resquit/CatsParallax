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
#import "ASIHTTPRequest.h"
#import "Location.h"

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

- (void)plotCrimePositions:(NSData *)responseData {
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
    NSDictionary *root = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSArray *data = [root objectForKey:@"data"];
    
    for (NSArray *row in data) {
        NSNumber * latitude = [[row objectAtIndex:22]objectAtIndex:1];
        NSNumber * longitude = [[row objectAtIndex:22]objectAtIndex:2];
        NSString * crimeDescription = [row objectAtIndex:18];
        NSString * address = [row objectAtIndex:14];
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        Location *annotation = [[Location alloc] initWithName:crimeDescription address:address coordinate:coordinate] ;
        [_mapView addAnnotation:annotation];
    }
}

-(IBAction)refreshTapped:(id)sender {

    MKCoordinateRegion mapRegion = [_mapView region];
    CLLocationCoordinate2D centerLocation = mapRegion.center;
    
    // 2
    NSString *jsonFile = [[NSBundle mainBundle] pathForResource:@"command" ofType:@"json"];
    NSString *formatString = [NSString stringWithContentsOfFile:jsonFile encoding:NSUTF8StringEncoding error:nil];
    NSString *json = [NSString stringWithFormat:formatString,
                      centerLocation.latitude, centerLocation.longitude, 0.5*METERS_PER_MILE];
    
    // 3
    NSURL *url = [NSURL URLWithString:@"http://data.baltimorecity.gov/api/views/INLINE/rows.json?method=index"];
    
    // 4
    ASIHTTPRequest *_request = [ASIHTTPRequest requestWithURL:url];
    __weak ASIHTTPRequest *request = _request;
    
    request.requestMethod = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    // 5
    [request setDelegate:self];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSLog(@"Response: %@", responseString);
        [self plotCrimePositions:request.responseData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    // 6
    [request startAsynchronous];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[Location class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"arrest.png"];//here we use a nice image instead of the default pins
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
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
