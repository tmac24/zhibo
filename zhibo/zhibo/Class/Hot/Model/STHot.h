//
//  STHot.h
//  zhibo
//
//  Created by 孙涛 on 2017/4/25.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STGreator.h"

@interface STHot : NSObject
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) STGreator *creator;
/** 在线人数 */
@property (nonatomic, strong) NSString *online_users;
/** 直播地址 */
@property (nonatomic, strong) NSString *stream_addr;

/** 距离 */
@property (nonatomic, strong) NSString *distance;


//@property (nonatomic, strong) NSString * city;
////@property (nonatomic, strong) SXTCreator * creator;
//@property (nonatomic, assign) NSInteger group;
//@property (nonatomic, strong) NSString * ID;
//@property (nonatomic, strong) NSString * image;
//@property (nonatomic, assign) NSInteger link;
//@property (nonatomic, assign) NSInteger multi;
//@property (nonatomic, strong) NSString * name;
//@property (nonatomic, assign) NSInteger onlineUsers;
//@property (nonatomic, assign) NSInteger optimal;
//@property (nonatomic, assign) NSInteger pubStat;
//@property (nonatomic, assign) NSInteger roomId;
//@property (nonatomic, assign) NSInteger rotate;
//@property (nonatomic, strong) NSString * shareAddr;
//@property (nonatomic, assign) NSInteger slot;
//@property (nonatomic, assign) NSInteger status;
//@property (nonatomic, strong) NSString * streamAddr;
//@property (nonatomic, assign) NSInteger version;

@end
