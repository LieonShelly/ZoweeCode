//
//  ZEcustomerHeaderView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcustomerHeaderView.h"
#import "UIButton+Extension.h"
#import "UILable+TH.h"
#import "UIImageView+WebCache.h"
#import "NSDate+string.h"
#import "HZURLNavigation.h"
#import "customerMapAddressViewController.h"
@interface ZEcustomerHeaderView()

//@property (nonatomic) CGFloat height;

@end

@implementation ZEcustomerHeaderView{
    UIButton *_customerNameBtn;
    UIButton *_mapBtn;
    UIImageView *_customerImage;
    UILabel *_dayNumLab;
    UILabel *_statusLab;
    UILabel *timeLab;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithMaxHeight:(CGFloat)height{
    self = [super init];
    if (self) {
        [self uiSet];
    }
    return self;
}

- (void)setDetail:(customerDetail *)detail{
    _detail = detail;
    //self.backgroundColor = [UIColor redColor];
    [self show];
}


- (void)uiSet{
    self.backgroundColor = hexColorString(@"d45758");
    self.hidden = YES;
    self.layer.masksToBounds = YES;
    _customerNameBtn = [UIButton new];
    _customerNameBtn.titleColor = [UIColor whiteColor];
    _customerNameBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_customerNameBtn];
    _customerNameBtn.sd_layout
    .topSpaceToView(self,15)
    .leftSpaceToView(self,20)
    .heightIs(20)
    .widthIs(100);
    
    _mapBtn = [UIButton new];
    _mapBtn.titleColor = [UIColor whiteColor];
    _mapBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _mapBtn.title = @"地图";
    _mapBtn.image = @"地图";
    [_mapBtn addTarget:self action:@selector(mapBtnClick)];
    [self addSubview:_mapBtn];
    _mapBtn.sd_layout
    .topSpaceToView(self,15)
    .rightSpaceToView(self,15)
    .heightIs(20)
    .widthIs(55);
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [self addSubview:backView];
    backView.sd_layout
    .topSpaceToView(_mapBtn,30)
    .leftSpaceToView(self,55)
    .rightSpaceToView(self,55)
    .heightIs(55);
    backView.sd_cornerRadiusFromHeightRatio = @0.5;
    
    UIView *headView =[UIView new];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    headView.sd_layout
    .topEqualToView(backView)
    .leftEqualToView(backView)
    .bottomEqualToView(backView)
    .widthEqualToHeight();
    headView.sd_cornerRadiusFromWidthRatio = @0.5;
    _customerImage = [[UIImageView alloc]init];
    [headView addSubview:_customerImage];
    _customerImage.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(2, 2, 2, 2));
    _customerImage.sd_cornerRadiusFromWidthRatio= @0.5;
    
    UILabel *time = [UILabel new];
    time.text = @"我们相识";
    time.font = [UIFont systemFontOfSize:15];
    time.textColor = [UIColor whiteColor];
    [backView addSubview:time];
    time.sd_layout
    .topSpaceToView(backView,5)
    .centerXEqualToView(backView)
    .widthIs([time labelSizeWidth])
    .heightIs(time.font.lineHeight);
    
    timeLab = [UILabel new];
    timeLab.font = [UIFont systemFontOfSize:15];
    timeLab.textColor = [UIColor whiteColor];
    [backView addSubview:timeLab];
    timeLab.sd_layout
    .topSpaceToView(time,5)
    .centerXEqualToView(backView)
    .heightIs(timeLab.font.lineHeight);
    
    
    UIView *stateView = [UIView new];
    stateView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:stateView];
    stateView.sd_layout
    .topEqualToView(backView)
    .rightEqualToView(backView)
    .bottomEqualToView(backView)
    .widthRatioToView(headView,1);
    stateView.sd_cornerRadiusFromHeightRatio = @0.5;
    
    UIView *colorView = [UIView new];
    colorView.backgroundColor = hexColorString(@"E8A38F");
    [stateView addSubview:colorView];
    colorView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(2, 2, 2, 2));
    colorView.sd_cornerRadiusFromWidthRatio = @0.5;
    
    UILabel *lab = [UILabel new];
    lab.text = @"当前状态";
    lab.font = [UIFont systemFontOfSize:10];
    [colorView addSubview:lab];
    lab.sd_layout
    .topSpaceToView(colorView,10)
    .centerXEqualToView(colorView)
    .widthIs([lab labelSizeWidth])
    .heightIs(lab.font.lineHeight);
    
    _statusLab = [UILabel new];
    _statusLab.font = [UIFont systemFontOfSize:12];
    [colorView addSubview:_statusLab];
    _statusLab.sd_layout
    .topSpaceToView(lab,5)
    .centerXEqualToView(lab)
    .heightIs(_statusLab.font.lineHeight);
    
}

- (void)show{
    self.hidden = NO;
    _customerNameBtn.title = _detail.CustomerName;
    _customerNameBtn.sd_layout.widthIs([_customerNameBtn titleSizeWidth]);
    [_customerImage sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"头像"]];
   // [self stateStrName:_detail.State];
    _statusLab.text = _detail.State;
    _statusLab.sd_layout.widthIs([_statusLab labelSizeWidth]);
    [self timeLabText:_detail.CreateTime];
}
- (void)timeLabText:(NSString *)time{
    if(!time) {
        timeLab.text = @"0天";
    }else {
        timeLab.text = [NSString stringWithFormat:@"%@天",[NSDate dateArrivaltodaynumberString:time]];
    }
    timeLab.sd_layout.widthIs([timeLab labelSizeWidth]);
}
- (void)mapBtnClick{
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};
    pt.latitude = [self.detail.PointX floatValue];
    pt.longitude = [self.detail.PointY floatValue];
    if (self.detail.PointY && self.detail.PointY) {
        customerMapAddressViewController *mapController = [[customerMapAddressViewController alloc]init];
        mapController.customerPt = pt;
        mapController.customerAddress = self.detail.Address;
        [[HZURLNavigation currentNavigationViewController] pushViewController:mapController animated:YES];
    }
}

@end
