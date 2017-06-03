//
//  STTabBar.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STTabBar.h"
#import "STShowController.h"

@interface STTabBar ()
/** 按钮 */
@property (nonatomic, strong) UIButton *showButton;

@end

@implementation STTabBar

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        //设置tabBar背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"global_tab_bg"]];
        //添加直播按钮
        UIButton *showButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [showButton setBackgroundImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
//        showButton.contentEdgeInsets = UIEdgeInsetsMake(50, 40, 50, 40);
        showButton.size = showButton.currentBackgroundImage.size;
        [self addSubview:showButton];
        showButton.tag = 100;
        self.showButton = showButton;
        [showButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)clickItem:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    //设置直播的按钮frame
    self.showButton.center = CGPointMake(width * 0.5, height - 40);
    
    //设置其他tabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 3;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.showButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 0)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}

@end
