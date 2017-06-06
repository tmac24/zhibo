//
//  STFriendTrendViewController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STFriendTrendViewController.h"
#import <UIImageView+WebCache.h>
#import <MediaPlayer/MediaPlayer.h>
@interface STFriendTrendViewController ()
/** 视屏数据 */
@property (nonatomic, strong) NSArray *videos;
@end

@implementation STFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //0.请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video"];
    
    //1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //    NSURLSession *session;
    //    [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //解析Json
    //        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //
    //        //获得视频数组
    //        self.videos = dict[@"videos"];
    //        NSLog(@"%@", dict);
    //
    //
    //        //刷新表格
    //        [self.tableView reloadData];
    //
    //    }];
    
    //2.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //解析Json
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        //获得视频数组
        self.videos = dict[@"videos"];
//        NSLog(@"%@", dict);
        
        //刷新表格
        [self.tableView reloadData];
//        self.tableView.rowHeight = 49;
        CGFloat h = self.tableView.size.height;
        self.tableView.frame = CGRectMake(0, 35, 375, h);
//        self.tableView.contentSize.UIEdgeInsets = UIEdgeInsets;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"xhr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    //c. 判断是否获取到可重用的 cell( 最后要空间释放 )
    if (!cell) {//!cell 相当于 cell == nil
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    NSDictionary *video = self.videos[indexPath.row];
    
    cell.textLabel.text = video[@"name"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"时长：%@",video[@"length"]];
    //"http://120.25.226.186:32812
    NSString *image = [@"http://120.25.226.186:32812"stringByAppendingPathComponent:video[@"image"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"123"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *video = self.videos[indexPath.row];
    NSString *urlStr = [@"http://120.25.226.186:32812"stringByAppendingPathComponent:video[@"url"]];
    
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:urlStr]];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
