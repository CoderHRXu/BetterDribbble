//
//  BETRequest.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BETRequestCallback)(NSError *error, id result);

typedef NS_ENUM(NSInteger , BETRequestMethod) {
    BETRequestMethodGet = 0,
    BETRequestMethodPost,
    BETRequestMethodHead,
    BETRequestMethodPut,
    BETRequestMethodDelete,
    BETRequestMethodPatch
};

typedef NS_ENUM(NSInteger , BETRequestSerializerType) {
    BETRequestSerializerTypeHTTP = 0,
    BETRequestSerializerTypeJSON,
};

@interface BETRequest : NSObject

@property (nonatomic, strong) NSURLSessionDataTask *sessionDataTask;
@property (nonatomic, copy) BETRequestCallback requestFinishedCallback;

@property (nonatomic, strong, readonly) id responseObject;
@property (nonatomic, strong, readonly) NSDictionary *responseJSON;

- (BETRequestMethod)requestMethod;

- (BETRequestSerializerType)requestSerializerType;

- (NSString *)baseURL;

- (NSString *)requestURL;

- (NSDictionary *)extraHttpHeaders;

- (NSArray *)acceptResponseContentType;

- (NSDictionary *)requestBody;

- (BOOL)isCacheData;

- (BOOL)useCache;

- (void)startWithFinishedBlock:(BETRequestCallback)finishedBlock;

- (void)pause;

- (void)cancel;

@end
