//
//  ZQLDrawerViewController.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQLDrawerViewController : UIViewController

@property (strong, readwrite, nonatomic) IBInspectable NSString *contentViewStoryboardID;
@property (strong, readwrite, nonatomic) IBInspectable NSString *leftMenuViewStoryboardID;

@property (strong, readwrite, nonatomic) UIViewController *contentViewController;
@property (strong, readwrite, nonatomic) UIViewController *leftMenuViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
             leftMenuViewController:(UIViewController *)leftMenuViewController;
@end
