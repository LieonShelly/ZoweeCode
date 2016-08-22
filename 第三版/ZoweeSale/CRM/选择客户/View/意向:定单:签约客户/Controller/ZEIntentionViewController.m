//
//  ZEIntentionViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEIntentionViewController.h"
#import "CrmCustomerInterface.h"

#import "ICPinyinGroup.h"


@interface ZEIntentionViewController ()<screenViewSelectdDelegate>

@property (nonatomic) ZECRMCustomerTableView *tableView;

@end

@implementation ZEIntentionViewController{
    customersSort _sortType;
    sortDirectionType _sort;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rightbtnHideen = YES;
        self.isNoContentShow = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadingCustomers:_sortType sort:_sort];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)RefreshView{
    [self loadingCustomers:_sortType sort:_sort];
}

- (void)setup {
    _tableView = [[ZECRMCustomerTableView alloc] init];
    _tableView.selection = self.selection;
    _tableView.enableSider = self.enableSider;
    _tableView.isNoContentShow = self.isNoContentShow;
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(40, 0, 0, 0));
    

    self.screenView.itemHeight = 40;
    self.screenView.rightBtn.hidden = self.rightbtnHideen;
    self.screenView.screenDelegate = self;
    [self.view addSubview:self.screenView];
    self.screenView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(40);
    
    _sortType = [_screenView getFirstCustomerSortType];
    _sort = [_screenView getFirstDirectionType];

}

- (ZEScreenCustomerView *)screenView{
    if (!_screenView) {
        _screenView =  [[ZEScreenCustomerView alloc]init];
    }
    return _screenView;
}


- (NSString *)interfaceStr{
    if (!_interfaceStr) {
        _interfaceStr = @"LoadIntentionCustomerList";
    }
    return _interfaceStr;
}

- (void)screenSortType:(customersSort)type opposite:(sortDirectionType)sort{
    _sortType = type;
    _sort = sort;
    switch (type) {
        case customersSortName:
            _tableView.sortType = customersSortName;
            [_tableView customrNameSort];
            break;
        default:
            [self loadingCustomers:type sort:sort];
            break;
    }
}
- (void)loadingCustomers:(customersSort )type sort:(sortDirectionType)sort{
    _tableView.sortType = type;
    [crmCustomerShare loadAllCustomerListWithInterface:self.interfaceStr Type:type Sort:sort Block:^(THNetWorkError *error, NSArray *array) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
            [self showToastWithMsg:error.errorDescription];
        }else{
            _tableView.customers = array;
        }
        if (array.isNoEmpty) {
            self.screenView.hidden = NO;
        }else{
            self.screenView.hidden = YES;
        }
    }];
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
