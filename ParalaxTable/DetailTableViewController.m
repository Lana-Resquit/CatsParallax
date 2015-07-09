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

@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;

@end

@implementation DetailTableViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    if (self.detailItem) {
        
        self.navItem.title = self.detailItem.title;
        
    
        
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
    
    tableView.estimatedRowHeight = 44.0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
   // NSLog(@"%f",self.detailItem.location.coordinate.longitude);
    
    
    MKCoordinateRegion adjustedRegion = [cell.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(self.detailItem.location, METERS_AROUND_THE_LOCATION, METERS_AROUND_THE_LOCATION)];
    [cell.mapView setRegion:adjustedRegion animated:YES];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = self.detailItem.location;
    point.title = self.detailItem.title;
    
    [cell.mapView addAnnotation:point];
    
    cell.descriptionLabel.text = self.detailItem.summary;
    
    return cell;
}


@end
