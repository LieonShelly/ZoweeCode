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
#import "ZERemindView.h"

@interface ZEMarkViewController ()<ZERemindViewDelegate>
@property (weak, nonatomic) IBOutlet ZEMarkTextView *textView;

@property (nonatomic ,strong) UIButton * cancilBtn;
@property (nonatomic ,strong) UIView * coverView;
@property (weak, nonatomic) IBOutlet UIView *markView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewRightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewBottomCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markViewLeftCons;

@property (nonatomic ,strong) ZERemindView * remindView;

@end

@implementation ZEMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self chooseUI];
}

#pragma mark - 初始化
- (void)chooseUI
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self setupUI];
    NSLog(@"%d",[defaults boolForKey:@"下次不提醒"]);;
    if ([defaults boolForKey:@"下次不提醒"]) {
        [self remindViewDidClickCloseBtn];
    }else{
        
        [self setupRemindView];
    }
}
- (void)setupRemindView
{
    [self.view insertSubview:self.remindView aboveSubview:self.markView];
    self.remindView.sd_layout.topSpaceToView(self.remindView.superview,0)
    .leftEqualToView(self.remindView.superview)
    .rightEqualToView(self.remindView.superview)
    .bottomEqualToView(self.remindView.superview);
}

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

#pragma mark - ZERemindViewDelegate

- (void)remindViewDidClickCloseBtn
{
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.duration = 0.5;
    anim.keyPath = @"transform.rotation.z";
    anim.fromValue = @(M_PI * 2);
    anim.toValue = @(0);
    anim.repeatCount = 1;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.remindView.layer addAnimation:anim forKey:@"transform.rotation.y"];
    
    anim.keyPath = @"transform.scale";
    anim.fromValue = @1.0;
    anim.toValue = @0.0 ;
    [self.remindView.layer addAnimation:anim forKey:@"transform.scale"];

    self.cancilBtn.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 发出通知改变底色
        [[NSNotificationCenter defaultCenter]postNotificationName:@"remindViewDidRemove" object:self userInfo:@{@"coverAlpha":@(0.4)}];
        [self.remindView removeFromSuperview];
    });
}
#pragma mark - 懒加载

- (ZERemindView *)remindView
{
    if (_remindView == nil) {
        _remindView = [[ZERemindView alloc]init];
        _remindView.delegate = self;
    }
    return _remindView;
}

- (UIButton *)cancilBtn
{
    if (_cancilBtn == nil) {
        _cancilBtn = [[UIButton alloc]init];
        [_cancilBtn setImage:[UIImage imageNamed:@"cancilBtn"] forState:UIControlStateNormal];
        [_cancilBtn addTarget:self action:@selector(cancilBtnCick) forControlEvents:UIControlEventTouchUpInside];
        [_cancilBtn sizeToFit];
        _cancilBtn.hidden = YES;
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
