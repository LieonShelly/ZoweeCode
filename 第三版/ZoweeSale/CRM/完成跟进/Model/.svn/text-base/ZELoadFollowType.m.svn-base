//
//  ZELoadFollowType.m
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#define ZELoadFllowTypePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"LoadFllowTypePath.data"]


#import "ZELoadFollowType.h"
#import "MJExtension.h"

@implementation ZELoadFollowType

MJCodingImplementation


+ (void)saveLoadFollowType:(ZELoadFollowType*)type
{
    [NSKeyedArchiver archiveRootObject:type toFile:ZELoadFllowTypePath];
}
+ (instancetype)loadFllowType
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:ZELoadFllowTypePath];
}


@end
