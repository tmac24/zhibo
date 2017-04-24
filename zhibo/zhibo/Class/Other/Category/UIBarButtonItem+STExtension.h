//
//  UIBarButtonItem+STExtension.h
//  baisibudejie
//
//  Created by 孙涛 on 2017/4/14.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (STExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
