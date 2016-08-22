//
//  ZEPhotoViewController.m
//  ZoweeSale
//
//  Created by apple on 4/27/16.
//  Copyright © 2016 TH. All rights reserved.
//

#define animationDuration 0.5
#import "ZEPhotoViewController.h"
#import "CHRenderView.h"
#import "ZEAnimator.h"
#import "ZEPhotoButton.h"
#import "ZEMarkViewController.h"
#import "ApplicationManage.h"
#import "ZEMeasureTool.h"
#import "ZEBaseMarkViewController.h"
#import "ZERemindView.h"
#import "TYAlertController.h"
#import "SVProgressHUD.h"


@interface ZEPhotoViewController ()<CHRenderViewDelegate,ZERemindViewDelegate>
@property (nonatomic,strong) IBOutlet CHRenderView  * renderView;
@property(nonatomic,weak) ZEPhotoButton *  selectedBtn;
@property (nonatomic,strong) ZEPhotoButton * markBtn;
@property (nonatomic,strong) ZEPhotoButton * deleteBtn;
@property (weak, nonatomic) IBOutlet UIView *bulidNewMarkView;
@property (weak, nonatomic) IBOutlet UIView *modifyMarkView;
@property (nonatomic,strong) ZEMarkArrow * selectedArrow;
/**
 *  负责转场动画
 */
@property (nonatomic,strong) ZEAnimator * animator;

@property (nonatomic ,strong) ZERemindView * remindView;

@property (nonatomic ,strong) UIButton * helpBtn;

@property (nonatomic ,strong) ZEPhotoButton * submitBtn;

@property (nonatomic ,strong) ZEPhotoButton * continusBtn;

@end

@implementation ZEPhotoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self listenNotification];
    NSLog(@"ZEPhotoViewController--ProjectID:%@",self.imageInfo.ProjectID);
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight;//根据需要
}

- (BOOL)shouldAutorotate
{
    return YES;//根据需要
}


#pragma mark - 初始化
- (void)initUI
{
    self.renderView.photoData = self.photoData;
    self.renderView.delegate = self;
    self.renderView.canBeMark = NO;
    self.bulidNewMarkView.layer.anchorPoint =CGPointMake(0.5, 0);
    self.modifyMarkView.layer.anchorPoint =CGPointMake(0.5, 0);
    self.modifyMarkView.transform = CGAffineTransformMakeScale(1, 0);
    
    // 提交按钮
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.submitBtn];
    
}

#pragma mark - Events


/**
 *  新建标注
 *
 */
- (IBAction)newMarkBtnClick:(ZEPhotoButton *)sender
{
  
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.duration = animationDuration;
    anim.keyPath = @"transform.rotation.y";
    anim.toValue = @(M_PI * 2);
    anim.repeatCount = 1;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;

    [self.renderView.layer  addAnimation:anim forKey:@"rotation"];
    self.renderView.canBeMark = YES;
    self.selectedBtn = sender;
    self.selectedBtn.enabled = NO;
}


/**
 *  删除房间
 */
- (IBAction)deleteRoomBtnClick:(ZEPhotoButton *)sender
{
  
}
/**
 *   删除标注
 */
- (IBAction)deleteMarkBtnClick:(ZEPhotoButton *)sender
{
    
    [self.selectedArrow removeFromSuperview];
    NSLog(@"%s",__func__);
}

/**
 *  返回
 */
- (IBAction)bacMarkBtnClick:(ZEPhotoButton *)sender
{
    
    [UIView animateWithDuration:animationDuration animations:^{
   
         self.modifyMarkView.transform = CGAffineTransformMakeScale(1, 0);
        [UIView animateWithDuration:animationDuration animations:^{
            self.bulidNewMarkView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    } completion:^(BOOL finished) {
        nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.submitBtn];
    }];
}

/**
 *  修改标注
 */
- (IBAction)modifyMarkClick:(ZEPhotoButton *)sender
{
    
    [self CHRenderViewDidEndDrawMark:self.renderView];
}
#pragma selfMethod

/**
 *  监听通知
 */
- (void)listenNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(markClicked:) name:markArrowClicked object:nil];
}

