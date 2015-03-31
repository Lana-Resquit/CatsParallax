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

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableItems;
@property (nonatomic,strong) NSArray *tableLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableItems = @[[UIImage imageNamed:@"test1.jpeg"],
                        [UIImage imageNamed:@"test2.jpg"],
                        [UIImage imageNamed:@"test3.jpg"],
                        [UIImage imageNamed:@"test4.jpg"],
                        [UIImage imageNamed:@"test5.jpg"],
                        [UIImage imageNamed:@"test6.jpg"],
                        [UIImage imageNamed:@"test7.jpg"],
                        [UIImage imageNamed:@"test8.jpg"],
                        [UIImage imageNamed:@"test9.jpg"]];
    
    
    self.tableLabels = @[@"Калла",
                         @"Роза",
                         @"Орхидея",
                         @"Ромашка",
                         @"Пион",
                         @"Хризантема",
                         @"Гербера",
                         @"Тюльпан",
                         @"Подснежник"];
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self scrollViewDidScroll:nil];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ParallaxCell"];
    
    
    cell.parallaxLabel.text = [self.tableLabels objectAtIndex:indexPath.row];
    
    UIImage *blackImage = [UIImage ipMaskedImageNamed:[self.tableItems objectAtIndex:indexPath.row] color:[UIColor blackColor]];
    
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

@end
