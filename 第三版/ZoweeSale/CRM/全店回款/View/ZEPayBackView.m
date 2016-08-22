//
//  ZEPayBackView.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPayBackView.h"
#import "ZEAccountLabel.h"
#import "UILable+TH.h"
#import "ZFChart.h"
#import "NSDate+string.h"
#import "UIButton+Extension.h"
@interface ZEPayBackView()<ZFGenericChartDataSource, ZFBarChartDelegate>

@end

@implementation ZEPayBackView
{
    ZEAccountLabel * _monthLab;
    ZEAccountLabel * _targetLab;
    ZEAccountLabel * _dealLab;
    ZEAccountLabel * _paybackLab;
    ZEAccountLabel * _ratioLab;
    ZFBarChart * _barChart;
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:@"paybackDateChange" object:nil];
    
    _monthLab = [ZEAccountLabel new];
    _monthLab.verticalAlignment = VerticalAlignmentBottom;
    [self addSubview:_monthLab];
    _monthLab.textColor = hexColorString(@"2e2e2e");
    _monthLab.font = [UIFont systemFontOfSize:15];
    _monthLab.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self,10)
    .rightEqualToView(self)
    .heightIs(40);
    
    _targetLab = [ZEAccountLabel new];
    [self addSubview:_targetLab];
    _targetLab.verticalAlignment = VerticalAlignmentBottom;
    _targetLab.textColor = hexColorString(@"666666");
    _targetLab.font = [UIFont systemFontOfSize:15];
    _targetLab.sd_layout
    .topSpaceToView(_monthLab,0)
    .leftEqualToView(_monthLab)
    .rightEqualToView(self)
    .heightIs(25);
    
    _dealLab = [ZEAccountLabel new];
    _dealLab.verticalAlignment = VerticalAlignmentBottom;
    [self addSubview:_dealLab];
    _dealLab.font = _targetLab.font;
    _dealLab.textColor = _targetLab.textColor;
    _dealLab.sd_layout
    .topSpaceToView(_targetLab,0)
    .leftEqualToView(_targetLab)
    .rightEqualToView(self)
    .heightIs(25);
    
    _paybackLab = [ZEAccountLabel new];
    _paybackLab.verticalAlignment = VerticalAlignmentBottom;
    [self addSubview:_paybackLab];
    _paybackLab.textColor = _targetLab.textColor;
    _paybackLab.font = _targetLab.font;
    _paybackLab.sd_layout
    .topSpaceToView(_dealLab,0)
    .leftEqualToView(_targetLab)
    .rightEqualToView(self)
    .heightIs(25);
    
    ZEAccountLabel * noteLab = [ZEAccountLabel new];
    noteLab.verticalAlignment = VerticalAlignmentBottom;
    [self addSubview:noteLab];
    noteLab.text = @"(回款金额/签约金额)";
    noteLab.textColor = hexColorString(@"666666");
    noteLab.font = [UIFont systemFontOfSize:12];
    noteLab.sd_layout
    .bottomEqualToView(_paybackLab)
    .rightSpaceToView(self,10)
    .widthIs([noteLab labelSizeWidth])
    .heightIs(15);
    
    _ratioLab = [ZEAccountLabel new];
    _ratioLab.textAlignment = NSTextAlignmentCenter;
    _ratioLab.verticalAlignment = VerticalAlignmentBottom;
    [self addSubview:_ratioLab];
    _ratioLab.font = [UIFont systemFontOfSize:18];
    _ratioLab.textColor = hexColorString(@"fa5a5a");
    _ratioLab.sd_layout
    .rightEqualToView(noteLab)
    .bottomSpaceToView(noteLab,0)
    .widthIs([noteLab labelSizeWidth])
    .heightIs(25);
    
    UIView * line = [UIView new];
    line.backgroundColor = hexColorString(@"666666");
    [self addSubview:line];
    line.sd_layout
    .topSpaceToView(_paybackLab,15)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
    
    NSString * date = [NSDate stringtodayYandMandD];
    NSArray * dateArr = [date componentsSeparatedByString:@"-"];
    if([dateArr[1] rangeOfString:@"0"].length != 0){
        NSString * month = [dateArr[1] substringFromIndex:1];
        _monthLab.text = [NSString stringWithFormat:@"%@月",month];
    }else{
        _monthLab.text = [NSString stringWithFormat:@"%@月",dateArr[1]];
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)dateChanged:(NSNotification*)note
{
    _monthLab.text = [NSString stringWithFormat:@"%@月",note.userInfo[@"month"]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setModel:(ZEPayBackModel *)model{
    [_barChart removeFromSuperview];
    _model = model;
    _targetLab.text = [NSString stringWithFormat:@"本月目标: %@",model.TargetMoney];
    _dealLab.text = [NSString stringWithFormat:@"本月签单额: %@",model.sumDeal];
    _paybackLab.text = [NSString stringWithFormat:@"本月回款额: %@",model.HuiKuan];
    double result = [model.HuiKuan doubleValue]/[model.sumDeal doubleValue];
    if (!isnan(result) && !isinf(result)) {
         _ratioLab.text = [NSString stringWithFormat:@"%.0f%s",result * 100,"%"];
    }else{
        _ratioLab.text = @"0%";
    }
    //报表
    CGFloat width = 250;
    CGFloat x = (SCREEN_WIDTH - width)/2;
    CGFloat y = 166 + 40;
    _barChart = [[ZFBarChart alloc]initWithFrame:CGRectMake(x, y, width, width)];
    _barChart.backgroundColor = [UIColor clearColor];
    _barChart.userInteractionEnabled = NO;
    [self addSubview:_barChart];
    [self setupBarChart];
}

#pragma mark - 报表相关
- (void)setupBarChart{
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    _barChart.unit = @"万";
    _barChart.valueLabelPattern = kPopoverLabelPatternBlank;//无气泡
    _barChart.isShadow = NO; //无阴影
    _barChart.unitColor = hexColorString(@"999999");
    _barChart.axisLineNameColor = hexColorString(@"999999");
    _barChart.axisLineValueColor = hexColorString(@"999999");
    _barChart.axisColor = hexColorString(@"999999");
    _barChart.separateColor = hexColorString(@"999999");
    _barChart.isAnimated = YES;
    [_barChart strokePath];
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    NSString * target = [NSString stringWithFormat:@"%.2f",[_model.TargetMoney doubleValue]/10000];
    
    NSString * deal = [NSString stringWithFormat:@"%.2f",[_model.sumDeal doubleValue]/10000];
    NSString * payback = [NSString stringWithFormat:@"%.2f",[_model.HuiKuan doubleValue]/10000];
    
    return @[target, deal, payback];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"指标", @"成交", @"回款"];
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[hexColorString(@"fa7373"),hexColorString(@"4fd2c2"),hexColorString(@"ffb228")];
}

- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
    return 30;
}

- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
    return 35;
}

- (NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 5;
}

@end
