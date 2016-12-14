//
//  YYWatchVideoViewController.m
//  SELF
//
//  Created by youruogege on 16/12/14.
//  Copyright © 2016年 youruogege. All rights reserved.
//

static NSString *watchCellID = @"watchCell";
#import "YYWatchVideoViewController.h"
#import "YYWatchVideoCell.h"
#import "ZFPlayerView.h"

@interface YYWatchVideoViewController ()<UITableViewDataSource, UITableViewDelegate, ZFPlayerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZFPlayerView   *playerView;
@property (nonatomic, strong) ZFPlayerModel  *playerModel;

@end

@implementation YYWatchVideoViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
}

#pragma mark - 设置UI

- (void) initSubviews {
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupTableView];
    
    [self.view addSubview:self.tableView];
    
    //设置约束
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(64);
        make.height.mas_equalTo(self.view.bounds.size.height);
    }];
}

#pragma mark - 设置tableview

- (void) setupTableView{
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 379.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"YYWatchVideoCell" bundle:nil] forCellReuseIdentifier:watchCellID];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YYWatchVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:watchCellID];
    
    __block NSIndexPath *weakIndexPath = indexPath;
    __block YYWatchVideoCell *weakCell = cell;
    
    cell.playBlock = ^(UIButton *btn){
        NSURL *videoURL = [NSURL URLWithString:@"http://files.selfimg.com.cn/media/video/2016/11/18/11ee13997555832e38f169b6d4f14bfa.mp4"];
        
        self.playerModel = [[ZFPlayerModel alloc] init];
        self.playerModel.videoURL = videoURL;
        self.playerModel.tableView = self.tableView;
        self.playerModel.indexPath = weakIndexPath;
        
        self.playerModel.cellImageViewTag = weakCell.bgImgView.tag;
        self.playerView.playerModel = self.playerModel;
        [self.playerView addPlayerToCellImageView:weakCell.bgImgView];
        [self.playerView autoPlayTheVideo];
    };
    
    return cell;
}

#pragma mark - lazy

- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}
- (ZFPlayerView *)playerView{
    
    if (_playerView == nil) {
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
        _playerView.controlView = controlView;
    }
    return _playerView;
}

@end
