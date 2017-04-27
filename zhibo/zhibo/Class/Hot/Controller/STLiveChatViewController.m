//
//  STLiveChatViewController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/26.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STLiveChatViewController.h"
#import "STHot.h"
#import "UIImageView+SDWebImage.h"
#import "STInfo.h"

@interface STLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heardIcon;
@property (weak, nonatomic) IBOutlet UILabel *online_usersLabel;
@property (weak, nonatomic) IBOutlet UILabel *InKID;

@end

@implementation STLiveChatViewController

- (void)setHot:(STHot *)hot {

    _hot = hot;
    
    [self.heardIcon downloadImage:hot.creator.portrait placeholder:@"default_room"];
    self.heardIcon.layer.cornerRadius = 15;
    self.heardIcon.layer.masksToBounds = YES;
    
    self.online_usersLabel.text = hot.online_users;
    self.InKID.text = [NSString stringWithFormat:@"映客号:%@",hot.creator.id];

}

- (void)setNear:(STInfo *)near {

    _near = near;
    
    [self.heardIcon downloadImage:near.info.creator.portrait placeholder:@"default_room"];
    self.heardIcon.layer.cornerRadius = 15;
    self.heardIcon.layer.masksToBounds = YES;
    
    self.online_usersLabel.text = near.info.online_users;
    self.InKID.text = [NSString stringWithFormat:@"映客号:%@",near.info.creator.id];
    
}

/* 检测观看直播人数变化（目前拿不到变化数据）
 [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
 self.peopleCountLB.text = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
 } repeats:YES];
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
