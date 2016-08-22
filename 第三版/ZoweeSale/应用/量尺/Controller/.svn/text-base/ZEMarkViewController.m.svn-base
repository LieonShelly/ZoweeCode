//
//  ZEMarkViewController.m
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEMarkViewController.h"
#import "ZEMarkTextView.h"
#import "ZEPhotoViewController.h"

@interface ZEMarkViewController ()
@property (weak, nonatomic) IBOutlet ZEMarkTextView *textView;

@property (nonatomic ,strong) UIButton * cancilBtn;
@property (nonatomic ,strong) UIView * coverView;
@property (weak, nonatomic) IBOutlet UIView *markView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewRightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewBottomCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewLeftCons;

@end

@implementation ZEMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

#pragma mark - 初始化

- (void)setupUI
{
    self.view.backgroundColor = [UIColor clearColor];
    self.markView.backgroundColor = hexColorString(@"e0b187");
    self.markView.layer.cornerRadius = 5;
    self.markView.layer.masksToBounds = YES;
    [self.view insertSubview:self.cancilBtn aboveSubview:self.markView];
    self.cancilBtn.sd_layout
    .topSpaceToView(self.view,self.markViewTopCons.constant - self.cancilBtn.height * 0.5)
    .rightSpaceToView(self.view,self.markViewRightCons.constant - self.cancilBtn.width*.5)
    .widthIs(self.cancilBtn.width)
    .heightIs(self.cancilBtn.height);
    
}
#pragma mark - Events

- (IBAction)markTypeBtnClick:(UIButton *)sender
{
    self.textView.text  = sender.titleLabel.text;
    
    
}

- (void)cancilBtnCick
{
      [[ NSNotificationCenter defaultCenter]postNotificationName:canilMark object:self userInfo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)enterBtnCick:(id)sender
{
 
    [[ NSNotificationCenter defaultCenter]postNotificationName:markValueChanged object:self userInfo:@{@"markStr":self.textView.text}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 懒加载

- (UIButton *)cancilBtn
{
    if (_cancilBtn == nil) {
        _cancilBtn = [[UIButton alloc]init];
        [_cancilBtn setImage:[UIImage imageNamed:@"cancilBtn"] forState:UIControlStateNormal];
        [_cancilBtn addTarget:self action:@selector(cancilBtnCick) forControlEvents:UIControlEventTouchUpInside];
        [_cancilBtn sizeToFit];
        
    }
    return _cancilBtn;
}

- (UIView *)coverView
{
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [UIColor clearColor];
    }
    
   return  _coverView;
}

@end
