//
//  NSUserDefaults+TokenAccess.m
//  GitHubClient
//
//  Created by 臧其龙 on 16/5/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "NSUserDefaults+TokenAccess.h"

static NSString * const kBETTokenKey = @"kBETTokenKey";
static NSString * const kBETTokenTypeKey = @"kBETTokenTypeKey";

@implementation NSUserDefaults (TokenAccess)

- (void)setTokenType:(NSString *)tokenType
{
    NSAssert(tokenType.length>0, @"tokenType is emtpy");
    [[NSUserDefaults standardUserDefaults] setObject:tokenType forKey:kBETTokenTypeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getTokenType
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kBETTokenTypeKey];
}

- (void)setToken:(NSString *)token
{
    NSAssert(token.length>0, @"token is emtpy");
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:kBETTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kBETTokenKey];
}

- (void)clearToken
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kBETTokenTypeKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kBETTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
