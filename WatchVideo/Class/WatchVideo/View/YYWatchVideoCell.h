//
//  YYWatchVideoCell.h
//  SELF
//
//  Created by youruogege on 16/12/14.
//  Copyright © 2016年 youruogege. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PlayBtnActBlock)(UIButton *);

@interface YYWatchVideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, copy) PlayBtnActBlock playBlock;

@end
