//
//  CHRenderView.h
//  Magnifier
//
//  Created by Chenhao on 14-2-25.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHRenderView;
@protocol CHRenderViewDelegate <NSObject>

@optional
- (void)CHRenderViewDidEndDrawMark:(CHRenderView*)renderVeiew;

@end

@interface CHRenderView : UIView

/**
 *   图片数据
 */
@property (nonatomic,strong)  NSData  * photoData;

/**
 * 是否是要标注
 */
@property (nonatomic) BOOL canBeMark;

@property(nonatomic,weak) id<CHRenderViewDelegate>  delegate;


@end
