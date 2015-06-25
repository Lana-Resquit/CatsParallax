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

@property (nonatomic, readonly) NSMutableArray *placesList;

-(NSUInteger)placesCount;
-(Places *)placeAtIndex:(NSUInteger)index;
-(void) addPlaceWithTitle:(NSString *)title summary:(NSString *)summary photo:(UIImage *)photo andLocation:(CLLocationCoordinate2D)location;

@end
