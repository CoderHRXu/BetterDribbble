//
//  ViewController.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/1.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "BETHttCongifuration.h"

@interface ViewController ()<UIWebViewDelegate>
{
    CAShapeLayer *lineLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startURL:(id)sender
{
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&scope=%@&redirect_uri=%@",
                           BETAuthorizeURL, BETClientID, BETOAuthScope, BETRedirectURL];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)handleEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint beganPoint = [gesture locationInView:self.view];
            lineLayer.path = [self getLeftLinePathWithAmount:beganPoint.x withY:beganPoint.y];
        }
            
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint beganPoint = [gesture locationInView:self.view];
            lineLayer.path = [self getLeftLinePathWithAmount:beganPoint.x withY:beganPoint.y];
            break;
        }
        default:
            break;
    }
}

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

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

@end
