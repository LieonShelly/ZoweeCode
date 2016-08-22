//
//  ZEYearTargetView.h
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZEYearTargetView : UIView
@property(nonatomic,strong)NSNumber * totalAmount;
/**
 *  个人还是全门店  1：全门店  2：个人
 */
@property(nonatomic,strong)NSNumber * Type;
@end
