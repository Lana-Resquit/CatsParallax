//
//  Photo.h
//  ParalaxTable
//
//  Created by Kristy on 15.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic,copy)UIImage *photo;

-(id)initWithPhoto:(UIImage *)photo;

@end
