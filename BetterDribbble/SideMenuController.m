//
//  SideMenuController.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "SideMenuController.h"
#import "UIColor+ThemeColor.h"
#import "UserAvatarTableViewCell.h"
#import "CategoryTableViewCell.h"

static NSString * const kAvatarCellID = @"kAvatarCellID";
static NSString * const kCategoryCellID = @"kCategoryCellID";
static CGFloat const kAnimationDuration = 0.3;

@interface SideMenuController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSIndexPath *lastTouchedIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *sideMenuTableView;

@end

@implementation SideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIApperance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Private Method

- (void)setupUIApperance {
    self.sideMenuTableView.backgroundColor = [UIColor sideMenuBackgroundColor];

}

- (void)handleParentPanGestureAction:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1.3, 1.3);;
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(80, 0);
    CGAffineTransform concatTransform = CGAffineTransformConcat(scaleTransform, translateTransform);
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint beganPoint = [gesture locationInView:self.sideMenuTableView];
            NSIndexPath *touchIndex = [self.sideMenuTableView indexPathForRowAtPoint:beganPoint];
            if (touchIndex != nil) {
                lastTouchedIndex = touchIndex;
                UITableViewCell *cell = [self.sideMenuTableView cellForRowAtIndexPath:touchIndex];
                if ([cell isKindOfClass:[CategoryTableViewCell class]]) {
                    [UIView animateWithDuration:kAnimationDuration animations:^{
                        CategoryTableViewCell *categoryCell = (CategoryTableViewCell *)cell;
                        categoryCell.containerView.transform = concatTransform;
                    }];
                }else {
                    
                    [UIView animateWithDuration:kAnimationDuration animations:^{
                        cell.contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);;
                    }];
                }
                
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint changedPoint = [gesture locationInView:self.sideMenuTableView];
            NSIndexPath *changedIndex = [self.sideMenuTableView indexPathForRowAtPoint:changedPoint];
            if (changedIndex != nil) {
                NSComparisonResult compareResult = [lastTouchedIndex compare:changedIndex];
                if(compareResult != NSOrderedSame) {
                    UITableViewCell *lastCell = [self.sideMenuTableView cellForRowAtIndexPath:lastTouchedIndex];
                    if ([lastCell isKindOfClass:[CategoryTableViewCell class]]) {
                        [UIView animateWithDuration:kAnimationDuration animations:^{
                            CategoryTableViewCell *categoryCell = (CategoryTableViewCell *)lastCell;
                            categoryCell.containerView.transform = CGAffineTransformIdentity;
                        }];
                    }else {
                        
                        [UIView animateWithDuration:kAnimationDuration animations:^{
                            lastCell.contentView.transform = CGAffineTransformIdentity;
                        }];
                    }

                    
                    lastTouchedIndex = changedIndex;
                    UITableViewCell *currentCell = [self.sideMenuTableView cellForRowAtIndexPath:changedIndex];
                    if ([currentCell isKindOfClass:[CategoryTableViewCell class]]) {
                        [UIView animateWithDuration:kAnimationDuration animations:^{
                            CategoryTableViewCell *categoryCell = (CategoryTableViewCell *)currentCell;
                            categoryCell.containerView.transform = concatTransform;
                        }];
                    }else {
                        
                        [UIView animateWithDuration:kAnimationDuration animations:^{
                            currentCell.contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);
                        }];
                    }
                    
                }
            }
        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            CGPoint endPoint = [gesture locationInView:self.sideMenuTableView];
            NSIndexPath *endIndexPath = [self.sideMenuTableView indexPathForRowAtPoint:endPoint];
            if (endIndexPath != nil) {
                UITableViewCell *endCell = [self.sideMenuTableView cellForRowAtIndexPath:endIndexPath];
                if ([endCell isKindOfClass:[CategoryTableViewCell class]]) {
                    [UIView animateWithDuration:kAnimationDuration animations:^{
                        CategoryTableViewCell *categoryCell = (CategoryTableViewCell *)endCell;
                        categoryCell.containerView.transform = CGAffineTransformIdentity;
                    }];
                }else {
                    
                    [UIView animateWithDuration:kAnimationDuration animations:^{
                        endCell.contentView.transform = CGAffineTransformIdentity;
                    }];
                }
            }
            UITableViewCell *lastCell = [self.sideMenuTableView cellForRowAtIndexPath:lastTouchedIndex];
            if ([lastCell isKindOfClass:[CategoryTableViewCell class]]) {
                [UIView animateWithDuration:kAnimationDuration animations:^{
                    CategoryTableViewCell *categoryCell = (CategoryTableViewCell *)lastCell;
                    categoryCell.containerView.transform = CGAffineTransformIdentity;
                }];
            }else {
                
                [UIView animateWithDuration:kAnimationDuration animations:^{
                    lastCell.contentView.transform = CGAffineTransformIdentity;
                }];
            }
            lastTouchedIndex = nil;
            break;
        }
        default:
            break;
    }
}

#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryCellID];
    UserAvatarTableViewCell *avatarCell = [tableView dequeueReusableCellWithIdentifier:kAvatarCellID];
    
    if (indexPath.row == 0) {
        avatarCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return avatarCell;
    }else{
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.categoryImageView.image = [UIImage imageNamed:@"wuyanzu.jpg"];
        cell.categoryNameLabel.text = [NSString stringWithFormat:@"index row is %ld", (long)indexPath.row];
        
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }
    return 100;
}

@end
