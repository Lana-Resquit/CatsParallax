//
//  AddNewPlaceTableViewController.m
//  ParalaxTable
//
//  Created by Kristy on 18.06.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AddNewPlaceTableViewController.h"
#import "Places.h"
#import "PlacesDataController.h"
#import "DetailTableViewController.h"

@interface AddNewPlaceTableViewController ()<UITextViewDelegate>

//@property (nonatomic, strong) PlacesDataController *placesDataController;

@end

@implementation AddNewPlaceTableViewController

-(IBAction)cancel:(id)sender {
 
    [self.delegate addNewPlaceTableViewControllerDidCancel:self];
}

-(IBAction)done:(id)sender {
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37.766997, -122.422032);
    
    Places *place = [[Places alloc]init];
    place.title = self.nameTextField.text;
    place.summary = self.summaryTextView.text;
    place.photo = [UIImage imageNamed:@"test1.jpg"];
    place.location = coord;
    
    [self.delegate addNewPlaceTableViewController:self didAddPlace:place];
    NSLog(@"%@",self.delegate);
   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.placesDataController = [[PlacesDataController alloc]init];
    
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

- (id)initWithCoder:(NSCoder *)aDecoder {
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
    
}

#pragma mark TextView Delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
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
