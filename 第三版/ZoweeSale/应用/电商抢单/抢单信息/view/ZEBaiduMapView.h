//
//  ZEBaiduMapView.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>
#import "ZEGrabCustomerResult.h"

@interface ZEBaiduMapView : UIView
//@property (nonatomic ,assign) CLLocationCoordinate2D customerPt;

@property (nonatomic,strong) ZEGrabCustomerResult *result;

@end
