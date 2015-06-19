//
//  DetailViewController.h
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Places.h"


@interface DetailTableViewController : UITableViewController <MKMapViewDelegate>

@property (strong, nonatomic) Places *detailItem;

@end
