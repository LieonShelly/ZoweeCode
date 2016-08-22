//
//  ZEcontractAwrdViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcontractAwrdViewController.h"
#import "ZEcontractAwTableView.h"
#import "UIBarButtonItem+Extension.h"
#import "customerManager.h"
#import "ZETHAlertView.h"

@interface ZEcontractAwrdViewController ()<UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic) ZEcontractAwTableView *tableView;

@end

@implementation ZEcontractAwrdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合同签约";
    self.view.backgroundColor = hexColorString(@"f5f2f3");
    // Do any additional setup after loading the view.
    [self UISetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UISetup {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"提交" target:self action:@selector(submitBtnClick)];
    ZEcontractAwTableView *tableView = [[ZEcontractAwTableView alloc]init];
    tableView.uploadView.uploadDelegate = self;
    tableView.model.OrderID = _customer.CustomerID;
    [self.view addSubview:tableView];
    tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    _tableView = tableView;
}

- (void)submitBtnClick{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if ([self.tableView isErrorNoEmpty]) {
        [self showToastWithMsg:[self.tableView isErrorNoEmpty]];
        return;
    }
    
    // 上传附件
    // FileType	Int	附件分类	1.量尺出图附件 2.合同签约附件
    [self.tableView.uploadView uploadPhotoWithParam:@{@"OrderID":_customer.CustomerID,@"FileType":@1}];
    
    NSDictionary *dic =[self.tableView dicKeyValue];
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"OrderContract" Requestparameter:dic ModelClassName:@"ZEOrderReponseModel"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEOrderReponseModel *model = request.responseJSONObject;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"合同签约成功" Describe:@"请登录CRM网站上传造易文件" customerID:_customer.CustomerID customerName:_customer.CustomerName OptionCode:model.OptionCode];
            
            [alertView showInWindowWithBackgoundTapDismissEnable:YES];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
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

#pragma mark - getter

- (IntentionEntityClass *)customer
{
    if (_customer == nil) {
        _customer = [[IntentionEntityClass alloc]init];
        
    }
    return _customer;
}


- (void)uploadPhotoViewDidSletectedAddItem:(ZEUploadPhotoView*)uploadView
{
    if (self.tableView.uploadView.photoArray.count > 2) {
        
        [MBProgressHUD showError:@"最多可上传2个文件" toView:self.view];
        return;
    }
    
    __weak typeof (self) weakself = self;
    UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
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

#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    NSData * data = UIImagePNGRepresentation(image);
    self.tableView.uploadView.photoData = data;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

