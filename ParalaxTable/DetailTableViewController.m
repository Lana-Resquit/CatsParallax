//
//  DetailViewController.m
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailTableViewController.h"
#import "DetailTableViewCell.h"
#import "Photo.h"
#import "TextCalculator.h"
#import <MapKit/MapKit.h>

#define METERS_AROUND_THE_LOCATION 800

@interface DetailTableViewController ()


@end

@implementation DetailTableViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    if (self.detailItem) {
        
      //  self.navItem.title = self.detailItem.title;
        
    
        
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
   
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
   // NSLog(@"%f",self.detailItem.location.coordinate.longitude);
    
    
    MKCoordinateRegion adjustedRegion = [cell.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(self.detailItem.location, METERS_AROUND_THE_LOCATION, METERS_AROUND_THE_LOCATION)];
    [cell.mapView setRegion:adjustedRegion animated:YES];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = self.detailItem.location;
    point.title = self.detailItem.title;
    
    [cell.mapView addAnnotation:point];
    
    
   // NSString *text = @"Самый ";//популярный и известный вид герберы — Gerbera jamesonii Bolus ex Hook.f., гербера Джеймсона. Именно с её открытия началось введение в культуру этого замечательного цветка. В конце 19 века шотландский ученый Роберт Джеймсон обратил внимание и описал один из видов герберы, произрастающий в Трансваале, области в Южной Африке, после чего в некоторых англоязычных странах гербера стала называться «трансваальская ромашка» (transvaal daisy). Именно этот вид стал родоначальником всех современных сортов гербер. Стараниями селекционеров путем скрещивания герберы Джеймсона и герберы зеленолистной (G.Viridifolia) создано более тысячи разновидностей и сортов гибридных гербер разнообразной расцветки и размера, с простыми и махровыми соцветиями. Широко используются, особенно в комнатном цветоводстве, различные садовые формы и сорта герберы Джемсона.Самый популярный и известный вид герберы — Gerbera jamesonii Bolus ex Hook.f., гербера Джеймсона. Именно с её открытия началось введение в культуру этого замечательного цветка. В конце 19 века шотландский ученый Роберт Джеймсон обратил внимание и описал один из видов герберы, произрастающий в Трансваале, области в Южной Африке, после чего в некоторых англоязычных странах гербера стала называться «трансваальская ромашка» (transvaal daisy). Именно этот вид стал родоначальником всех современных сортов гербер. Стараниями селекционеров путем скрещивания герберы Джеймсона и герберы зеленолистной (G.Viridifolia) создано более тысячи разновидностей и сортов гибридных гербер разнообразной расцветки и размера, с простыми и махровыми соцветиями. Широко используются, особенно в комнатном цветоводстве, различные садовые формы и сорта герберы Джемсона.";
    
    CGRect r = [self.detailItem.summary boundingRectWithSize:CGSizeMake(200, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Times New Roman" size:17.0]}
                                  context:nil];
    
//    [cell.collectionView setBackgroundColor:[UIColor blueColor]];
//    [tableView setBackgroundColor:[UIColor redColor]];
//    [cell setBackgroundColor:[UIColor greenColor]];
    
    self.tableView.rowHeight = (r.size.height + cell.collectionView.frame.size.height)/1.5;
    
    
    cell.descriptionLabel.text = self.detailItem.summary;
    
    
    NSLog(@"%f",r.size.height);
    NSLog(@"%f",cell.collectionView.frame.size.height);
    NSLog(@"%f",tableView.rowHeight);
    
    
    return cell;
}


@end
