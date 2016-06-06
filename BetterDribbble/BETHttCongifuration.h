//
//  BETHttCongifuration.h
//  BETClient
//
//  Created by 臧其龙 on 16/5/1.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BETRequest.h"

FOUNDATION_EXPORT NSString * const BETClientID;
FOUNDATION_EXPORT NSString * const BETClientSecret;
//FOUNDATION_EXPORT NSString * const BETAccessToken;

FOUNDATION_EXPORT NSString * const BETRedirectURL;
FOUNDATION_EXPORT NSString * const BETAPIBaseURL;
FOUNDATION_EXPORT NSString * const BETAuthorizeURL;
FOUNDATION_EXPORT NSString * const BETAccessTokenURL;
FOUNDATION_EXPORT NSString * const BETOAuthScope;

@interface BETHttCongifuration : NSObject

@property (nonatomic, copy) NSString *baseURL;

+ (instancetype)sharedInstance;

@end
