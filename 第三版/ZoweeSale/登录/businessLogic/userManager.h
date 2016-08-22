//
//  userManager.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWork.h"
#import "ZELoginModel.h"
//表示没有的权限
typedef NS_OPTIONS(NSUInteger, permissionOptions) {
    /**
     *  登记客户
     */
    permissionRegisterCustomer = 1 << 0,
    /**
     *  客户定单
     */
    permissionCustomerOrder = 1 << 1,
    /**
     *  客户出图
     */
    permissionCustomerDesign = 1 << 2,
    /**
     *  图纸审核
     */
    permissionDesignExamine = 1 << 3,
    /**
     *  价格审核
     */
    permissionPriceExamine = 1 << 4,
    /**
     *  合同签约
     */
    permissionContractSign = 1 << 5,
    /**
     *  客户详情-价格清单
     */
    permissionCustomerDetailPriceList = 1 << 6,
    /**
     *  客户详情-合同清单
     */
    permissionCustomerDetailContractList = 1 << 7,
    /**
     *  应用-派尺助手
     */
    permissionApplicationMeasureHelper = 1 << 8,
    /**
     *  应用-客户收款
     */
    permissionApplicationCustomerCollection = 1 << 9,
    /**
     *  应用-冲扣明细
     */
    permissionApplicationRechargeDetails = 1 << 10,
    /**
     *  CRM-全店目标设置
     */
    permissionApplicationStoreTargetSetting = 1 << 11,
    /**
     *  CRM-个人目标设置
     */
    permissionApplicationPersonalTargetSetting = 1 << 12,
    /**
     *  全部权限
     */
    permissionAll = 0,
};

typedef void(^permissionBlock)(void);

@interface userManager : NSObject<NSCoding>

//用户名
@property(nonatomic,readonly,copy)NSString *userName;
//用户密码
@property(nonatomic,copy)NSString *userPswd;
//用户登录名
@property(nonatomic,copy)NSString *loginName;
//头像
@property(nonatomic,readonly,copy)NSString *Url;
//用户token
@property (nonatomic,readonly,copy)NSString *token;
//用户ID
@property (nonatomic,readonly,strong)NSNumber *UserID;
//加盟商ID
@property (nonatomic,readonly,strong)NSNumber *JoinID;
//权限
@property (nonatomic,readonly,assign)permissionOptions permission;

/**
 *  用户单例
 *
 *  @return UserManger
 */
+ (instancetype)sharedInstance;
/**
 *  用户登录状态
 *
 *  @return 已登录或未登录
 */
- (BOOL)islogin;
/**
 *  登录成功
 *
 *  @param model 登录成功返回的用户信息
 */
- (void)loginSuccessWith:(ZELoginModel *)model;
/**
 *  用户注销
 */
- (void)userUnLogin;
/**
 *  检测对应权限
 *
 *  @param permission 对应权限
 *  @param block      有权限后操作
 */- (void)checkUserPermission:(permissionOptions)permission WithBlock:(permissionBlock)block;
@end
