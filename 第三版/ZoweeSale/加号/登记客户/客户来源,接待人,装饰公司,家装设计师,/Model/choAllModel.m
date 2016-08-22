//
//  choAllModel.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "choAllModel.h"

@implementation choAllModel



- (NSString *)Title {
    if (!_Title.isNoEmpty) {
        return _Name;
    }
    return _Title;
}

- (NSString *)Name {
    if (!_Name.isNoEmpty) {
        return _Title;
    }
    return _Name;
}

@end
