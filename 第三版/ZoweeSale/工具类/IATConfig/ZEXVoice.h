//
//  ZEXVoice.h
//  ZoweeSale
//
//  Created by wanglj on 16/7/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IATConfig.h"

@interface ZEXVoice : NSObject

- (instancetype) initWithDelegate:(id<IFlyRecognizerViewDelegate>)delegaet;

- (void)start;

@end
