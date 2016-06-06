//
//  BETClient.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BETRequest.h"

@interface BETClient : NSObject

+ (instancetype)sharedInstance;

- (void)addRequest:(BETRequest *)request;

- (void)clearCache;

@end
