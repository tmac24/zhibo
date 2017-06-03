//
//  STMeController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STMeController.h"
#import "STMeCell.h"

@interface STMeController ()<UITableViewDataSource>
@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) STMeCell *infoView;
@end

@implementation STMeController
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


- (STMeCell *)infoView {
    
    if (!_infoView) {
        _infoView = [STMeCell loadInfoView];
        _infoView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT * 0.3);
    }
    return _infoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableHeaderView = self.infoView;
    self.tableView.scrollEnabled = NO;
    
    NSArray * group1 = @[@"视屏",@"观看记录",@"账户",@"等级",@"实名认证"];
    NSArray * group2 = @[@"设置"];
    NSArray * dataList = @[group1,group2];
    self.dataList = dataList;
    
    
    /*
     UITableViewStylePlain,          普通样式
     UITableViewStyleGrouped         分组样式
     
     */
    CGRect Tableframe = CGRectMake(0, SCREEN_HEIGHT * 0.3, SCREEN_WIDTH, 0);
    UITableView * tableView = [[UITableView alloc] initWithFrame:Tableframe style:UITableViewStyleGrouped];
    //设置数据源
    tableView.dataSource = self;
    //行高,默认行高是44
//    tableView.rowHeight = 80;
    //设置section的高度
//    tableView.sectionHeaderHeight = 50;
    //    tableView.backgroundColor = [UIColor greenColor];
//    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby.jpg"]];
    [self.view addSubview:tableView];
    
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

//如果不设置section话，section默认是1
//每组的行数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * tempList = self.dataList[section];
    
    return tempList.count;
}

//生成tableView的单元格UITableViewCell
//NSIndexPath它是由section，和row组成。

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"me"];
    
    cell.textLabel.text = self.dataList[indexPath.section][indexPath.row];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

@end
