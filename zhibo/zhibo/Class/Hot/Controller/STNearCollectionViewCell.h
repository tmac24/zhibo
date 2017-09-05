//
//  STNearCollectionViewCell.h
//  zhibo
//
//  Created by 孙涛 on 2017/4/27.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STInfo.h"

@interface STNearCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) STInfo * near;

- (void)showAnimation;
@end