- (void)markClicked:(NSNotification*)note
{
    
    self.selectedArrow = note.userInfo[@"markArrow"];
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.modifyMarkView.transform = CGAffineTransformMakeScale(1, 1);
        self.bulidNewMarkView.transform = CGAffineTransformMakeScale(1, 0);
        
    } completion:^(BOOL finished) {
        nil;
    }];
}


// 标注图片
- (void)markPhoto
{
    self.renderView.canBeMark = YES;
}

/**
 *  提交标注数据
 */
- (void)submitClick:(ZEPhotoButton*)btn
{
//    ProjectID 和 RoomNo由上级页面传入
    
    self.imageInfo.ID = 0;
    self.imageInfo.TypeID = 0;
    // 从缓存中取数据
    self.imageInfo.Remark = [ZEMeasureTool markArrowModel].mj_keyValues;
    
    // 发送未编辑的图片
    upLoadFile * file = [[upLoadFile alloc]init];
    file.name = @"oringnalImage";
    file.fileName = @"oringnalImage.png";
    file.type = @"png";
    file.fileData = self.photoData;
    
    NSLog(@"%@",self.imageInfo.mj_keyValues);
    
    // 发送编辑前的图片
    [[THNetWork sharedInstance]creatUploadTaskWithParameters:self.imageInfo.mj_keyValues Action:@"SaveProjectImage" file:file success:^(id response) {
        NSLog(@"%@",response);
        [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"上传失败"];
    }];
    
    // 发送编辑后的图片
    file.name = @"markedImage";
    file.fileName = @"markedImage.png";
    file.type = @"png";
    file.fileData = [self screenShots];
    
    [[THNetWork sharedInstance]creatUploadTaskWithParameters:self.imageInfo.mj_keyValues Action:@"SaveProjectImage" file:file success:^(id response) {
        NSLog(@"%@",response);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

/**
 *  屏幕截图
 *
 */
- (NSData *)screenShots
{
    
    UIGraphicsBeginImageContext(self.renderView.size);
    [self.view drawViewHierarchyInRect:self.renderView.bounds afterScreenUpdates:NO];
    UIImage *iamgeScreen= UIGraphicsGetImageFromCurrentImageContext();
    // 写入相册
//    UIImageWriteToSavedPhotosAlbum(iamgeScreen, self, nil, nil);
    UIGraphicsEndImageContext();
    
    NSData * data = UIImagePNGRepresentation(iamgeScreen);
    NSLog(@"UIImageWriteToSavedPhotosAlbum-%ld",data.length);
    return data;
}


- (void)helpBtnClCik
{
    [self setupRemindView];
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.duration = animationDuration;
    anim.keyPath = @"transform.rotation.z";
    anim.toValue = @(M_PI * 2);
    anim.repeatCount = 1;
    anim.removedOnCompletion = YES;
    anim.fillMode = kCAFillModeForwards;
    [self.remindView.layer addAnimation:anim forKey:@"transform.rotation.y"];
    
    anim.keyPath = @"transform.scale";
    anim.fromValue = @0.0;
    anim.toValue = @1.0;
   [self.remindView.layer addAnimation:anim forKey:@"transform.scale"];
}

- (void)continusBtnClick:(ZEPhotoButton*)btn
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"连续标注"];
    [self bacMarkBtnClick:btn];
    btn.transform = CGAffineTransformMakeScale(1, 0);
}
- (void)presentMarkViewController
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
    ZEMarkViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ZEMarkViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.animator;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)setupRemindView
{
    [self.navigationController.view addSubview:self.remindView];
    self.remindView.sd_layout.topSpaceToView(self.navigationController.view,0)
    .leftEqualToView(self.navigationController.view)
    .rightEqualToView(self.navigationController.view)
    .bottomEqualToView(self.navigationController.view);
}

/**
 *  连续标注
 */
- (void)continusMark
{
    self.renderView.canBeMark = YES;
    [self continusMarkAnimation];
}


