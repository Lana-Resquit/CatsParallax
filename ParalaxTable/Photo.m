//
//  Photo.m
//  ParalaxTable
//
//  Created by Kristy on 15.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(id)initWithPhoto:(UIImage *)photo {
    self = [super init];
    if (self) {
        
        _photo = photo;
        
        return self;
    }
    return nil;
}

@end
