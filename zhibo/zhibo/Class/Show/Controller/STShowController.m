//
//  STShowController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STShowController.h"
//#import "LFLiveKit.h"
#import "LFLivePreview.h"

@interface STShowController ()
@end

@implementation STShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (IBAction)closeLaunch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)startLive:(id)sender {
    
    
    UIView * backview = [[UIView alloc] initWithFrame:self.view.bounds];
    backview.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backview];
    
//    [self.view removeFromSuperview];
        LFLivePreview * preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
        preView.vc = self;
        [self.view addSubview:preView];

//    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];
//    
//    LFLivePreview *lfview = [[LFLivePreview alloc] init];
//    lfview.vc = self;

}
//    LFLivePreview * preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
//    preView.vc = self;
//    [self.view addSubview:preView];
//    //开启直播
//    [preView startLive];
////    UIView * backview = [[UIView alloc] initWithFrame:self.view.bounds];
//    backview.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:backview];
    
//    LFLivePreview * preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
//    preView.vc = self;
//    [self.view addSubview:preView];
//    //开启直播
//    [preView startLive];
//    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];

    

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];
//}

//- (void)startLive {
//    
//    UIView * backview = [[UIView alloc] initWithFrame:self.view.bounds];
//    backview.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:backview];
//    
//    LFLivePreview * preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
//    preView.vc = self;
//    [self.view addSubview:preView];
//    //开启直播
//    [preView startLive];
//    
//}





@end
