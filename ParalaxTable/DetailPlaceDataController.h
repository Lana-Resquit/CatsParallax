//
//  DetailPlaceDataController.h
//  ParalaxTable
//
//  Created by Kristy on 15.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Photo.h"

@interface DetailPlaceDataController : NSObject

-(NSUInteger)photosCount;
-(Photo *)photoAtIndex:(NSUInteger)index;
-(void) addPhoto:(UIImage *)photo;

@end
