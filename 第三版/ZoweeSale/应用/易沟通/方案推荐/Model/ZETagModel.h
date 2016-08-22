//
//  ZETagModel.h
//  ZoweeSale
//
//  Created by lieon on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

typedef enum {
    ZETagModelTypeStyle,
    ZETagModelTypeHourseType,
    ZETagModelTypeRoomType,
    
}ZETagModelType;
#import <Foundation/Foundation.h>

typedef void(^TagModelBlock)(NSArray * models);

@interface ZETagModel : NSObject

/**Integer	组ID
 */
@property (nonatomic ,strong) NSNumber * GroupID;
/**
 *  Integer	ID
 */
@property (nonatomic ,strong)  NSNumber * ID;
/**
 *  String	标签字符串
 */
@property (nonatomic ,copy) NSString * Title;

@property (nonatomic ) ZETagModelType  type;

+ (void)requestStyle:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure;

+ (void)requestRoomType:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure;

+ (void)requestHourseType:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure;

@end
