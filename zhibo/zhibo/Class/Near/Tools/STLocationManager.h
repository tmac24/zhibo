//
//  STLocationManager.h
//  zhibo
//
//  Created by 孙涛 on 2017/4/27.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString * lat, NSString * lon);

@interface STLocationManager : NSObject

+ (instancetype)sharedManager;

- (void)getGps:(LocationBlock)block;

@property (nonatomic, copy) NSString * lat;
@property (nonatomic, copy) NSString * lon;
@end
