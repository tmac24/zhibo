//
//  STLiveChatViewController.h
//  zhibo
//
//  Created by 孙涛 on 2017/4/26.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STHot;
@class STInfo;
@interface STLiveChatViewController : UIViewController

/** hot模型 */
@property (nonatomic, strong) STHot *hot;

/** near模型 */
@property (nonatomic, strong) STInfo *near;
@end
