//
//  UIColor+ThemeColor.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "UIColor+ThemeColor.h"

@implementation UIColor (ThemeColor)

+ (UIColor *)RGBWithRed:(CGFloat)red WithGreen:(CGFloat)green WithBlue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

+ (UIColor *)sideMenuBackgroundColor {
    return [UIColor RGBWithRed:78 WithGreen:176 WithBlue:209];
}

@end
