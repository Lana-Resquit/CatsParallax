//
//  TextCalculator.h
//  ParalaxTable
//
//  Created by Kristy on 21.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TextCalculator : NSObject

+ (CGFloat)calculateTextViewHeightForText:(NSString *)text
                             withFontName:(NSString *)fontName
                                     size:(CGFloat)size
                                    width:(CGFloat)width;

@end
