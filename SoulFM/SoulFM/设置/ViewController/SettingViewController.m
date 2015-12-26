//
//  SettingViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingTimerTableViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"设置";
    self.tableView.frame = CGRectMake(10, 0, kScreenWidth-20, kScreenHeight-64-49);
    self.tableView.estimatedRowHeight = 44;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


- (void)customTableViewCell{
    UINib *nib = [UINib nibWithNibName:@"SettingTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cellId"];
    UINib *nib2 = [UINib nibWithNibName:@"SettingTimerTableViewCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"timerCellId"];
}

- (void)updateCell:(SettingTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0 ) {
        [cell updateImage:@"fm50.png" title:@"立即登陆"];
    }else if(indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            [cell updateImage:@"setTime" title:@"心情闹钟"];
        }
    }else if(indexPath.section == 2)
    {
        [cell updateImage:@"clearImage" title:@"清理图片缓存"];
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            [cell updateImage:@"_0003_share" title:@"分享给好友"];
        }else if(indexPath.row == 1){
            [cell updateImage:@"_0004_collect" title:@"亲~给一好评"];
        }else if(indexPath.row == 2){
            [cell updateImage:@"_0000_pen" title:@"意见反馈"];
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        return 3;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 1) {
        SettingTimerTableViewCell *timerCell = [self.tableView dequeueReusableCellWithIdentifier:@"timerCellId" forIndexPath:indexPath];
        return timerCell;

    }
    SettingTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    [self updateCell:cell atIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 1) {
        return 96;
    }
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
