//
//  userManager.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "userManager.h"
#import "NSString+Cryption.h"
#import "IntentionEntityClass.h"
#import "MJExtension.h"
#import <sys/utsname.h>
#import "JPUSHService.h"
#import "MobClick.h"
#import "THloginMessage.h"
#import "YYKit.h"
#import "HZURLNavigation.h"
#import "CYLTabBarController.h"
#import <TYAlertController/TYAlertController.h>
#import <TYAlertController/UIView+TYAlertView.h>

static NSString *const kServiceName = @"com.Zowee";

@interface permissionModel : NSObject

@property (nonatomic,copy) NSString *StrPermission;
@end

@implementation permissionModel



@end

@implementation userManager

+ (userManager *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self DecodeUserManager];
    });
    return sharedInstance;
}
#pragma mark - 归档缓存登录数据
+ (NSString *)cacheBasePath {
    NSString *pathOfLibrary = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [pathOfLibrary stringByAppendingPathComponent:@"THcache"];
        
    [self checkDirectory:path];
    return path;
}
+ (void)checkDirectory:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir]) {
        [self createBaseDirectoryAtPath:path];
    } else {
        if (!isDir) {
            NSError *error = nil;
            [fileManager removeItemAtPath:path error:&error];
            [self createBaseDirectoryAtPath:path];
        }
    }
}
+ (void)createBaseDirectoryAtPath:(NSString *)path {
    __autoreleasing NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES
                                               attributes:nil error:&error];
    if (error) {
        NSLog(@"create cache directory failed, error = %@", error);
    } else {
       // [YTKNetworkPrivate addDoNotBackupAttribute:path];
    }
}
+ (id)DecodeUserManager{
    
    NSString *file = [self cacheBasePath];
    NSString *Name = [NSString stringWithFormat:@"/%@",NSStringFromClass([self class])];
    file = [file stringByAppendingString:Name];
    id shared =  [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    if (!shared) {
        shared = [[self alloc] init];
    }
    /**
     *  加载以前使用的用户名,密码
     */
    NSError *error = nil;
    YYKeychainItem *item = [[YYKeychainItem alloc] init];
    //item.service = kServiceName;
    NSArray *array = [YYKeychain selectItems:item error:&error];
    if (!array) {
        NSLog(@"Unable to fetch accounts: %@",error);
    }
    for (YYKeychainItem  *item in array) {
        if ([item.service isEqualToString:kServiceName]) {
            if (item.account.isNoEmpty) {
                [shared setValue:item.account forKey:@"loginName"];
            }
            if (item.password.isNoEmpty) {
                [shared setValue:item.password forKey:@"userPswd"];
            }
        }
        if (![YYKeychain deleteItem:item error:&error]) {
            NSLog(@"删除YYKeychain错误:%@",error);
        }
    }
    return shared;
}
- (void)EncodeUserManager{
    
    NSString *file = [[self class] cacheBasePath];
    NSString *Name = [NSString stringWithFormat:@"/%@",NSStringFromClass([self class])];
    file = [file stringByAppendingString:Name];
    [NSKeyedArchiver archiveRootObject:self toFile:file];
}
/**
 *  keyChain 更新用户名密码
 */
- (void)keyChainUpdate{
    YYKeychainItem *item = [[YYKeychainItem alloc] init];
    NSError *error = nil;
    NSArray *array = [YYKeychain selectItems:item error:&error];
    for (YYKeychainItem *item in array) {
        if (![YYKeychain deleteItem:item error:&error]) {
            NSLog(@"删除YYKeychain错误:%@",error);
        }
    }
    item.service = kServiceName;
    item.account = _loginName;
    item.password = _userPswd;
    if (![YYKeychain updateItem:item error:&error]) {
        NSAssert([YYKeychain insertItem:item error:&error],@"Unable to update password: %@",error);
    }
}
/**
 *  删除keychain
 */
- (void)keyChainDelete{
    YYKeychainItem *item = [[YYKeychainItem alloc] init];
    NSError *error;
    if (![YYKeychain deleteItem:item error:&error]) {
        NSLog(@"删除YYKeychain错误:%@",error);
    }
}

#pragma mark - 初始化方法

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [self mj_encode:aCoder];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userName = @"";
        _userPswd = @"";
        _loginName = @"";
        _Url = @"";
        _token = @"";
        _UserID = @0;
        _JoinID = @0;
        _permission = permissionAll;
    }
    return self;
}
#pragma mark - 其他方法
- (BOOL)islogin {
    return _token.isNoEmpty;
}

