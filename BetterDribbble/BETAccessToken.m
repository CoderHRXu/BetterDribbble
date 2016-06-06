//
//  BETAccessToken.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETAccessToken.h"
#import "BETHttCongifuration.h"

@interface BETAccessToken ()

@property (nonatomic, copy, readonly) NSString *code;

@end

@implementation BETAccessToken

- (id)initWithCode:(NSString *)code
{
    if (self = [super init]) {
        _code = code;
    }
    return self;
}

- (BETRequestMethod)requestMethod
{
    return BETRequestMethodPost;
}

- (NSString *)requestURL
{
    return BETAccessTokenURL;
}

- (NSDictionary *)requestBody {
    return @{@"client_id": BETClientID, @"client_secret": BETClientSecret, @"code": _code};
}


@end
