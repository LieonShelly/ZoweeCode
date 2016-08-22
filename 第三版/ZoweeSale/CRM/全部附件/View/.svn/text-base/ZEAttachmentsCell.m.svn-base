//
//  ZEAttachmentsCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAttachmentsCell.h"
#import "UIImageView+WebCache.h"
#import "UILable+TH.h"

@implementation ZEAttachmentsCell{
    UILabel *nameLab;
    UILabel *timeLab;
    UILabel *sizeLab;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setup{
    [super setup];
    self.backgroundColor = [UIColor clearColor];
    self.imageview = [UIImageView new];
    self.imageview.image = [UIImage imageNamed:@"附件默认图"];
    UIView *contentView = self.contentView;
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:backView];
    backView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(5, 10, 5, 10));
    
    [backView addSubview:self.imageview];
    self.imageview.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(backView,15)
    .centerYEqualToView(backView)
    .topSpaceToView(backView,15)
    .bottomSpaceToView(backView,15)
    .widthEqualToHeight();
    backView.sd_cornerRadius = @5;
    
    nameLab = [UILabel new];
    nameLab.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [backView addSubview:nameLab];
    nameLab.sd_layout
    .topEqualToView(self.imageview)
    .leftSpaceToView(self.imageview,20)
    .heightIs(nameLab.font.lineHeight)
    .rightSpaceToView(backView,10);
    
    timeLab = [UILabel new];
    timeLab.font = [UIFont systemFontOfSize:15];
    timeLab.textColor = hexColorString(@"666666");
    [backView addSubview:timeLab];
    timeLab.sd_layout
    .bottomEqualToView(self.imageview)
    .leftEqualToView(nameLab)
    .heightIs(timeLab.font.lineHeight)
    .widthIs(10);
    
    sizeLab = [UILabel new];
    sizeLab.font = [UIFont systemFontOfSize:15];
    sizeLab.textColor = hexColorString(@"666666");
    [backView addSubview:sizeLab];
    sizeLab.sd_layout
    .centerYEqualToView(timeLab)
    .rightSpaceToView(backView,30)
    .widthIs(10)
    .heightIs(sizeLab.font.lineHeight);

    
}

- (void)setAttachment:(ZEAttachment *)attachment{
    _attachment = attachment;
    nameLab.text = attachment.FileName;
   // nameLab.sd_layout.widthIs([nameLab labelSizeWidth]);
    timeLab.text = attachment.CreateTime;
    timeLab.sd_layout.widthIs([timeLab labelSizeWidth]);
    sizeLab.text = [NSString stringWithFormat:@"%@K",attachment.FileSize];
    sizeLab.sd_layout.widthIs([sizeLab labelSizeWidth]);
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:attachment.ThumbnailPath] placeholderImage:[UIImage imageNamed:@"附件默认图"]];
}

@end