- (void)permissionWithNo:(NSString *)pissionStr{
    if (!pissionStr) {
        return;
    }
    _permission = permissionAll;
    if (pissionStr.length == 0) {
        return;
    }
    NSArray *numArray = [pissionStr componentsSeparatedByString:@","];
    for (NSString *num in numArray) {
        NSInteger N = [num integerValue] - 1;
        _permission = _permission | (1 << N);
    }
}

- (void)checkUserPermission:(permissionOptions)permission WithBlock:(permissionBlock)block{
    if (_permission & permission) {
        TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"提示" message:@"当前角色没有权限，请联系店面管理员或者老板设置权限."];
        [alertView addAction:[TYAlertAction actionWithTitle:@"好的" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
            
        }]];
        [alertView addAction:[TYAlertAction actionWithTitle:@"重试" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
            NSDictionary *login =  @{};
            THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"RefreshPermissionNo" Requestparameter:login ModelClassName:@"permissionModel"];
            [api addAccessory:api];
            [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
                if (request.responseJSONObject) {
                    permissionModel *model = request.responseJSONObject;
                    [self permissionWithNo:model.StrPermission];
                    [self checkUserPermission:permission WithBlock:block];
                }else{
                    
                }
            } failure:^(YTKBaseRequest *request) {
            }];
        }]];
        [TYShowAlertView showAlertViewWithView:alertView originY:SCREEN_HEIGHT/2-100 backgoundTapDismissEnable:YES];
    }else{
        block();
    }
}

- (void)userUnLogin {
    [self UnloginUIShow];
    _token = @"";
    [self EncodeUserManager];
    //[self keyChainDelete];
    [JPUSHService setTags:[NSSet set] alias:@"" fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        NSLog(@"激光推送 设置标签别名 rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, iTags , iAlias);
    }];
    //[MobClick profileSignOff];
}
-(void)loginSuccessWith:(ZELoginModel *)model{
    [THNetWork sharedInstance].token = model.UserToken;
    _token = model.UserToken;
    _userName = model.UserName;
    _UserID = model.UserID;
    _JoinID = model.JoinID;
    _Url = model.Url;
    [self permissionWithNo:model.PermissionNo];
    [JPUSHService setTags:[NSSet setWithObject:[NSString stringWithFormat:@"%@",model.JoinID]] alias:[NSString stringWithFormat:@"%@",model.UserID] fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        NSLog(@"激光推送 设置标签别名 rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, iTags , iAlias);
    }];
    [MobClick profileSignInWithPUID:[NSString stringWithFormat:@"%@",model.UserID] provider:customerType];
    [self EncodeUserManager];
    [self keyChainUpdate];
    [self loginSuccessUIShow];
}
/**
 *  登陆成功后的界面显示效果
 */
- (void)loginSuccessUIShow{
    UINavigationController *navigatController = [HZURLNavigation currentNavigationViewController];
    CYLTabBarController *tableController = (CYLTabBarController *)navigatController.presentingViewController;
    UINavigationController *selectNaviagtion = tableController.selectedViewController;
    [selectNaviagtion popToRootViewControllerAnimated:NO];
    if (tableController) {
        [navigatController dismissViewControllerAnimated:YES completion:nil];
        return ;
    }
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController] ;
    [navigatController presentViewController:controller animated:YES completion:nil];
}
/**
 *  注销后界面的显示效果
 */
- (void)UnloginUIShow{
    CYLTabBarController *tabBarController = self.cyl_tabBarController;
    UINavigationController *navigationCont = (UINavigationController *)tabBarController.presentingViewController;
    [navigationCont popToRootViewControllerAnimated:NO];
    if (navigationCont) {
        [tabBarController dismissViewControllerAnimated:YES completion:nil];
    }
    UIStoryboard * st = [UIStoryboard storyboardWithName:@"loginOrBinding" bundle:nil];
    UIViewController * loginOrBindingVc = [st instantiateInitialViewController];
    [tabBarController presentViewController:loginOrBindingVc animated:YES completion:nil];
}

@end
