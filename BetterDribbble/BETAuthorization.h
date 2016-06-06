//
//  BETAuthorization.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETRequest.h"
#import <UIKit/UIKit.h>

@interface BETAuthorization : NSObject

+ (void)openSafariToLogin;

+ (void)handleRedirectURL:(NSURL *)url;

@end
