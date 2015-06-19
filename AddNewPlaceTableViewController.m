//
//  AddNewPlaceTableViewController.m
//  ParalaxTable
//
//  Created by Kristy on 18.06.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AddNewPlaceTableViewController.h"
#import "Places.h"

@interface AddNewPlaceTableViewController ()<UITextViewDelegate>

@end

@implementation AddNewPlaceTableViewController

-(IBAction)cancel:(id)sender {
 
    [self.delegate addNewPlaceTableViewControllerDidCancel:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.summaryTextView.delegate = self;
    self.summaryTextView.text = @"Введите описание";
    self.summaryTextView.textColor = [UIColor lightGrayColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)done:(id)sender
{
    Places *place = [[Places alloc]init];
    place.title = self.namaTextField.text;
    place.summary = self.summaryTextView.text;
    [self.delegate addNewPlaceTableViewController:self didAddPlace:place];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.namaTextField becomeFirstResponder];
    }
    if (indexPath.section == 1) {
        [self.summaryTextView becomeFirstResponder];
    }
    
}

#pragma mark TextView Delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Введите описание"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Введите описание";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

@end
