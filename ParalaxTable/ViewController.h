//
//  ViewController.h
//  ParalaxTable
//
//  Created by Kristy on 25.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewPlaceTableViewController.h"

@interface ViewController : UIViewController <AddNewPlaceTableViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *displayItems;

@end

