//
//  ZEToolTbaleHeaderView.m
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEToolTbaleHeaderView.h"




@implementation ZEToolTbaleHeaderView




- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = hexColorString(@"808080");
        UIImageView * iconImageView = [[UIImageView alloc]init];
        [self addSubview:iconImageView];
        self.iconImageView = iconImageView;

        UILabel * titleLable = [UILabel new];
        titleLable.textColor = hexColorString(@"fcfcfc");
        [self addSubview:titleLable];
        self.titleLable = titleLable;
        
        iconImageView.sd_layout
        .leftSpaceToView(self,20)
        .widthIs(23)
        .heightIs(23)
        .centerYEqualToView(self);
        
        titleLable.sd_layout
    
        .leftSpaceToView(iconImageView,20)
        .heightIs(20)
        .centerYEqualToView(iconImageView);
        
      
    }
    return self;
}

- (void)setDoor:(ZEtoolTableHeaderModel *)door
{
    _door = door;
    self.titleLable.text = door.typeName;
    self.iconImageView.image = [UIImage imageNamed:door.iconName];
}

- (void)setHeaderModel:(ZEtoolTableHeaderModel *)headerModel
{
    _headerModel = headerModel;
    self.titleLable.text = headerModel.typeName;
    self.iconImageView.image = [UIImage imageNamed:headerModel.iconName];
}
@end
