//
//  ZEYearTargetView.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEYearTargetView.h"
#import "NSDate+string.h"
#import "UIButton+Extension.h"
#import "UILable+TH.h"
#import "HZURLNavigation.h"
@interface ZEYearTargetView()
@property(nonatomic,strong)NSArray * yearArr;
@end

@implementation ZEYearTargetView
{
    UILabel * _totalLab;
    UIButton * _totalBtn;
    UIView * _dateView;
    UIButton * _dateBtn;
    UIView * _bgView;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

- (NSArray *)yearArr{
    if (!_yearArr) {
        _yearArr = @[@2016,@2017,@2018,@2019,@2020];
    }
    return _yearArr;
}

- (void)setupUI{
  
    self.backgroundColor = hexColorString(@"cccccc");
    _dateBtn = [UIButton new];
    [self addSubview:_dateBtn];
    NSString * date = [NSDate stringtodayYandMandD];
    NSArray * dateArr = [date componentsSeparatedByString:@"-"];
    _dateBtn.title = [NSString stringWithFormat:@"%@.01-%@.12",dateArr[0],dateArr[0]];
    
    _dateBtn.titleColor = hexColorString(@"2e2e2e");
    [_dateBtn setImage:[UIImage imageNamed:@"littleArrow"] forState:UIControlStateNormal];
    _dateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _dateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    _dateBtn.imageEdgeInsets = UIEdgeInsetsMake(0, _dateBtn.titleSizeWidth + 14, 0, 0);
    [_dateBtn addTarget:self action:@selector(pickDate)];
    _dateBtn.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self,0)
    .widthIs(_dateBtn.titleSizeWidth + 30)
    .bottomEqualToView(self);
    
    _totalBtn = [UIButton new];
    _totalBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _totalBtn.titleColor = hexColorString(@"2e2e2e");
    _totalBtn.title = @"全店";
    [self addSubview:_totalBtn];
    _totalBtn.sd_layout
    .topEqualToView(self)
    .centerXEqualToView(self)
    .widthIs(_totalBtn.titleSizeWidth)
    .bottomEqualToView(self);
    
    _totalLab = [UILabel new];
    [self addSubview:_totalLab];
    _totalLab.font = [UIFont systemFontOfSize:14];
    _totalLab.textColor = hexColorString(@"2e2e2e");
    _totalLab.sd_layout
    .rightSpaceToView(self,10)
    .topEqualToView(self)
    .widthIs([_totalLab labelSizeWidth])
    .bottomEqualToView(self);
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _totalLab.text = [NSString stringWithFormat:@"%.2f",[_totalAmount doubleValue]];
    _totalLab.sd_layout.widthIs([_totalLab labelSizeWidth]);
    if([self.Type integerValue] == 1){
        _totalBtn.title = @"全店";
    }else{
        _totalBtn.title = @"个人";
    }
}

- (void)pickDate{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _bgView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0];
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePickDate)];
    [_bgView addGestureRecognizer:tapGes];
    [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
    _dateView= [UIView new];
    _dateView.backgroundColor = hexColorString(@"666666");
    _dateView.frame = CGRectMake(0, 100, 115, 150);
    [_bgView addSubview:_dateView];
    for(int i = 0;i < self.yearArr.count;i ++){
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i * 150/5, 115, 150/5)];
        [_dateView addSubview:btn];
        btn.titleColor = hexColorString(@"999999");
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.title = [NSString stringWithFormat:@"%@.01-%@.12",_yearArr[i],_yearArr[i]];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(yearChange:)];
    }
}

- (void)closePickDate{
    [_bgView removeFromSuperview];
}

- (void)yearChange:(UIButton *)sender{
    
    NSString * title;
    [_bgView removeFromSuperview];
    switch (sender.tag) {
        case 100:
            title = @"2016";
            break;
        case 101:
            title = @"2017";
            break;
        case 102:
            title = @"2018";
            break;
        case 103:
            title = @"2019";
            break;
        case 104:
            title = @"2020";
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"dateChange" object:title];
    
    _dateBtn.title = [NSString stringWithFormat:@"%@.01-%@.12",title,title];
    [self setNeedsLayout];
}

@end
