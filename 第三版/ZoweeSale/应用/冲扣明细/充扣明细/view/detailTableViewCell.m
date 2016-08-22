//
//  detailTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "detailTableViewCell.h"
#import "ZEAccountLabel.h"
@interface detailTableViewCell()
@property (weak, nonatomic) IBOutlet ZEAccountLabel *firstDetailLab;
@property (weak, nonatomic) IBOutlet ZEAccountLabel *secondDetailLab;

@end

@implementation detailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setupUI{
    self.backgroundColor = hexColorString(@"f5f2f2");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _firstDetailLab.textColor = hexColorString(@"4c4c4c");
    _secondDetailLab.textColor = _firstDetailLab.textColor;
    [_firstDetailLab setVerticalAlignment:VerticalAlignmentBottom];
    [_secondDetailLab setVerticalAlignment:VerticalAlignmentBottom];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _firstDetailLab.text = _title;
}

- (void)setDetail:(NSString *)detail{
    _detail = detail;
    _secondDetailLab.text = _detail;
}

@end
