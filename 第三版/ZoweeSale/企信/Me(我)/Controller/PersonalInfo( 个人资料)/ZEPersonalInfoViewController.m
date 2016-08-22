//
//  ZEPersonalInfoViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPersonalInfoViewController.h"
#import "ZEPersonalInfoCell.h"
#import "ZEChooseIcon.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "upLoadFile.h"
#import "ZEPersonalInfo.h"
#import "ZEQXTool.h"
#import "UIImageView+WebCache.h"


@interface ZEPersonalInfoViewController () <ZEPersonalInfoCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) ZEChooseIcon * chooseIcon;
@property (nonatomic,weak) UIButton * cover;
@property(nonatomic,strong) NSData * headerData;
@property (nonatomic,weak) UIImageView * imageView;
@property(nonatomic,strong) ZEPersonalInfo * userInfo;
@end

@implementation ZEPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
    self.userInfo = [ZEQXTool userInfo];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
;
}

#pragma mark - 私有方法
- (void)initUI
{
    
    self.view.backgroundColor =  ZECustomerGlobalBackgroudColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection  = NO;
    self.tableView.scrollEnabled = NO;
    

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

// 提交个人资料
- (void)submit
{
    
    lieonLog(@"submit");
//    NSData *data;
//     UIImage *image = [UIImage imageNamed:@"icon_map"];
//    if (UIImagePNGRepresentation(image) == nil) {
//        
//        data = UIImageJPEGRepresentation(image, 1);
//        
//    } else {
//        
//        data = UIImagePNGRepresentation(image);
//    }
    [MBProgressHUD showMessage:@"提交中..." toView:self.navigationController.view];
    upLoadFile * file = [[upLoadFile alloc]init];
    file.name = @"header";
    file.fileName = @"header.png";
    file.type = @"png";
    file.fileData = self.headerData;

    [[THNetWork sharedInstance]creatUploadTaskWithParameters:[NSDictionary dictionary] Action:@"SaveHeaderUrl" file:file success:^(id response) {
        [MBProgressHUD hideHUDForView:self.navigationController.view];
        [MBProgressHUD showSuccess:@"提交完成" toView:self.navigationController.view];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.navigationController.view];
        [MBProgressHUD showError:@"提交失败" toView:self.navigationController.view];
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZEPersonalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personalInfo" forIndexPath:indexPath];
    cell.delegate = self;
    cell.userInfos = self.userInfo;
    if (self.headerData) {
        cell.headerData = self.headerData;
    }
    return cell;
}

#pragma mark - personalInfoCellDelegate

- (void)personalInfoCellDidClickIconImgaeView:(ZEPersonalInfoCell *)personalCell
{
    __weak typeof(self) weakSelf = self;
    
    UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    }
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf openCamera];
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"打开本地图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf openAblum];
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
   // actionSheet.preferredStyle = UIAlertControllerStyleAlert;
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
   // [actionSheet ]
    [self presentViewController:actionSheet animated:YES completion:nil];
}
#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
  
    UIButton * button = [UIButton new];
//    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
                                               
    [picker dismissViewControllerAnimated:YES completion:nil];
   
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    NSData * headerData = UIImageJPEGRepresentation(image, 0.3);
    self.headerData = headerData;
    [self.tableView reloadData];
    NSLog(@"%lu",(unsigned long)headerData.length);
}


@end
