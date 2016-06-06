//
//  NSUserDefaults+TokenAccess.h
//  GitHubClient
//
//  Created by 臧其龙 on 16/5/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (TokenAccess)

- (void)setTokenType:(NSString *)tokenType;

- (NSString *)getTokenType;

- (void)setToken:(NSString *)token;

- (NSString *)getToken;

- (void)clearToken;

@end
