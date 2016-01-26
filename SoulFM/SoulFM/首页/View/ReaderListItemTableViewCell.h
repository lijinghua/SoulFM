//
//  ReaderListItemTableViewCell.h
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReaderContentListModel.h"

@interface ReaderListItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *dianTaiLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

- (void)updateUIWith:(ReaderContentListModel*)model;

@end
