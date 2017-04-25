//
//  STHotCell.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/25.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STHotCell.h"
#import <UIImageView+WebCache.h>
#import "STHot.h"
@interface STHotCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation STHotCell

- (void)setHot:(STHot *)hot {

    _hot = hot;
    
    [self.headView sd_setImageWithURL:[NSURL URLWithString:hot.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
    //图片圆角
    //    self.view.layer.cornerRadius = 15;
    //    self.view.layer.masksToBounds = YES;
    self.nameLabel.text = hot.creator.nick;
    self.locationLabel.text = hot.city;
    self.onLineLabel.text = hot.online_users;
//    self.onLineLabel.text = [@(hot.online_users) stringValue];

    
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:hot.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
