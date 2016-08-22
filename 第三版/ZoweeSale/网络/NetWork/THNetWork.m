//
//  THNetWork.m
//  zowee_BusinessManage
//
//  Created by wanglj on 15/9/8.
//  Copyright (c) 2015年 zowee. All rights reserved.
//

#import "THNetWork.h"
#import "MJExtension.h"
#import "NSString+Cryption.h"
#import "AFNetworking.h"
#import "SSKeychain.h"
#import "GTMBase64.h"
#import "LFCGzipUtillity.h"

#import "userManager.h"

#import "CYLTabBarController.h"


#define kService @"com.zowee"
#define kAccount @"userUUID"
#define kUUID @"uuid"

static THNetWork *network;
static NSString *BaseStr = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@interface THNetWork()
//AFNetWorking 单例
@property (nonatomic, strong) AFHTTPRequestOperationManager *networkManager;

@end

@implementation THNetWork

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        network = [[THNetWork alloc]init];
        network.networkManager = [AFHTTPRequestOperationManager manager];
        [network configUUID];
    });
    
    return network;
}
- (void) cancelAllNetWork
{
    [_networkManager.operationQueue cancelAllOperations];
}
/**
 *  初始化UUID
 */
- (void)configUUID {
    if(NSClassFromString(@"UIDevice") && [UIDevice instancesRespondToSelector:@selector(identifierForVendor)]) {
        // only available in iOS >= 6.0
        NSString *uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
        uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
        self.uuid = uuid;
    }
}

- (void)accessServerWithUIViewController:(UIViewController *)Controller WithAction:(NSString *)action WithParam:(NSDictionary *)ParamDic WithBlock:(void (^)(THNetWorkError *, NSDictionary *))block
{
    //拼接接口网址
    NSString *url = self.urlStr==nil ? @"" : self.urlStr;
    //格式化数据然后加密
    NSString *params = [self httpParamWithAction:action WithParam:ParamDic];
    //self.networkManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    self.networkManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //请求接口
    //请求接口
    [self.networkManager POST:url
                   parameters:params
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          //判断取消网络请求
//                          if(task.cancelled){
//                              return ;
//                          }
                          //获取数据
                          NSData *responData = responseObject;
                          NSDictionary* responDic = [self responDictionaryWithResponData:responData];
                          if (!responDic) {
                              block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                      withCode:CODE_DATA_IS_NULL
                                                               withDescription:@"返回的数据为空"],nil);
                              return;
                          }
                          //判断请求是否正常
                          NSString* isErrorStr = [NSString stringWithFormat:@"%@",[responDic valueForKey:@"r"]];
                          if ([isErrorStr isEqualToString:@"0"]) {
                              NSInteger errorCode = [[responDic valueForKey:@"Err"] integerValue];
                              NSString *errorMessage = [responDic valueForKey:@"ErrMsg"];
                              switch (errorCode) {
                                  case CODE_NULLACTION_ERROR:
                                      block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                              withCode:CODE_NULLACTION_ERROR
                                                                       withDescription:@"无效的请求动作"],nil);
                                      break;
                                  case CODE_LOGINUSER_ERROR:
                                      block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                              withCode:CODE_LOGINUSER_ERROR
                                                                       withDescription:errorMessage],nil);
                                      break;
                                  case CODE_SECRETKEY_ERROR:
                                      block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                              withCode:CODE_SECRETKEY_ERROR
                                                                       withDescription:@"密匙验证失败"],nil);
                                      break;
                                  case CODE_USETREGISTER_ERROR:
                                      block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                              withCode:CODE_SECRETKEY_ERROR
                                                                       withDescription:errorMessage],nil);
                                      break;
                                  case CODE_LOGIN_OUT:
                                      block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                              withCode:CODE_LOGIN_OUT
                                                                       withDescription:@"登陆过期"],nil);
                                      if (![userManager sharedInstance].islogin) {
                                          break;
                                      }
                                      [Controller showToastWithMsg:@"登录失效请重新登录"];
                                      [[userManager sharedInstance] userUnLogin];
                                      break;
                              }
                              return;
                          }
                          else{
                              NSDictionary *response = [responDic valueForKey:@"d"];
                              THNetWorkError *error = nil;
                              if ([response valueForKey:@"Result"] == 0) {
                                 error =  [THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService
                                                                             withCode:CODE_RESPONSE_CODE_ZERO
                                                                      withDescription:@"Result等于0"];
                              }
                              //请求完成
                              block(error,response);
                          }
                   }
                      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       
                       NSLog(@"fuck_____________________fuck!!!!!!!!!!!");
                      // NSLog(@"HTTP Request failure: %@", error);
                       // 判断取消网络请求
//                       if (task.cancelled) {
//                           return;
//                       }
                       // 网络请求出错
                       block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeLocal withCode:0 withDescription:@"网络请求失败"],nil);
                          [Controller showToastWithMsg:@"网络连接失败"];
                   }];
}
/**
 *  格式化以及加密操作
 *
 *  @param action   接口请求动作
 *  @param paramDic 请求参数字典
 *
 *  @return 加密后得Data用于Post请求
 */
