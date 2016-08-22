//
//  ZEPickDateView.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPickDateView.h"
#import "NSDate+string.h"
#import "UIButton+Extension.h"
#import "ZEDatePickerView.h"
#import "HZURLNavigation.h"
@implementation ZEPickDateView
{
    ZEDatePickerView* _datePickerVC;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:@"paybackDateChange" object:nil];

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
    
    if (_datePickerVC) {
        _datePickerVC.alpha = 1;
    }else{
        //    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        //    _bgView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0];
        //    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePickDate)];
        //[_bgView addGestureRecognizer:tapGes];
        //[[UIApplication sharedApplication].keyWindow addSubview:_bgView];
        _datePickerVC = [[ZEDatePickerView alloc]init];
        [[HZURLNavigation currentViewController].view addSubview:_datePickerVC];
        //[_bgView addSubview:_vc];
    }
}

- (void)closePickDate{
   // [_bgView removeFromSuperview];
}

@end
