//
//  ZEIntentionViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEScreenCustomerView.h"
#import "customerSort.h"
#import "ZECRMCustomerTableView.h"

@interface ZEIntentionViewController : UIViewController

/**
 *  请求接口名
 */
@property (nonatomic) NSString *interfaceStr;
/**
 *  排序栏
 */
@property (nonatomic)ZEScreenCustomerView *screenView;
/**
 *  选中事件
 */
@property (nonatomic,copy)customerSelectionBlock selection;
/**
 *  左划
 */
@property (nonatomic,assign) BOOL enableSider;
/**
 *  隐藏右按钮
 */
@property (nonatomic,assign) BOOL rightbtnHideen;
/**
 *  没有客户是否提示 默认提示
 */
@property (nonatomic,assign) BOOL isNoContentShow;
- (void)RefreshView;

@end
