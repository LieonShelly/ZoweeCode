//
//  ZEAwsomeMenuModel.h
//  ZoweeSale
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEAwsomeMenuModel : NSObject
@property(nonatomic,copy) NSString * iconName;
@property(nonatomic,copy) NSString * tittle;


- initWithIconName:(NSString*)iconName title:(NSString*)title;

+ (NSDictionary*)awsomeMenuModels;

@end
