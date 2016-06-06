//
//  CategoryTableViewCell.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)beginTransformAnimation:(CGFloat)duratio;

- (void)backToOriginalTransform:(CGFloat)duration;

@end
