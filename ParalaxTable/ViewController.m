//
//  ViewController.m
//  ParalaxTable
//
//  Created by Kristy on 25.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxTableViewCell.h"

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
    self.tableItems = @[[UIImage imageNamed:@"IKV_6994.jpg" ],
                        [UIImage imageNamed:@"IKV_7005.jpg" ],
                        [UIImage imageNamed:@"IKV_6964.jpg" ],
                        [UIImage imageNamed:@"IKV_7032.jpg" ],
                        [UIImage imageNamed:@"IKV_7047.jpg" ],
                        [UIImage imageNamed:@"IKV_7050.jpg" ],
                        [UIImage imageNamed:@"IKV_7056.jpg" ],
                        [UIImage imageNamed:@"IKV_7054.jpg" ],
                        [UIImage imageNamed:@"IKV_7024.jpg" ]];
    
    
    
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
    cell.parallaxImage.image = [self.tableItems objectAtIndex:indexPath.row];
    UIView *overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.parallaxImage.image.size.width, cell.parallaxImage.image.size.height / 2)];
    [overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    if (cell.parallaxImage.subviews.count == 0) [cell.parallaxImage addSubview:overlay];
    
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
