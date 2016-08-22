//
//  detailedListCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "detailedListCell.h"

@interface detailedListCell()


@end

@implementation detailedListCell{
    UILabel *contextLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [super setup];
    UILabel *textLab = [UILabel new];
    textLab.font = [UIFont systemFontOfSize:15];
    textLab.textColor = hexColorString(@"666666");
    [self.customerView addSubview:textLab];
    textLab.sd_layout
    .leftEqualToView(self.customerView)
    .topSpaceToView(self.customerView,25)
    .rightEqualToView(self.customerView)
    .heightIs(textLab.font.lineHeight);
    contextLab = textLab;
    
    [self.customerView setupAutoHeightWithBottomView:textLab bottomMargin:15];}


- (void)setText:(NSString *)text {
    _text = text;
     contextLab.text = text;
}

@end
