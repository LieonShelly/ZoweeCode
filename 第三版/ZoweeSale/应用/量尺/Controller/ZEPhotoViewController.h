//
//  ZEPhotoViewController.h
//  ZoweeSale
//
//  Created by apple on 4/27/16.
//  Copyright © 2016 TH. All rights reserved.
//  标注图

#import <UIKit/UIKit.h>
#import "ZEMarkArrow.h"
#import "ZEImageInfo.h"

@interface ZEPhotoViewController : UIViewController<ZEMarkArrowDelgate>

/**
 *   图片数据
 */
@property (nonatomic,strong)  NSData  * photoData;

/**
 *  上传图片需要给服务器的参数，上级页面需要传
 *  订单ID  *ProjectID;
 *  房间编号 *RoomNo;
 */
@property (nonatomic,strong) ZEImageInfo * imageInfo;

@end
