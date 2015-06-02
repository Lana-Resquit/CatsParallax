//
//  TextCalculator.m
//  ParalaxTable
//
//  Created by Kristy on 21.05.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "TextCalculator.h"

@implementation TextCalculator

+ (CGFloat)calculateTextViewHeightForText:(NSString *)text
                             withFontName:(NSString *)fontName
                                     size:(CGFloat)size
                                    width:(CGFloat)width
{
    UITextView *calculationView = [[UITextView alloc] init];
    UIFont *textFont = [UIFont fontWithName:fontName size:size];
    [calculationView setFont:textFont];
    [calculationView setText:text ? text : @" "];
    CGSize calculationViewSize = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    
    return calculationViewSize.height;
}

@end
