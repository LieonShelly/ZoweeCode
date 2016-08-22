//
//  ZERemarkViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERemarkViewController.h"
#import "NSDate+string.h"
#import "UIBarButtonItem+Extension.h"
#import "customerManager.h"
#import "BRPlaceholderTextView.h"
#import "MBProgressHUD+NJ.h"
#import "ZEUploadPhotoView.h"
#import "ZETHAlertView.h"

#import "ZEDesignReviewViewController.h"

@interface ZERemarkViewController ()<UINavigationControllerDelegate,ZEUploadPhotoViewDelegate,UIImagePickerControllerDelegate,UIPopoverPresentationControllerDelegate>

@property (nonatomic) BRPlaceholderTextView *textView;

@property (nonatomic) UILabel *timeLab;

@property (nonatomic,weak) ZEUploadPhotoView *uploadView;


@end

@implementation ZERemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiSetup];
    self.title = @"出图完成";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uiSetup{
    self.view.backgroundColor = hexColorString(@"f5f2f3");
    _textView = [[BRPlaceholderTextView alloc]init];
    _textView.placeholder = @"说点什么....";
    _textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_textView];
    _textView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(360);
    
    _timeLab = [UILabel new];
    _timeLab.font = [UIFont systemFontOfSize:15];
    _timeLab.textColor = hexColorString(@"999999");
    _timeLab.text = [NSDate stringFormateWithToday];
    CGFloat width = [_timeLab.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
    [self.view addSubview:_timeLab];
    _timeLab.sd_layout
    .topSpaceToView(_textView,10)
    .rightSpaceToView(self.view,10)
    .widthIs(width)
    .heightIs(_timeLab.font.lineHeight);
    
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Clock"]];
    [self.view addSubview:imageview];
    imageview.sd_layout
    .rightSpaceToView(_timeLab,3)
    .centerYEqualToView(_timeLab)
    .widthIs(12)
    .heightIs(12);
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"提交" target:self action:@selector(sumbitBtnClick)];
    
    // 添加上传图片控件
    UILabel * label = [[UILabel alloc]init];
    label.textColor = hexColorString(@"2e2e2e");
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"上传附件";
    [self.view addSubview:label];
    label.sd_layout.topSpaceToView(_textView,20)
    .leftSpaceToView(self.view,20)
    .widthIs(65)
    .heightIs(30);
    
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.textColor = hexColorString(@"fa5a5a");
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"(*最多可上传2个文件)";
    [self.view addSubview:label1];
    label1.sd_layout.topSpaceToView(_textView,20)
    .leftSpaceToView(label,0)
    .widthIs(200)
    .heightIs(30);
    
    
    
   ZEUploadPhotoView* uploadView = [[ZEUploadPhotoView alloc]init];
    uploadView.uploadDelegate = self;
    uploadView.backgroundColor = [UIColor clearColor];
    self.uploadView = uploadView;
    [self.view addSubview:uploadView];
    
    uploadView.sd_layout.leftSpaceToView(self.view,20)
    .leftSpaceToView(self.view,20)
    .rightSpaceToView(self.view,20)
    .topSpaceToView(label,10)
    .bottomEqualToView(self.view);
    [uploadView reloadData];
}

- (void)sumbitBtnClick{
    
    // 上传附件
    // FileType	Int	附件分类	1.量尺出图附件 2.合同签约附件
    [self.uploadView uploadPhotoWithParam:@{@"OrderID":_customer.CustomerID,@"FileType":@1}];
    
    NSString *time = [NSDate dateStringFormateWithToday];
    [_textView resignFirstResponder];
    NSDictionary *parm = @{
                           @"OrderId":_customer.CustomerID,
                           @"Remark":_textView.text,
                           @"FinishDate":time
                           };
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"FigureOut" Requestparameter:parm ModelClassName:@"ZEOrderReponseModel"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEOrderReponseModel *model = request.responseJSONObject;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"客户出图成功" customerID:_customer.CustomerID customerName:_customer.CustomerName OptionCode:model.OptionCode];
            [alertView showInWindowWithBackgoundTapDismissEnable:YES];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
}

#pragma mark - getter

- (IntentionEntityClass *)customer
{
    if (_customer == nil) {
        _customer = [[IntentionEntityClass alloc]init];
    }
    return _customer;
}


/**
 *  打开照相机
 */

-(void) openCamera
{
    //    判断照相机能否可用
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController * ipc = [UIImagePickerController new];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
-(void)openAblum
{
    //    判断相册能否可用
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    UIImagePickerController * ipc = [UIImagePickerController new];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}


#pragma mark - ZEUploadPhotoViewDelegate

- (void)uploadPhotoViewDidSletectedAddItem:(ZEUploadPhotoView *)uploadView
{
    if (self.uploadView.photoArray.count > 2) {
        
        [MBProgressHUD showError:@"最多可上传2个文件" toView:self.view];
        return;
    }
    
    __weak typeof (self) weakself = self;
    UIAlertController * actionSheet = nil;
    if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPad"]) {
        actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    }else{
        actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    }
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakself openCamera];
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakself openAblum];
    }];

    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [self presentViewController:actionSheet animated:YES completion:nil];

}

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
    popoverPresentationController.sourceView = self.view;
    popoverPresentationController.sourceRect  = CGRectMake(0, 0, 200, 200);
}
#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    NSData * data = UIImagePNGRepresentation(image);
    self.uploadView.photoData = data;
}

@end
