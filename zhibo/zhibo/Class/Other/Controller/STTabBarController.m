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
#import "STNaVigationController.h"

@interface STTabBarController ()

@end

@implementation STTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = STRGBColor(107, 231, 214);
    
    [UINavigationBar appearance];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = STRGBColor(107, 231, 214);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
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
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    STNaVigationController *nav = [[STNaVigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

@end
