//
//  customerMapAddressViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>



@interface customerMapAddressViewController : UIViewController

@property (nonatomic ,assign) CLLocationCoordinate2D customerPt;

@property (nonatomic ,strong) NSString *customerAddress;

@end
