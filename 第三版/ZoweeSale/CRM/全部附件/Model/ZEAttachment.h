//
//  ZEAttachment.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FileType) {
    FileTypeMeasure = 0,//量尺出图
    FileTypeContract,//签约附件
    FileTypeMark,//标注图
};

@interface ZEAttachment : NSObject
@property (nonatomic ,copy) NSString *FileName;

@property (nonatomic ,copy) NSNumber *FileSize;

@property (nonatomic ,copy) NSString *CreateTime;

@property (nonatomic ,assign) FileType FileType;

@property (nonatomic ,copy) NSString *FilePath;

@property (nonatomic ,copy) NSString *ThumbnailPath;
@end