#pragma mark - getter

- (ZEAnimator *)animator
{
    if (_animator == nil) {
        _animator = [[ZEAnimator alloc]init];
        _animator.presentFrame = self.renderView.frame;
    }
    return _animator;
}

- (ZEImageInfo *)imageInfo
{
    if (_imageInfo == nil) {
        _imageInfo = [[ZEImageInfo alloc]init];
    }
    return _imageInfo;
}

- (ZERemindView *)remindView
{
    if (_remindView == nil) {
        _remindView = [[ZERemindView alloc]init];
        _remindView.delegate = self;
    }
    return _remindView;
}

- (ZEPhotoButton *)submitBtn
{
    if (_submitBtn == nil) {
        ZEPhotoButton * btn = [[ZEPhotoButton alloc]init];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_btn"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.size = CGSizeMake(60,35);
        [btn setTitle:@"提交" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
        _submitBtn = btn;
    }
    return _submitBtn;
}
- (UIButton *)helpBtn
{
    if (_helpBtn == nil) {
        _helpBtn = [[UIButton alloc]init];
        [_helpBtn setImage:[UIImage imageNamed:@"button_help-Normal"] forState:UIControlStateNormal];
        [_helpBtn setImage:[UIImage imageNamed:@"button_help-Click"] forState:UIControlStateHighlighted];
        [_helpBtn addTarget:self action:@selector(helpBtnClCik) forControlEvents:UIControlEventTouchUpInside];
        [_helpBtn sizeToFit];
    }
    return _helpBtn;
}

- (ZEPhotoButton *)continusBtn
{
    if (_continusBtn == nil)
    {
        ZEPhotoButton * btn = [[ZEPhotoButton alloc]init];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"bg_btn"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(continusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"取消连续标注" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
        _continusBtn =  btn;
        [self.view insertSubview:self.continusBtn aboveSubview:self.bulidNewMarkView];
        _continusBtn.sd_layout
        .centerYEqualToView(self.bulidNewMarkView)
        .centerXEqualToView(self.bulidNewMarkView)
        .heightIs(44)
        .widthIs(120);
        
    }
    return _continusBtn;
}

#pragma mark - Delegate
#pragma mark -- CHRenderViewDelegate

- (void)CHRenderViewDidEndDrawMark:(CHRenderView *)renderVeiew
{
    self.renderView.canBeMark = NO;
    self.selectedBtn.enabled = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.helpBtn];
    
//    [self presentMarkViewController];
    [self presetView];
}

- (void)presetView
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    // 读取是否连续连续标注
    if ([defaults boolForKey:@"连续标注"]) {
        [self continusMark];
    }else{
        [self presentMarkViewController];
    }
    
    
}


#pragma mark - ZERemindViewDelegate

-  (void)remindViewDidClickCloseBtn
{
    
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.duration = animationDuration;
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.remindView removeFromSuperview];
    });
    
// 是否连续标注
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    // 读取是否连续连续标注
    if ([defaults boolForKey:@"连续标注"]) {
        
        [self continusMarkAnimation];
    }else{
        [self uncontinusMarkAnimation];
    }
}

- (void)continusMarkAnimation
{
    [UIView animateWithDuration:animationDuration animations:^{
        self.renderView.canBeMark = YES;
        self.continusBtn.transform = CGAffineTransformMakeScale(1, 1);
        self.bulidNewMarkView.transform = CGAffineTransformMakeScale(1, 0);;
        self.modifyMarkView.transform = CGAffineTransformMakeScale(1, 0);;
    }];
}

- (void)uncontinusMarkAnimation
{
    [UIView animateWithDuration:animationDuration animations:^{
        self.renderView.canBeMark = NO;
        self.continusBtn.transform = CGAffineTransformMakeScale(1, 0);
        self.bulidNewMarkView.transform = CGAffineTransformMakeScale(1, 1);;
        self.modifyMarkView.transform = CGAffineTransformMakeScale(1, 0);;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.submitBtn];
    }];
}
@end
