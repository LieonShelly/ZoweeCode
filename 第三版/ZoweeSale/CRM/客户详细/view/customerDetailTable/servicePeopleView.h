//
//  servicePeopleView.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teamInfo : NSObject

@property (nonatomic) NSNumber *UserID;

@property (nonatomic) NSString *UserName;

@property (nonatomic) NSString *JobName;

@property (nonatomic) NSString *Url;

@end

@interface servicePeopleView : UIView




- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithInfo:(teamInfo *)info;





@end
