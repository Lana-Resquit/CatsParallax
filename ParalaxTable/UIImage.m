//
//  UIImage.m
//  ParalaxTable
//
//  Created by Kristy on 31.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "UIImage.h"

@implementation UIImage (IPImageUtils)

+ (UIImage *)ipMaskedImageNamed:(UIImage *)name color:(UIColor *)color
{
    UIImage *image = name;
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(c, [color CGColor]);
    
    CGContextSetAlpha(c, 0.4);
    
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    CGContextFillRect(c, rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    return result;
}


@end
