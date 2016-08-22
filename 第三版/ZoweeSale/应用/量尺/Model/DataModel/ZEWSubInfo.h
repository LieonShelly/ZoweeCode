//
//  ZEWSubInfo.h
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//  墙体上附加物信息



#import <Foundation/Foundation.h>



@interface ZEWSubInfo : NSObject<NSCoding>



/**
 *  String
 附加物名称
 */
@property(nonatomic,copy)NSString * WallSubTitle;

/**
 *  Integer
 附加物组
 目前组都默认为0
 以后东西多了 会拆分出来   比如  0 代表 门  1 代表窗子 2 室内装饰物 等等
 
 */
@property(nonatomic,strong)NSNumber * WSGroup;

/**
 *  Integer
 附加物类型
 0 代表门  1代表窗  2 代表 墙柱 ，3代表双开门
 目前就着三个
 */
@property(nonatomic,strong)NSNumber *  WSType;

/**
 *  String
 附加物编号
 */
@property(nonatomic,copy)NSString * WSNo;

/**
 *  String
 附加物描述
 */
@property(nonatomic,copy)NSString * WSRemark;

/**
 *  Integer
 附加物左右属性(0,向左，1，向右)
 */
@property(nonatomic,strong)NSNumber * WSSides;

/**
 *  Integer
 附加物向里向外(0,向内，1，向外)
 */
@property(nonatomic,strong)NSNumber * WSInSides;

/**
 *  Double
 附加物起点X
 */
@property(nonatomic,strong)NSNumber * WSSX;

/**
 *  Double
 附加物起点Y
 */
@property(nonatomic,strong)NSNumber * WSSY;

/**
 *  Double
 附加物终点X
 */
@property(nonatomic,strong)NSNumber * WSEX;

/**
 *  Double
 附加物终点Y
 */
@property(nonatomic,strong)NSNumber * WSEY;

/**
 *  Double
 附加物长度--> 界面上的宽度
 */
@property(nonatomic,strong)NSNumber * WSLength;

/**
 *
	Double	附加物高度 --> 界面上控件的高度
 */
@property(nonatomic,strong)NSNumber * WSHeight;
/**
 *  String
 墙体编号
 */
@property(nonatomic,copy) NSString * WSWallNo;


@end
