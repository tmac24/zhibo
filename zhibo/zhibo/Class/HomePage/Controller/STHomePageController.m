//
//  STHomePageController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STHomePageController.h"
#import "STNearViewController.h"
#import "STFriendTrendViewController.h"
#import "STHotViewController.h"

@interface STHomePageController ()<UIScrollViewDelegate>
/** 标签栏红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** 当前选中的按钮 */
@property (nonatomic, strong) UIButton *selectedButton;
/** 顶部所有的标签 */
@property (nonatomic, strong) UIView *titlesView;
/** 底部的所有内容 */
@property (nonatomic, strong) UIScrollView *contentView;

@end

@implementation STHomePageController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏
    [self setNav];
    
    //初始化子控制器
    [self setupChildVces];
    
    //设置顶部标签栏
    [self setupTitleView];
    
    //底部的scrollView
    [self setupContentView];
}

- (void)titleClick:(UIButton *)button {
    
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];

    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
    
}

/**
 * 底部的scrollView
 */
- (void)setupContentView {
    
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
    
}


/**
 * 设置顶部标签栏
 */
- (void)setupTitleView {
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.y = 0;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = STRGBColor(107, 231, 214);
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    // 内部的子标签
    NSArray *titles = @[@"关注", @"热门", @"附近"];
    CGFloat width = titlesView.width / titles.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        //        [button layoutIfNeeded]; // 强制布局(强制更新子控件的frame)
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:STRGBColor(107, 231, 214) forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        // 默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titlesView addSubview:indicatorView];
    
}


/**
 * 初始化子控制器
 */
- (void)setupChildVces {

    
    STFriendTrendViewController *friendTrend = [[STFriendTrendViewController alloc] init];
    [self addChildViewController:friendTrend];
    
    STHotViewController *hot = [[STHotViewController alloc] init];
    [self addChildViewController:hot];

    
    STNearViewController *near = [[STNearViewController alloc] init];
    [self addChildViewController:near];
    
}

/**
 * 设置导航栏
 */
- (void)setNav {
    

    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"global_search" highImage:nil target:self action:@selector(global_searchClick)];
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"title_button_more" highImage:nil target:self action:@selector(title_button_moreClick)];
    // 设置背景色
    self.view.backgroundColor = STGlobalBg;
}
- (void)global_searchClick
{
    STLogFunc;
}

- (void)title_button_moreClick {

    STLogFunc;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 25; // 设置控制器view的y值为0(默认是20)
    vc.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
}

@end
