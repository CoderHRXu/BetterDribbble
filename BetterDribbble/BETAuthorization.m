//
//  BETAuthorization.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETAuthorization.h"
#import "BETHttCongifuration.h"


@implementation BETAuthorization

+ (void)openSafariToLogin
{
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&scope=%@&redirect_uri=%@",
                           BETAuthorizeURL, BETClientID, BETOAuthScope, BETRedirectURL];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    
}

+ (void)handleRedirectURL:(NSURL *)url
{
//    NSString *urlString      = [[url absoluteString] lowercaseString];
//    NSString *redirectString = [[NSString stringWithFormat:@"%@?code=", kGithubRedirectURL] lowercaseString];
//    
//    if ([urlString hasPrefix:redirectString]) {
//        NSString *code = [urlString stringByReplacingOccurrencesOfString:redirectString withString:@""];
//        OAuth2TokenRequest *oauthRequest = [[OAuth2TokenRequest alloc] initWithCode:code];
//        [oauthRequest startWithFinishedBlock:^(NSError *error, id responseObject) {
//            
//            if (!error) {
//                NSLog(@"%@", responseObject);
//                [[NSUserDefaults standardUserDefaults] setToken:responseObject[@"access_token"]];
//                [[NSUserDefaults standardUserDefaults] setTokenType:responseObject[@"token_type"]];
//            }
//        }];
//    }
}

@end
