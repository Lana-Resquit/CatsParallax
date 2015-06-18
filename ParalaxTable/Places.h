//
//  Places.h
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Places : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) UIImage *photo;
@property (nonatomic, assign) CLLocationCoordinate2D location;


-(id)initWithTitle:(NSString *)title summary:(NSString *)summary photo:(UIImage *)photo andLocation:(CLLocationCoordinate2D)location;

@end
