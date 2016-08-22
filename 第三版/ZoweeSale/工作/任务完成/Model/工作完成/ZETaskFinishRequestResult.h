//
//  ZETaskFinishRequestResult.h
//  ZoweeSale
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZETaskFinishRequestResult : NSObject

/** 存放TaskFinish模型 */
@property (nonatomic,strong) NSArray * ReturnParList;
/** 返回结果的状态码*/
@property(nonatomic,assign) NSInteger Result;


@end
