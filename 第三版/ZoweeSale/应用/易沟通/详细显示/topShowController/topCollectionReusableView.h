//
//  topCollectionReusableView.h
//  iPadMG
//
//  Created by wanglj on 15/11/20.
//  Copyright © 2015年 wanglj. All rights reserved.
//


#import "TYAttributedLabel.h"

@interface topCollectionReusableView : UICollectionReusableView

+ (CGFloat)heightWithText:(NSString *)text;

- (void)titleText:(NSString *)text withNum:(NSInteger)num;

@end
