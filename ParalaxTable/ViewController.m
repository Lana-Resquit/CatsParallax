//
//  ViewController.m
//  ParalaxTable
//
//  Created by Kristy on 25.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxTableViewCell.h"
#import "UIImage.h"
#import "Places.h"
#import "PlacesDataController.h"
#import "DetailTableViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PlacesDataController *placesDataController;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.placesDataController = [[PlacesDataController alloc]init];

}

-(void)viewDidAppear:(BOOL)animated {
    
    [self scrollViewDidScroll:nil];
    [self.tableView reloadData];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.placesDataController placesCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ParallaxCell"];
    Places *place = [self.placesDataController placeAtIndex:indexPath.row];
    
    
    cell.parallaxLabel.text = place.title;
    cell.parallaxSummary.text = place.summary;
    
    UIImage *blackImage = [UIImage ipMaskedImageNamed:place.photo color:[UIColor blackColor]];
    
    cell.parallaxImage.image = blackImage;
   

    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray *visibleCells = [self.tableView visibleCells];
    for (ParallaxTableViewCell *cell in visibleCells) {
        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Places *place =[self.placesDataController placeAtIndex:indexPath.row];
        [[segue destinationViewController]setDetailItem:place];
        
    }
    if ([segue.identifier isEqualToString:@"AddPlace"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        AddNewPlaceTableViewController *addNewPlaceTableViewController = [[navigationController viewControllers]objectAtIndex:0];
        addNewPlaceTableViewController.delegate = self;
    }
}

#pragma mark - AddNewPlaceViewControllerDelegate

-(void)addNewPlaceTableViewControllerDidCancel:(AddNewPlaceTableViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addNewPlaceTableViewControllerDidSave:(AddNewPlaceTableViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addNewPlaceTableViewController:(AddNewPlaceTableViewController *)controller didAddPlace:(Places *)place
{
    [self.placesDataController addPlaceWithTitle:place.title summary:place.summary photo:place.photo andLocation:place.location];
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:[self.placesDataController placesCount] - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
