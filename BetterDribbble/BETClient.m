//
//  BETClient.m
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETClient.h"
#import "AFNetworking.h"
#import "BETHttCongifuration.h"
#import "NSUserDefaults+TokenAccess.h"

@interface BETClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) BETHttCongifuration *configure;

@end
@implementation BETClient

#pragma mark - Init Method
+ (instancetype)sharedInstance {
    static BETClient *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BETClient alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if(self = [super init])
    {
        _manager = [AFHTTPSessionManager manager];
        _configure = [BETHttCongifuration sharedInstance];
    }
    return  self;
}

#pragma mark - Private Method
- (NSString *)buildRequestURL:(BETRequest *)request
{
    NSString *finalURL = request.requestURL;
    if ([finalURL hasPrefix:@"http"]) {
        return finalURL;
    }
    
    NSString *baseURL = nil;
    if (request.baseURL.length > 0) {
        baseURL = request.baseURL;
    }else if(_configure.baseURL.length > 0){
        baseURL = _configure.baseURL;
    }
    
    return [NSString stringWithFormat:@"%@%@", baseURL, request.requestURL];
    
}

- (void)addRequest:(BETRequest *)request
{
    NSLog(@"url is %@", request.requestURL);
    NSAssert(request.requestURL.length != 0, @"URL is empty");
    
    if (request.requestSerializerType == BETRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if (request.requestSerializerType == BETRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self addAuthorizationForHttpHeader];
    
    AFJSONResponseSerializer *responseSerialization = [AFJSONResponseSerializer serializer];
    
    if (request.extraHttpHeaders) {
        
        NSArray *keys = request.extraHttpHeaders.allKeys;
        for (NSString *key in keys) {
            [_manager.requestSerializer setValue:request.extraHttpHeaders[key] forHTTPHeaderField:key];
        }
    }
    
    if (request.acceptResponseContentType) {
        NSMutableSet *acceptSet = [responseSerialization.acceptableContentTypes mutableCopy];
        [acceptSet addObjectsFromArray:request.acceptResponseContentType];
    }
    _manager.responseSerializer = responseSerialization;
    
    if (request.requestMethod == BETRequestMethodGet) {
        
        request.sessionDataTask = [_manager GET:[self buildRequestURL:request] parameters:request.requestBody progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
            if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
                NSDictionary *dictionary = [httpResponse allHeaderFields];
                NSLog(@"%@", [dictionary description]);
                NSLog(@"status code is%ld",(long)httpResponse.statusCode);
            }
            if (request.requestFinishedCallback) {
                request.requestFinishedCallback(nil, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (request.requestFinishedCallback) {
                request.requestFinishedCallback(error, nil);
            }
        }];
    }
    
    if(request.requestMethod == BETRequestMethodPost){
        request.sessionDataTask = [_manager POST:[self buildRequestURL:request] parameters:request.requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (request.requestFinishedCallback) {
                request.requestFinishedCallback(nil, responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (request.requestFinishedCallback) {
                request.requestFinishedCallback(error, nil);
            }
            
        }];
    }
}

- (void)clearCache
{
    
}

- (void)addAuthorizationForHttpHeader
{
    NSString *token = [[NSUserDefaults standardUserDefaults] getToken];
    NSString *tokenType = [[NSUserDefaults standardUserDefaults] getTokenType];
    if (token.length > 0 && tokenType.length > 0) {
        NSString *authorization = [NSString stringWithFormat:@"Bearer %@",token];
        [_manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    }
}


@end
