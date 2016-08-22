//
//  ZEChooseIcon.m
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEChooseIcon.h"

@interface ZEChooseIcon ()
@property (weak, nonatomic) IBOutlet UIButton *cameraBtn;
@property (weak, nonatomic) IBOutlet UIButton *localPictureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancilBtn;

@end

@implementation ZEChooseIcon


- (void)awakeFromNib
{
    
    [self.cameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
    self.cameraBtn.backgroundColor = hexColorString(@"fa5b5a");
    self.cameraBtn.tag = ZEChooseIconButtonTypeCamera;
    [self.cameraBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.localPictureBtn setTitle:@"选择本地照片" forState:UIControlStateNormal];
    self.localPictureBtn.tag = ZEChooseIconButtonTypeAblum;
    self.localPictureBtn.backgroundColor = [UIColor redColor];
    [self.localPictureBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cancilBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.cancilBtn.tag = ZEChooseIconButtonTypeCancil;
    [self.cancilBtn setTitleColor:hexColorString(@"2e2e2e") forState:UIControlStateNormal];
    self.cancilBtn.backgroundColor = hexColorString(@"cccccc");
    [self.cancilBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 按钮的点击

- (void)btnClick:(UIButton*)btn
{
    if([self.delegate respondsToSelector:@selector(ZEChooseIcon:DidClickBtn:)]){
        [self.delegate ZEChooseIcon:self DidClickBtn:(ZEChooseIconButtonType)btn.tag];
    }
}

#pragma mark - 公共接口

+ (instancetype)chooseIcon
{
   return  [[[NSBundle mainBundle] loadNibNamed:@"ZEChooseIcon" owner:self options:nil] lastObject];
}

@end
