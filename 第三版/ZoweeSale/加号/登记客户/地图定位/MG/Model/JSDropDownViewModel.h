//
//  JSDropDownViewModel.h
//  ZoweeSale
//
//  Created by wanglj on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSDropDownMenu.h"
@class JSDropDownViewModel;
typedef void(^viewModelNetFinish)(JSDropDownViewModel * viewModel);

@interface JSDropDownViewModel : NSObject<JSDropDownMenuDataSource,JSDropDownMenuDelegate>

@property (nonatomic ,copy) viewModelNetFinish finshBlock;


- (instancetype)initWithBlock:(viewModelNetFinish)block;
@end
