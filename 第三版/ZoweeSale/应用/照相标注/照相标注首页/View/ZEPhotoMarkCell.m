//
//  ZEPhotoMarkCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 TH. All rights reserved.
//
#define actualHeight 667.0 * SCREEN_HEIGHT
#define actualWidth 375.0 * SCREEN_WIDTH

#import "ZEPhotoMarkCell.h"
#import "UILable+TH.h"
#import "THloginMessage.h"
@interface ZEPhotoMarkCell()
@property(nonatomic,strong)UIImageView * iconImgView;
@property(nonatomic,strong)UILabel * nameLab;
@property(nonatomic,strong)UILabel * dateLab;
@property(nonatomic,strong)UILabel * timeLab;
@property(nonatomic,strong)UIView * firstLine;
@property(nonatomic,strong)UIImageView * customerIcon;
@property(nonatomic,strong)UILabel * customerName;
@property(nonatomic,strong)UIView * secondLine;
@property(nonatomic,strong)UIView * thirdLine;
@property(nonatomic,strong)UIImageView * addressIcon;
@property(nonatomic,strong)UILabel * addressLab;
@property(nonatomic,strong)UIView * fourthLine;
@end
@implementation ZEPhotoMarkCell

- (void)setup{
    [super setup];
    [self setupUI];
    self.backgroundColor = hexColorString(@"f2f2f2");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupUI{
    
    UIView * cellView = self.contentView;
    UIView * firstBGView = [UIView new];
    firstBGView.backgroundColor = hexColorString(@"ffffff");
    [self.contentView addSubview:firstBGView];
    firstBGView.sd_layout
    .topEqualToView(cellView)
    .leftEqualToView(cellView)
    .rightEqualToView(cellView)
    .heightIs(74/actualHeight);
    
    _iconImgView = [UIImageView new];
    [firstBGView addSubview:_iconImgView];
    _iconImgView.image = [UIImage imageNamed:@"icon_head"];
    _iconImgView.sd_layout
    .leftSpaceToView(firstBGView,10/actualWidth)
    .topSpaceToView(firstBGView,12.5/actualHeight)
    .heightIs(49/actualHeight)
    .widthIs(49/actualWidth);
    
    _nameLab = [UILabel new];
    [firstBGView addSubview:_nameLab];
    _nameLab.font = [UIFont systemFontOfSize:17];
    _nameLab.textColor = hexColorString(@"2e2e2e");
    _nameLab.sd_layout
    .topSpaceToView(firstBGView,15/actualHeight)
    .leftSpaceToView(_iconImgView,10/actualWidth)
    .widthIs([_nameLab labelSizeWidth]);
    
    _dateLab = [UILabel new];
    [firstBGView addSubview:_dateLab];
    _dateLab.textColor = hexColorString(@"999999");
    _dateLab.font = [UIFont systemFontOfSize:12];
    _dateLab.sd_layout
    .leftEqualToView(_nameLab)
    .widthIs([_dateLab labelSizeWidth])
    .autoHeightRatio(0)
    .bottomSpaceToView(firstBGView,15/actualHeight);
    
    _timeLab = [UILabel new];
    [firstBGView addSubview:_timeLab];
    _timeLab.font = _dateLab.font;
    _timeLab.textColor = _dateLab.textColor;
    _timeLab.sd_layout
    .bottomSpaceToView(firstBGView,15/actualHeight)
    .leftSpaceToView(_dateLab,10)
    .autoHeightRatio(0)
    .widthIs([_timeLab labelSizeWidth]);
    
    _firstLine = [UIView new];
    _firstLine.backgroundColor = hexColorString(@"dbdbdb");
    [firstBGView addSubview:_firstLine];
    _firstLine.sd_layout
    .heightIs(0.5)
    .leftEqualToView(firstBGView)
    .rightEqualToView(firstBGView)
    .bottomSpaceToView(firstBGView,0);
    
    UIView * secondView = [UIView new];
    secondView.backgroundColor = firstBGView.backgroundColor;
    [cellView addSubview:secondView];
    secondView.sd_layout
    .topSpaceToView(firstBGView,2/actualHeight)
    .leftEqualToView(cellView)
    .rightEqualToView(cellView)
    .bottomSpaceToView(cellView,10/actualHeight);//heightIs(171/actualHeight);
    
    _customerIcon = [UIImageView new];
    _customerIcon.image = [UIImage imageNamed:@"icon_customer"];
    [secondView addSubview:_customerIcon];
    _customerIcon.sd_layout
    .leftSpaceToView(secondView,10)
    .topSpaceToView(secondView,8/actualHeight)
    .heightIs(16/actualHeight)
    .widthIs(16/actualWidth);
    
    NSInteger font = 15;
    if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPhone 5"]) {
        font = 12;
    }
    
    _customerName = [UILabel new];
    [secondView addSubview:_customerName];
    _customerName.font = [UIFont systemFontOfSize:font];
    _customerName.textColor = hexColorString(@"2e2e2e");
    _customerName.sd_layout
    .leftSpaceToView(_customerIcon,5)
    .topEqualToView(_customerIcon)
    .autoHeightRatio(0);
    
    _secondLine = [UIView new];
    _secondLine.backgroundColor = hexColorString(@"dbdbdb");
    [secondView addSubview:_secondLine];
    _secondLine.sd_layout
    .topSpaceToView(_customerIcon,8/actualHeight)
    .leftSpaceToView(secondView,10)
    .rightEqualToView(secondView)
    .heightIs(0.5);
    
    UIView * imgBgView = [UIView new];
    [secondView addSubview:imgBgView];
    imgBgView.sd_layout
    .topSpaceToView(_secondLine,15/actualHeight)
    .leftSpaceToView(secondView,35/actualWidth)
    .rightSpaceToView(secondView,35/actualHeight)
    .heightIs(75/actualHeight);
    
    //照片
    CGFloat imageWidth = 75/actualWidth;
    CGFloat imageHeight = 75/actualHeight;
    CGFloat margin = 40/actualWidth;
    for (int i = 0; i < 3; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * (imageWidth + margin), 0, imageWidth, imageHeight)];
        [imgBgView addSubview:imageView];
        //imageView.image = [UIImage imageNamed:@"Btn_+"];
        imageView.backgroundColor = [UIColor lightGrayColor];
    }
    
    _thirdLine = [UIView new];
    _thirdLine.backgroundColor = hexColorString(@"dbdbdb");
    [secondView addSubview:_thirdLine];
    _thirdLine.sd_layout
    .leftEqualToView(_secondLine)
    .rightEqualToView(secondView)
    .heightIs(0.5)
    .bottomSpaceToView(secondView,33/actualHeight);
    
    _addressIcon = [UIImageView new];
    _addressIcon.image = [UIImage imageNamed:@"icon_address"];
    [secondView addSubview:_addressIcon];
    _addressIcon.sd_layout
    .leftEqualToView(_thirdLine)
    .bottomSpaceToView(secondView,10/actualHeight)
    .heightIs(12)
    .widthIs(12);
    
    _addressLab = [UILabel new];
    _addressLab.font = [UIFont systemFontOfSize:12];
    _addressLab.textColor = hexColorString(@"999999");
    [secondView addSubview:_addressLab];
    _addressLab.sd_layout
    .bottomSpaceToView(secondView,10/actualHeight)
    .leftSpaceToView(_addressIcon,5/actualWidth)
    .autoHeightRatio(0);
    
    _fourthLine = [UIView new];
    _fourthLine.backgroundColor = hexColorString(@"dbdbdb");
    [secondView addSubview:_fourthLine];
    _fourthLine.sd_layout
    .bottomSpaceToView(secondView,0)
    .heightIs(0.5)
    .leftEqualToView(secondView)
    .rightEqualToView(secondView);
    
    _nameLab.text = @"伏羲";
    _dateLab.text = @"2016-06-12";
    _timeLab.text = @"15:00";
    _customerName.text = @"女娲";
    _addressLab.text = @"客户地址:成都市武侯区武青南路33号武侯创业中心";
    _nameLab.sd_layout.widthIs([_nameLab labelSizeWidth]);
    _dateLab.sd_layout.widthIs([_dateLab labelSizeWidth]);
    _timeLab.sd_layout.widthIs([_timeLab labelSizeWidth]);
    _customerName.sd_layout.widthIs([_customerName labelSizeWidth]);
    _addressLab.sd_layout.widthIs([_addressLab labelSizeWidth]);
}


@end
