//
//  ZEAnalyzeCell.m
//  ZoweeSale
//
//  Created by apple on 16/7/1.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAnalyzeCell.h"
#import "ZEPayBackViewController.h"
#import "HZURLNavigation.h"
#import "YYKit.h"

@implementation ZEAnalyzeCell

- (void)setup{
    [super setup];
    [self setupUI];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupUI{
    NSMutableArray *paths = [NSMutableArray new];
    [paths addObject:UIImagePNGRepresentation([UIImage imageNamed:@"image_1"])];
    [paths addObject:UIImagePNGRepresentation([UIImage imageNamed:@"image_2"])];
    [paths addObject:UIImagePNGRepresentation([UIImage imageNamed:@"image_3"])];
    UIImage *image = [[YYFrameImage alloc] initWithImageDataArray:paths oneFrameDuration:0.1 loopCount:1];

    YYAnimatedImageView * shop = [[YYAnimatedImageView alloc] initWithImage:image];
    shop.backgroundColor = hexColorString(@"f5f2f3");
    [self addSubview:shop];
    shop.sd_layout
    .topSpaceToView(self,15)
    .leftSpaceToView(self,15)
    .widthIs((SCREEN_WIDTH-45) / 2.0)
    .bottomSpaceToView(self,25);
    shop.tag = 100;
    
    YYAnimatedImageView * personal = [[YYAnimatedImageView alloc] initWithImage:image];
    personal.backgroundColor = hexColorString(@"f5f2f3");
    personal.tag = 200;
    [self addSubview:personal];
    personal.sd_layout
    .topSpaceToView(self,15)
    .rightSpaceToView(self,15)
    .widthRatioToView(shop,1)
    .heightRatioToView(shop,1);
    
    UILabel * shopLab = [UILabel new];
    shopLab.text = @"全店报表";
    shopLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:shopLab];
    shopLab.sd_layout
    .topSpaceToView(shop,5)
    .centerXEqualToView(shop)
    .widthRatioToView(shop,1)
    .heightIs(15);
    
    UILabel * personalLab = [UILabel new];
    personalLab.textAlignment = NSTextAlignmentCenter;
    personalLab.text = @"个人报表";
    [self addSubview:personalLab];
    personalLab.sd_layout
    .topSpaceToView(personal,5)
    .centerXEqualToView(personal)
    .widthRatioToView(personal,1)
    .heightIs(15);

    shop.userInteractionEnabled = YES;
    personal.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tapGes1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoStatement:)];
    [shop addGestureRecognizer:tapGes1];
    UITapGestureRecognizer * tapGes2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoStatement:)];
    [personal addGestureRecognizer:tapGes2];
}

- (void)gotoStatement:(UIGestureRecognizer *)sender{
    
    ZEPayBackViewController * VC = [[ZEPayBackViewController alloc]init];
    UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
    //获取点击手势对应的视图的tag
    if ([tap view].tag== 100) {
        VC.Type = @1;//全店
    }else{
        VC.Type = @2;//个人
    }
    [[HZURLNavigation currentNavigationViewController] pushViewController:VC animated:YES];
}

@end
