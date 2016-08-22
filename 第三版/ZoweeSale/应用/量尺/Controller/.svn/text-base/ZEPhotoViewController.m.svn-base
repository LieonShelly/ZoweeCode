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


@interface ZEPhotoViewController ()<CHRenderViewDelegate>
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
    ZEPhotoButton * btn = [[ZEPhotoButton alloc]init];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"bg_btn"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.size = CGSizeMake(60,35);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
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
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
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




#pragma mark - Delegate
#pragma mark -- CHRenderViewDelegate

- (void)CHRenderViewDidEndDrawMark:(CHRenderView *)renderVeiew
{
    self.renderView.canBeMark = NO;
    self.selectedBtn.enabled = YES;
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
    ZEMarkViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ZEMarkViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.animator;
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