- (NSString *)httpParamWithAction:(NSString *)action WithParam:(NSDictionary *)paramDic
{
    //版本号
    NSString *versionCode = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] stringByReplacingOccurrencesOfString:@"." withString:@""];
    //签名码 两次md5加密
    NSString *signedString = [[NSString stringWithFormat:@"%@%@", [paramDic mj_JSONString], self.uuid] md5];
    signedString = [signedString md5];
    //参数字典
    NSDictionary *httpDic = @{
                              @"a":action,
                              @"d":paramDic,
                              @"s":signedString,
                              @"t":self.token==nil ? @"":self.token,
                              @"at":@"2",
                              @"v":versionCode,
                              @"f":@"00004"
                              };
    NSString *httpStr = [httpDic mj_JSONString];
    NSLog(@"=====================");
    NSLog(@"THNetwork:urlStr = %@",self.urlStr);
    NSLog(@"THNetwork:httpStr = %@",httpStr);
    NSLog(@"=====================");
    //加密操作
    NSString *base64Str = [GTMBase64 stringByEncodingData:[httpStr dataUsingEncoding:NSUTF8StringEncoding]];
    //自定义的加密方法
    base64Str = [self customEncryptWithString:base64Str];
   // NSData* params = [base64Str dataUsingEncoding:NSUTF8StringEncoding];
   // NSData* test = [@"a" dataUsingEncoding:NSUTF8StringEncoding];
    
   // return params;
    return base64Str;
}
/**
 *  先解压后base64解码
 *
 *  @param responData 请求返回字典
 *
 *  @return 解密后字典
 */
- (NSDictionary *)responDictionaryWithResponData:(NSData *)responData
{
    responData = [LFCGzipUtillity uncompressZippedData:responData];
    NSString *strBase64 = [[NSString alloc]initWithData:responData encoding:NSUTF8StringEncoding];
   // NSLog(@"%@",strBase64);
    strBase64 = [self customDecodeWithString:strBase64];
   // NSLog(@"%@",strBase64);
    NSString *strDecoded = [GTMBase64 stringByBase64String:strBase64];
   // NSLog(@"strDecoded == %@",strDecoded);
    NSDictionary *dic = [strDecoded mj_JSONObject];
    
    return dic;
}
/**
 *  自定义加密方法
 *
 *  @param encString 加密字符,在字符串中的第三位后和第一位以及最后一位插入随机字符
 *
 *  @return 加密后字符串
 */
- (NSString *)customEncryptWithString:(NSString *)encString{
    NSMutableString *EncString = [NSMutableString stringWithFormat:@"%@",encString];
    [EncString insertString:[self generateRandomString] atIndex:3];
    [EncString insertString:[self generateRandomString] atIndex:0];
    [EncString insertString:[self generateRandomString] atIndex:[EncString length]];
    return [NSString stringWithFormat:@"%@",EncString];
}
/**
 *  自定义解密方法
 *
 *  @param decString 解密字符,删除字符串中的第一位和最后一位以及第四位
 *
 *  @return 解密后字符串
 */
- (NSString *)customDecodeWithString:(NSString *)decString{
    //处理异常情况
    if (!decString) {
        return @"";
    }
    if ([decString isEqualToString:@""]) {
        return @"";
    }
    NSMutableString *DecString = [NSMutableString stringWithFormat:@"%@",decString];
    [DecString deleteCharactersInRange:NSMakeRange(0, 1)];
    [DecString deleteCharactersInRange:NSMakeRange([DecString length]-1, 1)];
    [DecString deleteCharactersInRange:NSMakeRange(3, 1)];
    return DecString;
}
/**
 *  根据BaseStr产生随机字符
 *
 *  @return 随机字符
 */
- (NSString *)generateRandomString{
    NSInteger inta = (arc4random_uniform(64));
    NSString *randomStr = [BaseStr substringWithRange:NSMakeRange(inta, 1)];
    return randomStr;
}

//- (void) creatUploadTasktwo {
//    // 创建请求管理者
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
////    [mgr POST:@"http://192.168.0.53:8099/" parameters:[NSDictionary dictionary] constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
////
////    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        NSLog(@"%@",responseObject);
////    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        NSLog(@"%@",error);
////    }];
//    
//    [mgr POST:@"http://192.168.0.53:8099" parameters:[NSDictionary dictionary] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        UIImage *upImage = [UIImage imageNamed:@"默认头像"];
//        NSData *imageData = UIImagePNGRepresentation(upImage);
//        [formData appendPartWithFileData:imageData name:@"image" fileName:@"zxd" mimeType:@"png"];
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%@",uploadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        //NSLog(@"%@",error);
//    }];
//    
//}

- (void)creatUploadTaskWithParameters:(NSDictionary *)parameter Action:(NSString *)action file:(upLoadFile *)loadFile success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    //格式化数据然后加密
    NSString *params = [self httpParamWithAction:action WithParam:parameter];
    params = [NSString stringWithFormat:@"%@%@?s=%@",SERVER_URL,@"UploadFile.aspx",params];
    lieonLog(@"params:%@",params);
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    multipartFormRequestWithMethod:@"POST" URLString:params parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:loadFile.fileData name:loadFile.name fileName:loadFile.fileName mimeType:loadFile.type];
    } error:nil];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    manager.responseSerializer = [[ AFHTTPRequestSerializer alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request
                                                                       progress:nil
                                                              completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                                if (error) {
                                                                    NSLog(@"Error: %@", error);
                                                                    failure(error);
                                                                  
                                                                    
                                                                } else {
                                                                    NSLog(@"%@ %@", response, responseObject);
                                                                    NSDictionary* responDic = [self responDictionaryWithResponData:responseObject];
                                                                    success(responDic);
                                                                                     }
        
    }];
    
    [uploadTask resume];
}
@end
