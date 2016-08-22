//
//  ZEWallEditOption.h
//  ZoweeSale
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^funcBlock)();
@interface ZEWallEditOption : NSObject
@property(nonatomic,copy) NSString * optionName;
@property(nonatomic,copy) NSString * iconName;
/**
 *  对应的功能
 */
@property(nonatomic,copy) funcBlock function;

- (instancetype)initWithIconName:(NSString*)iconName function:(funcBlock)f title:(NSString*)title;

@end
