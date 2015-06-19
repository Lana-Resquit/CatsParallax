//
//  AddNewPlaceTableViewController.h
//  ParalaxTable
//
//  Created by Kristy on 18.06.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Places.h"

@class AddNewPlaceTableViewController;

@protocol AddNewPlaceTableViewControllerDelegate <NSObject>
- (void)addNewPlaceTableViewControllerDidCancel:(AddNewPlaceTableViewController *)controller;
- (void)addNewPlaceTableViewController:(AddNewPlaceTableViewController *)controller didAddPlace:(Places *)place;
@end

@interface AddNewPlaceTableViewController : UITableViewController 

@property (nonatomic, weak) id <AddNewPlaceTableViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *namaTextField;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextView;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
