//
//  ZELoginModel.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZELoginModel : NSObject

@property (nonatomic ,copy) NSString *UserToken;

@property (nonatomic ,copy) NSString *UserName;

@property (nonatomic ,strong) NSNumber *UserID;

@property (nonatomic ,strong) NSNumber *JoinID;

@property (nonatomic ,copy) NSString *Url;

@property (nonatomic ,copy) NSString *PermissionNo;
@end
