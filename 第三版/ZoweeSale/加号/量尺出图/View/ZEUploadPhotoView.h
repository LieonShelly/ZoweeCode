//
//  ZEUploadPhotoView.h
//  ZoweeSale
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^uploadBlcok)(id reponse);

@class ZEUploadPhotoView;
@protocol ZEUploadPhotoViewDelegate <NSObject>

@optional
- (void)uploadPhotoViewDidSletectedAddItem:(ZEUploadPhotoView*)uploadView ;


@end

@interface ZEUploadPhotoView : UICollectionView

/**
 *  存储所有的图片数据
 */
@property (nonatomic,strong) NSMutableArray * photoArray;

/**
 *  外部图片数据接口
 */
@property (nonatomic,strong) NSData  * photoData;

@property(nonatomic,weak) id<ZEUploadPhotoViewDelegate> uploadDelegate;


/**
 *  上传图片，只需要传入参数
 */
- (void)uploadPhotoWithParam:(NSDictionary*)param;

@end
