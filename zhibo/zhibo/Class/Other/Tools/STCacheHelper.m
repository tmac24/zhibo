//
//  STCacheHelper.m
//  zhibo
//
//  Created by 孙涛 on 2017/5/4.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STCacheHelper.h"

#define advertiseImage @"adImage"

@implementation STCacheHelper

+ (NSString *)getAdvertise {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImage];
}

+ (void)setAdvertise:(NSString *)adImage {
    
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImage];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
