//
//  STHotViewController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STHotViewController.h"
#import "HttpTool.h"
#import "STHot.h"
#import "STHotCell.h"
#import <MJExtension.h>
#import "STHotPlayController.h"

//#import <AFNetworking.h>

@interface STHotViewController ()
/** 全部模型数据 */
@property (nonatomic, strong) NSMutableArray *hots;

@end

@implementation STHotViewController

static NSString * ID = @"hot";

- (NSArray *)hots {

    if (!_hots) {
        _hots = [NSMutableArray array];
    }
    return _hots;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"STHotCell" bundle:nil] forCellReuseIdentifier:ID];
    
    [self loadData];
}

- (void)loadData {
    
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        
        STLog(@"%@",json[@"lives"]);
        
        //字典数组转模型数组
        NSArray *newTopics = [STHot mj_objectArrayWithKeyValuesArray:json[@"lives"]];


        [self.hots addObjectsFromArray:newTopics];
        
        
        // 刷新表格
        [self.tableView reloadData];
        
        //        [json writeToFile:@"/Users/suntao/Desktop/百思/yy/zhibo.plist" options:nil error:nil];
    } failure:^(NSError *error) {
        STLog(@"%@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    STHotCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.hot = self.hots[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100 + [UIScreen mainScreen].bounds.size.width;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    STHot *hot = self.hots[indexPath.row];
    
    STHotPlayController *playerVC = [[STHotPlayController alloc] init];
    playerVC.hot = hot;
    
    //隐藏tabBar
    playerVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
    
    /*系统自带的播放器播放不了直播内容
     
     MPMoviePlayerViewController * movieVC = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:live.streamAddr]];
     
     [self presentViewController:movieVC animated:YES completion:nil];
     */
}


@end
