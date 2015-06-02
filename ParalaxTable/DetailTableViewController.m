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

@interface DetailTableViewController ()


@end

@implementation DetailTableViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    if (self.detailItem) {
        
       // self.detailDescription.text = self.detailItem.summary;
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
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
    cell.descriptionLabel.text = @"Хризантема (лат. Chrysanthemum) – травянистые многолетники и однолетники семейства Астровые или Сложноцветные. В переводе с греческого означает «златоцветный», или «цветок-солнце», поскольку многие виды имеют жёлтую окраску соцветий. По данным сайта GRIN этот род насчитывает в природе 29 видов, распространенных в северной и умеренной зонах, по большей части в Азии. Археологи утверждают, что более 2500 лет назад хризантему уже культивировали древние китайцы, употреблявшие ее лепестки в пищу, а в трактате «Весна и осень» она была упомянута самим Конфуцием! Затем культивированием цветка занялись и японцы, боготворившие этот цветок настолько, что исключительно члены императорской семьи имели право носить одежду с изображением хризантемы. В Европе хризантема появилась в восемнадцатом веке, но интенсивно культивировать ее начали только в девятнадцатом.";
    
    tableView.rowHeight = cell.descriptionLabel.frame.size.height + cell.collectionView.frame.size.height ;
    
    NSLog(@"%f",cell.descriptionLabel.frame.size.width);
    NSLog(@"%f",cell.descriptionLabel.frame.size.height);
    NSLog(@"%f",cell.collectionView.frame.size.height);
    
    
    return cell;
}






@end
