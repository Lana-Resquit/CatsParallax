//
//  ParallaxTableViewCell.h
//  ParalaxTable
//
//  Created by Kristy on 25.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *parallaxLabel;
@property (weak, nonatomic) IBOutlet UIImageView *parallaxImage;

-(void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;


@end
