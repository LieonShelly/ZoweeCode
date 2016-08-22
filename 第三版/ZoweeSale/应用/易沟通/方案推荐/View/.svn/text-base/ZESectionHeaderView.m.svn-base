//
//  ZESectionHeaderView.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESectionHeaderView.h"


@interface ZESectionHeaderView()
@property (strong, nonatomic)  ZEheaderBtn *styBtn;
@property (weak, nonatomic)  UIImageView *styleIV;

@property (strong, nonatomic)  ZEheaderBtn *typeBtn;
@property (weak, nonatomic)  UIImageView *typeIV;


@property (weak, nonatomic)  UIImageView *roomIv;
@property (strong, nonatomic) ZEheaderBtn *roomBtn;
@property (nonatomic,weak)  UIButton * selectedBtn;

@end

@implementation ZESectionHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.styBtn.tag = ZESectionHeaderViewBtnTypeStyle;
    self.typeBtn.tag = ZESectionHeaderViewBtnTypeHouseType;
    self.roomBtn.tag = ZESectionHeaderViewBtnTypeRoomType;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self ) {
        
        self.backgroundColor = hexColorString(@"f2f2f2");
        [self addSubview:self.styBtn];
        [self addSubview:self.typeBtn];
        [self addSubview:self.roomBtn];
        [self.styBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(80);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        [self.typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.styBtn.mas_right).offset(50);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        [self.roomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.typeBtn.mas_right).offset(50);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
    }
    return self;
}


- (void)setSelectedStyleModel:(ZETagModel *)selectedStyleModel
{
    _selectedStyleModel = selectedStyleModel;
    [self.styBtn setTitle:selectedStyleModel.Title forState:UIControlStateNormal];
    [self.styBtn sizeToFit];
    [self.styBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.styBtn.width + 17);
    }];
}

- (void)setSelectedHourseTypeModel:(ZETagModel *)selectedHourseTypeModel
{
    _selectedHourseTypeModel = selectedHourseTypeModel;
      [self.typeBtn setTitle:selectedHourseTypeModel.Title forState:UIControlStateNormal];
    [self.typeBtn sizeToFit];
    [self.typeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.typeBtn.width + 17);
    }];
}

- (void)setSelectedRoomTypeModel:(ZETagModel *)selectedRoomTypeModel
{
    _selectedRoomTypeModel = selectedRoomTypeModel;
    [self.roomBtn setTitle:selectedRoomTypeModel.Title forState:UIControlStateNormal];
    [self.roomBtn sizeToFit];
    
    [self.roomBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.roomBtn.width + 17);
    }];
    
}
- (ZEheaderBtn *)styBtn
{
    if (_styBtn == nil) {
        _styBtn = [[ZEheaderBtn alloc]init];
        [_styBtn  setTitle:@"风格" forState:UIControlStateNormal];
        [_styBtn addTarget:self action:@selector(stylrBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _styBtn.tag = ZESectionHeaderViewBtnTypeStyle;
        
        

    }
    return _styBtn;
}

- (ZEheaderBtn *)typeBtn
{
    if (_typeBtn == nil) {
        _typeBtn = [[ZEheaderBtn alloc]init];
        [_typeBtn  setTitle:@"户型" forState:UIControlStateNormal];
        [_typeBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _typeBtn.tag = ZESectionHeaderViewBtnTypeHouseType;
    }
    return _typeBtn;
}

- (ZEheaderBtn *)roomBtn
{
    if (_roomBtn == nil) {
        _roomBtn = [[ZEheaderBtn alloc]init];
        [_roomBtn  setTitle:@"空间" forState:UIControlStateNormal];
        [_roomBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _roomBtn.tag = ZESectionHeaderViewBtnTypeRoomType;
    }
    return _roomBtn;
}
- (void)stylrBtnClick:(UIButton*)sender
{

    if ([self.delegate respondsToSelector:@selector(sectionHeaderView:DidClickBtn:)]) {
        [self.delegate sectionHeaderView:self DidClickBtn:sender.tag];
    }
}

- (void)typeBtnClick:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(sectionHeaderView:DidClickBtn:)]) {
        [self.delegate sectionHeaderView:self DidClickBtn:sender.tag];
    }
}
- (void)roomBtnClick:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(sectionHeaderView:DidClickBtn:)]) {
        [self.delegate sectionHeaderView:self DidClickBtn:sender.tag];
    }
}


@end


@implementation ZEheaderBtn


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.size = CGSizeMake(12, 16);
    self.titleLabel.frame = CGRectMake(0,0, self.width - self.imageView.width -5, self.height);
    self.imageView.origin = CGPointMake(self.titleLabel.width + 5, self.height * 0.5);
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [ super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"recommand_arrow_down"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont systemFontOfSize:15]];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
