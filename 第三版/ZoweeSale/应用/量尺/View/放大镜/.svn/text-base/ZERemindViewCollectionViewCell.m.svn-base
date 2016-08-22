//
//  ZERemindViewCollectionViewCell.m
//  ZoweeSale
//
//  Created by lieon on 16/7/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERemindViewCollectionViewCell.h"

@interface ZERemindViewCollectionViewCell ()
@property (nonatomic ,strong) UIImageView * imageView;
@property (nonatomic ,strong) UILabel * label;
@property (nonatomic ,strong) UISwitch * switchBtn;

@end
@implementation ZERemindViewCollectionViewCell

#pragma mark - 懒加载

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        
    }
    return _imageView;
}

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}

- (UISwitch *)switchBtn
{
    if(_switchBtn == nil){
        _switchBtn = [[UISwitch alloc]init];
       
        [_switchBtn addTarget:self action:@selector(switchBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchBtn;
}

#pragma mark - 私有方法

- (void)setupLayoutImageViewAndLabel
{
    [self.switchBtn removeFromSuperview];
    self.imageView.image = [UIImage imageNamed:self.appModel.iconName];
    [self.imageView sizeToFit];
    
    [self.label sizeToFit];
    self.imageView.sd_layout
    .topSpaceToView(self.contentView,0)
    .centerXEqualToView(self.contentView)
    .widthIs(60)
    .heightIs(75);
    
    self.label.sd_layout
    .bottomSpaceToView(self.contentView,30)
    .heightIs(self.label.height)
    .centerYEqualToView(self.imageView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView);
}

- (void)setupSwitchBtnAndLabel
{
    
    [self.imageView removeFromSuperview];
    [self.label sizeToFit];
    self.label.sd_layout
    .leftSpaceToView(self.contentView,0)
    .centerYEqualToView(self.contentView)
    .widthIs(self.label.width)
    .heightIs(self.label.height);
    
    self.switchBtn.sd_layout
    .centerYEqualToView(self.label)
    .leftSpaceToView(self.label,5);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.switchBtn.on =[defaults boolForKey:self.appModel.title];
    [defaults setBool:self.switchBtn.on forKey:self.appModel.title];
    [defaults synchronize];
    NSLog(@"%@:%d",self.appModel.title,[defaults boolForKey:self.appModel.title ]);

}

- (void)switchBtnCLick
{
//    NSLog(@"switchBtnCLick:%d",self.switchBtn.on);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchBtn.on forKey:self.appModel.title];
    [defaults synchronize];
    NSLog(@"%@:%d",self.appModel.title,[defaults boolForKey:self.appModel.title ]);
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.switchBtn];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma publickMethod

- (void)setAppModel:(APPIndexModel *)appModel
{
    _appModel = appModel;
    self.label.text = self.appModel.title;
    if (!self.isLastSection ) {
        [self setupLayoutImageViewAndLabel];
    }else{
        [self setupSwitchBtnAndLabel];
    }
}


@end
