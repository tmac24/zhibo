//
//  STNaVigationController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STNaVigationController.h"

@interface STNaVigationController ()

@end

@implementation STNaVigationController

/**
 * 当push一个控制器时调用（push直播页面）
 */
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//    [self setHidesBottomBarWhenPushed:YES];
//}

+ (void)initialize {

    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"global_tittle_bg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
