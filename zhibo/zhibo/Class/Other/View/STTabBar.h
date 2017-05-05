//
//  STTabBar.h
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STTabBar;
@protocol STTabBarDelegate <NSObject>

@optional
- (void)tabbar:(STTabBar *)tabbar clickButton:(NSInteger) idx;

@end

@interface STTabBar : UITabBar

@property (nonatomic, weak) id<STTabBarDelegate> delegate;

@end
