//
//  ZEItem.h
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEItem : NSObject

//warning 定义Block
typedef void (^optionBlock)();

//图标
@property (nonatomic,copy) NSString * icon;
//标题
@property(nonatomic,copy) NSString * title;
//detail
@property(nonatomic,copy) NSString * subTitle;


//定义Block保存将来要执行的代码
@property(nonatomic,copy) optionBlock option;


-(instancetype)initWithIcon:(NSString*)icon title:(NSString*)title;

@end
