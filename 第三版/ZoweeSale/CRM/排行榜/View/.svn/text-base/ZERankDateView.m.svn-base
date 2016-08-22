//
//  ZERankDateView.m
//  ZoweeSale
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERankDateView.h"
#import "ZERankDateList.h"
#import "NSDate+string.h"
#import "UIButton+Extension.h"

#import "HZURLNavigation.h"
@implementation ZERankDateView
{
    ZERankDateList* _dateVC;
    UIView * _bgView;
    UIButton * _dateBtn;
}
- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:@"rankListDateChange" object:nil];
    
    self.backgroundColor = hexColorString(@"cccccc");
    
    _dateBtn = [UIButton new];
    [self addSubview:_dateBtn];
    NSString * date = [NSDate stringtodayYandMandD];
    NSArray * dateArr = [date componentsSeparatedByString:@"-"];
    if([dateArr[1] rangeOfString:@"0"].length != 0){
        NSString * month = [dateArr[1] substringFromIndex:1];
        _dateBtn.title = [NSString stringWithFormat:@"%@年%@月",dateArr[0],month];
    }else{
        _dateBtn.title = [NSString stringWithFormat:@"%@年%@月",dateArr[0],dateArr[1]];
    }
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
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)dateChanged:(NSNotification*)note
{
    _dateBtn.title = [NSString stringWithFormat:@"%@年%@月",note.userInfo[@"year"],note.userInfo[@"month"]];
}

#pragma mark - 点击事件
- (void)pickDate{
    
    if (_dateVC) {
        _dateVC.alpha = 1;
    }else{
        _dateVC = [[ZERankDateList alloc]init];
        [[HZURLNavigation currentViewController].view addSubview:_dateVC];
    }
}

@end
