//
//  BETRequest.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETRequest.h"
#import "BETClient.h"

@implementation BETRequest

- (BETRequestMethod)requestMethod
{
    return BETRequestMethodGet;
}

- (BETRequestSerializerType)requestSerializerType
{
    return BETRequestSerializerTypeHTTP;
}

- (NSString *)baseURL
{
    return @"";
}

- (NSString *)requestURL
{
    return @"";
}

- (NSDictionary *)extraHttpHeaders
{
    return nil;
}

- (NSArray *)acceptResponseContentType
{
    return nil;
}

- (NSDictionary *)requestBody
{
    return nil;
}

- (void)startWithFinishedBlock:(BETRequestCallback)finishedBlock;
{
    _requestFinishedCallback = finishedBlock;
    [self start];
}

- (void)start{
    [[BETClient sharedInstance] addRequest:self];
    [self.sessionDataTask resume];
    
}

- (void)pause
{
    [_sessionDataTask suspend];
}

- (void)cancel
{
    [_sessionDataTask cancel];
}

- (void)validateStatus
{
    
}

- (BOOL)isCacheData
{
    return NO;
}

- (BOOL)useCache
{
    return NO;
}


@end
