//
//  DetailViewController.h
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Places.h"

@interface DetailViewController : UIViewController 
@property (strong, nonatomic) Places *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailSummary;

@property (nonatomic, strong) IBOutlet UIScrollView *scrollViewForGallery;

@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;



@end
