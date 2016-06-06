//
//  BETResponse.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETResponse.h"

@interface BETResponse ()

@property (nonatomic, strong, readonly) NSHTTPURLResponse *response;

@end

@implementation BETResponse

- (NSString *)etag
{
    return self.response.allHeaderFields[@"Etag"];
}

- (NSInteger)statusCode
{
    return [self.response.allHeaderFields[@"statusCode"] integerValue];
}

- (id)initWithHttpResponse:(NSHTTPURLResponse *)response
{
    if (self = [super init]) {
        _response = [response copy];
    }
    
    return self;
}

@end
