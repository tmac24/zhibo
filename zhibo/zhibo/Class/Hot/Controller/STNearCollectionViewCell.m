//
//  STNearCollectionViewCell.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/27.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STNearCollectionViewCell.h"
#import "UIImageView+SDWebImage.h"
#import "STGreator.h"
#import "STHot.h"

@interface STNearCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@end

@implementation STNearCollectionViewCell

- (void)setNear:(STInfo *)near {

    _near = near;
    [self.headIcon downloadImage:near.info.creator.portrait placeholder:@"default_room"];
    self.distanceLabel.text = near.info.distance;
}

- (void)showAnimation {

    if (self.near.isShow) {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        self.near.show = YES;
        
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
