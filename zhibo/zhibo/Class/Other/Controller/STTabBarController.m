//
//  STTabBarController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STTabBarController.h"
#import "STHomePageController.h"
#import "STMeController.h"
#import "STShowController.h"
#import "STTabBar.h"

@interface STTabBarController ()

@end

@implementation STTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [UINavigationBar appearance];
    
    self.view.backgroundColor = [UIColor redColor];
    
    //添加子控制器
    [self setupChildVc:[[STHomePageController alloc] init] title:@"主页" image:@"tab_live" selectedImage:@"tab_live_p"];
    [self setupChildVc:[[STMeController alloc] init] title:@"我的" image:@"tab_me" selectedImage:@"tab_me_p"];
    
    //更换tabBar
    [self setValue:[[STTabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:vc];
    
}



@end
