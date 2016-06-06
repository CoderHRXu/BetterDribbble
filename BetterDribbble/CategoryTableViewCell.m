//
//  CategoryTableViewCell.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "CategoryTableViewCell.h"

@interface CategoryTableViewCell ()
{
    CGAffineTransform concatTransform;
}

@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1.3, 1.3);;
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(80, 0);
    concatTransform = CGAffineTransformConcat(scaleTransform, translateTransform);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)beginTransformAnimation:(CGFloat)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.containerView.transform = concatTransform;
    }];
}

- (void)backToOriginalTransform:(CGFloat)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.containerView.transform = CGAffineTransformIdentity;;
    }];
}

@end
