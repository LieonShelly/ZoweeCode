//
//  ZEPersonalInfoCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPersonalInfoCell.h"
#import "UIImageView+WebCache.h"
#import "ZEPersonalInfo.h"
#import "ZEQXTool.h"

@interface ZEPersonalInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dividerLine0;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dividerLine1;

@property (weak, nonatomic) IBOutlet UILabel *departLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;


@end

@implementation ZEPersonalInfoCell


- (void)awakeFromNib {
 
    self.backgroundColor = [UIColor clearColor];
    self.iconLabel.textColor = hexColorString(@"2e2e2e");
    self.nameLabel.textColor = hexColorString(@"2e2e2e");
    self.userNameLabel.textColor = hexColorString(@"a8a8a8");
    self.phoneLabel.textColor = hexColorString(@"2e2e2e");
    self.phoneNumberLabel.textColor = hexColorString(@"a8a8a8");
    self.departLabel.textColor = hexColorString(@"2e2e2e");
    self.departmentLabel.textColor = hexColorString(@"a8a8a8");
    self.dividerLine0.backgroundColor = hexColorString(@"dbdbdb");
    self.dividerLine1.backgroundColor = hexColorString(@"dbdbdb");
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.width * 0.5;
    // 添加手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseHeadeIcon)];
    self.iconImageView.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    [self.iconImageView addGestureRecognizer:tap];
    
}

#pragma mark - 私有方法


- (void)chooseHeadeIcon
{

    
    if([self.delegate respondsToSelector:@selector(personalInfoCellDidClickIconImgaeView:)])
    {
        [self.delegate personalInfoCellDidClickIconImgaeView:self];
    }
    
}



#pragma mark - 公共接口

- (void)setHeaderData:(NSData *)headerData
{
    _headerData = headerData;
    self.iconImageView.image =[UIImage imageWithData:headerData];
}

- (void)setUserInfos:(ZEPersonalInfo *)userInfos
{
    _userInfos = userInfos ;
//    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:userInfos.HeadUrl] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//          
//        self.iconImageView.image =[UIImage imageWithData:self.headerData? self.headerData:data];
//           
//        });
//    }];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.userInfos.HeadUrl] placeholderImage:[UIImage imageNamed:@"男"]];
    self.departmentLabel.text = userInfos.TypeDepartmentName;
    self.phoneNumberLabel.text = userInfos.Mobile;
    self.userNameLabel.text = userInfos.Name;
    
    
}
@end
