//
//  ZEAboutUsViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAboutUsViewController.h"
#import "ZEServiceRuleViewController.h"

#import "ZEWebViewController.h"

@interface ZEAboutUsViewController ()

@property (nonatomic,weak) UILabel * versionLabel;

@property(nonatomic,copy) NSString * versionNumber;

@end

@implementation ZEAboutUsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSections];
    [self initUI];
}




- (void)initUI
{
    UIView * header = [[UIView alloc]init];
    header.backgroundColor = ZECustomerGlobalBackgroudColor
    header.frame = CGRectMake(0, 0, self.view.width, 135);
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Version"]];
    [header addSubview:imageView];
    UILabel * label = [[UILabel alloc]init];
    label.textColor = hexColorString(@"c81c1c");
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.versionNumber;
    self.versionLabel = label;
    [header addSubview:label];
    
    
    imageView.sd_layout
    .centerXEqualToView(header)
    .centerYEqualToView(header);
    
    label.sd_layout
    .bottomSpaceToView(header,0)
    .heightIs(35)
    .widthIs(97)
    .leftEqualToView(imageView);
    
    self.tableView.tableHeaderView.height = 135;
    self.tableView.tableHeaderView = header;
}
- (void)addSections
{
    ZEItem * item1 = [[ZENoSubtitleItem alloc]initWithIcon:nil title:@"企业网站" destClass:[ZEWebViewController class]];
  
    ZEItem * item2 = [[ZENoSubtitleItem alloc]initWithIcon:nil title:@"服务条款" destClass:[ZEServiceRuleViewController class]];
    ZESetGroup * g1 = [[ZESetGroup alloc]init];
    g1.items = @[item1,item2];
    [self.data addObject:g1];
}

#pragma mark - 懒加载
-(NSString *)versionNumber
{
    if ( _versionNumber == nil) {
        //   版本号的关键字为 CFBundleVersion
        NSString * versionkey =@"CFBundleShortVersionString";
        //    获取当前打开软件时的版本号（info.plist）
        NSString *currentVersion=[NSBundle mainBundle].infoDictionary[versionkey];
        _versionNumber = currentVersion;
    }
    return _versionNumber;
}

@end
