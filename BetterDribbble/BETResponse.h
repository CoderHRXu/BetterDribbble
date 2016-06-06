//
//  BETResponse.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BETResponse : NSObject

@property (nonatomic, copy, readonly) NSString *etag;

@property (nonatomic, assign, readonly) NSInteger statusCode;

@property (nonatomic, strong, readonly) NSData *responseData;

- (id)initWithHttpResponse:(NSHTTPURLResponse *)response;

@end
