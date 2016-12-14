//
//  YYWatchVideoCell.m
//  SELF
//
//  Created by youruogege on 16/12/14.
//  Copyright © 2016年 youruogege. All rights reserved.
//

#import "YYWatchVideoCell.h"

@implementation YYWatchVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self layoutIfNeeded];
    
    self.bgImgView.tag = 101;
    self.bgImgView.userInteractionEnabled = YES;

    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImgView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgImgView);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)playVideo:(UIButton *)sender{
    
    if (self.playBlock) {
        self.playBlock(sender);
    }
}

@end
