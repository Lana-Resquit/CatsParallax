//
//  DetailPlaceDataController.m
//  ParalaxTable
//
//  Created by Kristy on 15.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailPlaceDataController.h"

@interface DetailPlaceDataController ()

@property (nonatomic, readonly) NSMutableArray *photosGallery;
@property (nonatomic, strong) NSArray *photos;

-(void)initializeDefaultPlace;

@end

@implementation DetailPlaceDataController

-(id)init {
    self = [super init];
    
    if (self) {
        _photosGallery = [[NSMutableArray alloc]init];
        [self initializeDefaultPlace];
        return self;
    }
    return nil;
}

-(void)initializeDefaultPlace {
    self.photos = @[[UIImage imageNamed:@"test1.jpg"],
                         [UIImage imageNamed:@"test2.jpg"],
                         [UIImage imageNamed:@"test3.jpg"],
                         [UIImage imageNamed:@"test4.jpg"],
                         [UIImage imageNamed:@"test5.jpg"],
                         [UIImage imageNamed:@"test6.jpg"],
                         [UIImage imageNamed:@"test7.jpg"],
                         [UIImage imageNamed:@"test8.jpg"],
                         [UIImage imageNamed:@"test9.jpg"]];
    for (int i = 0; i< self.photos.count; i++) {
        [self addPhoto:[self.photos objectAtIndex:i]];
    }
}

-(NSUInteger)photosCount {
    return [self.photosGallery count];
}

-(Photo *)photoAtIndex:(NSUInteger)index {
    return [self.photosGallery objectAtIndex:index];
}

-(void)addPhoto:(UIImage *)photo {
    Photo *newPhoto = [[Photo alloc]initWithPhoto:photo];
    [self.photosGallery addObject:newPhoto];
    
}


@end
