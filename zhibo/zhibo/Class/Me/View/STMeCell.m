//
//  STMeCell.m
//  zhibo
//
//  Created by 孙涛 on 2017/5/5.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STMeCell.h"

@implementation STMeCell

+ (instancetype)loadInfoView {
    
    return  [[[NSBundle mainBundle] loadNibNamed:@"STMeCell" owner:self options:nil] lastObject];
}
@end
