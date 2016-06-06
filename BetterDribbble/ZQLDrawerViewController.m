//
//  ZQLDrawerViewController.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ZQLDrawerViewController.h"
#import "UIColor+ThemeColor.h"
#import "SideMenuController.h"

@interface ZQLDrawerViewController ()

@property (nonatomic, strong) CAShapeLayer *lineLayer;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;

@end

@implementation ZQLDrawerViewController

- (id)initWithContentViewController:(UIViewController *)contentViewController
             leftMenuViewController:(UIViewController *)leftMenuViewController
{
    if (self = [super init]) {
        self.contentViewController = contentViewController;
        self.leftMenuViewController = leftMenuViewController;
        
    }
    return self;
}

- (void)awakeFromNib
{
    if (self.contentViewStoryboardID) {
        self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.contentViewStoryboardID];
    }
    if (self.leftMenuViewStoryboardID) {
        self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.leftMenuViewStoryboardID];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.containerView];
    
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.strokeColor = [UIColor sideMenuBackgroundColor].CGColor;
    self.lineLayer.fillColor  = [UIColor sideMenuBackgroundColor].CGColor;
    
    [self addChildViewController:self.leftMenuViewController];
    self.leftMenuViewController.view.frame = self.view.bounds;
    self.leftMenuViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.containerView addSubview:self.leftMenuViewController.view];
    [self.leftMenuViewController didMoveToParentViewController:self];
    
    [self addChildViewController:self.contentViewController];
    self.contentViewController.view.frame = self.view.bounds;
    [self.containerView addSubview:self.contentViewController.view];
    [self.contentViewController didMoveToParentViewController:self];
    [self.contentViewController.view.layer addSublayer:self.lineLayer];
    
    self.panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleEdgePanGesture:)];
    self.panGesture.edges = UIRectEdgeLeft;
    [self.containerView addGestureRecognizer:self.panGesture];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (CGPathRef) getLeftLinePathWithAmount:(CGFloat)amount withY:(CGFloat)amountY {
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(0, 0);
    CGPoint midControlPoint = CGPointMake(amount, amountY);
    CGPoint bottomPoint = CGPointMake(0, self.view.bounds.size.height);
    
    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    [verticalLine closePath];
    
    return [verticalLine CGPath];
}

- (void)handleEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    SideMenuController *vc = (SideMenuController *)self.leftMenuViewController;
    [vc handleParentPanGestureAction:gesture];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint beganPoint = [gesture locationInView:self.containerView];
            self.lineLayer.path = [self getLeftLinePathWithAmount:beganPoint.x withY:beganPoint.y];
        }
            
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint changedPoint = [gesture locationInView:self.containerView];
            CGPoint translatePoint = [gesture translationInView:self.containerView];
            self.contentViewController.view.center = CGPointMake(CGRectGetMidX(self.contentViewController.view.frame) + translatePoint.x, CGRectGetMidY(self.contentViewController.view.frame));
            self.lineLayer.path = [self getLeftLinePathWithAmount:changedPoint.x withY:changedPoint.y];
            [gesture setTranslation:CGPointZero inView:self.containerView];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.contentViewController.view.frame = self.view.bounds;
            self.lineLayer.path = nil;
            break;
        }
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
