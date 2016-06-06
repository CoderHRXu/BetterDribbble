//
//  BETHttCongifuration.m
//  BETClient
//
//  Created by 臧其龙 on 16/5/1.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETHttCongifuration.h"

NSString * const BETClientID = @"f28163f4e016bae481c05ddee6209f6170a913a0265f06efc728143f497d21c4";
NSString * const BETClientSecret = @"aa9421dfeefb08e12095bd3506fc7c135ce3b03d3e575b83ee4f5fa53633f290";
NSString * const BETAccessToken = @"dee88e224e7ccc51cf1d4ee856f35fc97822083ce8d39b2214b07a88b94f91cb";
NSString * const BETRedirectURL      = @"BetterDribbble://oauth-callback";
NSString * const BETOAuthScope       = @"public+write+comment+upload";

NSString * const BETAPIBaseURL = @"https://api.BET.com";
NSString * const BETAuthorizeURL     = @"https://dribbble.com/oauth/authorize";
NSString * const BETAccessTokenURL        = @"https://dribbble.com/oauth/token";

@implementation BETHttCongifuration

+ (instancetype)sharedInstance {
    static BETHttCongifuration *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BETHttCongifuration alloc] init];
    });
    return sharedInstance;
}

- (id)init{
    if(self = [super init])
    {
       
    }
    return self;
}


@end
