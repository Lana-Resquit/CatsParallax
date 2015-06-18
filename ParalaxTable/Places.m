//
//  Places.m
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "Places.h"

@implementation Places

-(id)initWithTitle:(NSString *)title summary:(NSString *)summary photo:(UIImage *)photo andLocation:(CLLocationCoordinate2D)location {
    self = [super init];
    if (self) {
        _title = title;
        _summary = summary;
        _photo = photo;
        _location = location;
        
        return self;
    }
    return nil;
}


@end
