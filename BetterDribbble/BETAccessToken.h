//
//  BETAccessToken.h
//  BetterDribbble
//
//  Created by 臧其龙 on 16/6/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BETRequest.h"

@interface BETAccessToken : BETRequest

- (id)initWithCode:(NSString *)code;

@end
