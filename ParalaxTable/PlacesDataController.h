//
//  PlacesDataController.h
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Places.h"

@interface PlacesDataController : NSObject

-(NSUInteger)placesCount;
-(Places *)placeAtIndex:(NSUInteger)index;
-(void) addPlaceWithTitle:(NSString *)title summary:(NSString *)summary andPhoto:(UIImage *)photo;

@end