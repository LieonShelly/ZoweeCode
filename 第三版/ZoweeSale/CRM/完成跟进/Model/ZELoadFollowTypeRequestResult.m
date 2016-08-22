//
//  ZELoadFollowTypeRequestResult.m
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZELoadFollowTypeRequestResult.h"
#import "ZELoadFollowType.h"
#import "MJExtension.h"

@implementation ZELoadFollowTypeRequestResult

/**
 *  重写MJ的这个方法,使ReturnParList这个数组存放ZELoadFollowType这个模型
 *
 *
 */
+(NSDictionary *)mj_objectClassInArray
{
    return @{@"ReturnParList" : [ZELoadFollowType class]};
}

@end
