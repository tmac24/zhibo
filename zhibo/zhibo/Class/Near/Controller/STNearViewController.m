//
//  STNearViewController.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STNearViewController.h"
#import "HttpTool.h"
#import "STLocationManager.h"
#import "STInfo.h"
#import <MJExtension.h>
#import "STHotPlayController.h"
#import "STNearCollectionViewCell.h"
#import "STHotPlayController.h"

static NSString * identifier = @"STNearLiveCell";

@interface STNearViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
/** 全部模型数据 */
@property (nonatomic, strong) NSMutableArray *nearDatas;
@property (strong, nonatomic) IBOutlet UICollectionView *nearCollectView;

@end

@implementation STNearViewController


- (void)initUI {
    
    [self.nearCollectView registerNib:[UINib nibWithNibName:@"STNearCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
}


- (NSMutableArray *)nearDatas {
    
    if (!_nearDatas) {
        _nearDatas = [NSMutableArray array];
    }
    return _nearDatas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
    [self loadData];
    
}

- (void)loadData {
    
    STLocationManager * manager = [STLocationManager sharedManager];
    //126.6146033
    //45.7150614
    NSDictionary * params = @{@"uid":@"107020648",
                              @"latitude":@"45.710358",
                              @"longitude":@"126.610549"
                              };

    [HttpTool getWithPath:API_NearLive params:params success:^(id json) {
        
        //字典数组转模型数组
        NSArray *newTopics = [STInfo mj_objectArrayWithKeyValuesArray:json[@"flow"]];
        
        [self.nearDatas addObjectsFromArray:newTopics];
        
        //刷新数据
        [self.nearCollectView reloadData];
        
    } failure:^(NSError *error) {
        STLog(@"%@",error);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.nearDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    STNearCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.near = self.nearDatas[indexPath.row];
    
    return cell;
    
}

#define kMargin 5
#define kItemWidth 100
//布局collectionView
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.nearCollectView.bounds = [UIScreen mainScreen ].bounds;
    
    NSInteger count = self.nearCollectView.width / kItemWidth;
    
    CGFloat etraWidth = (self.nearCollectView.width - kMargin * (count + 1)) / count;
    
    return CGSizeMake(etraWidth, etraWidth + 20);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    STInfo *near = self.nearDatas[indexPath.row];
    
    STHotPlayController * playerVC = [[STHotPlayController alloc] init];
    playerVC.near = near;
    
    //隐藏tabBar
    playerVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
}


@end
