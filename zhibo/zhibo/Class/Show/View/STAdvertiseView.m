//
//  STAdvertiseView.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/29.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STAdvertiseView.h"
#import "STAdvertice.h"
#import "STCacheHelper.h"
#import "HttpTool.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "UIImageView+SDWebImage.h"
#import "SDWebImageManager.h"
#import <SDWebImageDownloader.h>

static NSInteger showTime = 3;

@interface STAdvertiseView ()

@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) dispatch_source_t timer;


@end

@implementation STAdvertiseView
+ (instancetype)loadAdvertiseView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"STAdvertiseView" owner:self options:nil] lastObject];
}



//广告页初始化方法
- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    //展示广告
    [self showAd];
    
    //下载广告
    [self downAd];
    
    //倒计时
    [self startTimer];
}


- (void)showAd {
    
    
    NSString * filename = [STCacheHelper getAdvertise];
    NSString * filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,filename];
    
    UIImage * lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (lastCacheImage) {
        self.backView.image = lastCacheImage;
    } else {
        self.hidden = YES;
    }
    
}

- (void)downAd {
    
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        
            //如果返回信息正确
            //数据解析
        
        STAdvertice *advertise =  [STAdvertice mj_objectWithKeyValues:json[@"resources"][0]];
        
        NSLog(@"%@",advertise.image);
        
        //SDWebImageAvoidAutoSetImage 下载完不给imageView赋值
        
        
        
        [self.backView sd_setImageWithURL:[NSURL URLWithString:advertise.image] placeholderImage:[UIImage imageNamed:@"default_room"]options:SDWebImageRefreshCached];
//
//        
        [STCacheHelper setAdvertise:advertise.image];

        
    } failure:^(NSError *error) {
        
        STLog(@"%@",error);
        
    }];
}


- (void)startTimer {
    
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    self.timer = timer;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (timeout <= 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dissmiss];
            });
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.timeLabel.text = [NSString stringWithFormat:@"跳过 %zd",timeout];
            });
            
            timeout-- ;
            
        }
    });
    dispatch_resume(timer);
}

- (void)dissmiss {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        
        [self removeFromSuperview];
    }];
}

@end
