//
//  ZEBaiduMapView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaiduMapView.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import "ZETHAnnotationView.h"
#import "ZETHPointAnnotation.h"

@interface ZEBaiduMapView ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic ,strong) BMKMapView *mapView;

@property (nonatomic, strong)BMKLocationService *locService;

@end

@implementation ZEBaiduMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
        self.hidden = YES;
    }
    return self;
}

- (void)setup{
    self.mapView = [[BMKMapView alloc]init];
    [self addSubview:_mapView];
    _mapView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self baiduMapInitSet];
    
}

- (void)baiduMapInitSet {
    _locService = [[BMKLocationService alloc]init];
//    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
//    _poisearch = [[BMKPoiSearch alloc]init];
//    
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.zoomLevel = 15;
    
    _mapView.delegate = self;
    _locService.delegate = self;
}
/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
   // [_mapView updateLocationData:userLocation];
    //_customerPt = userLocation.location.coordinate;
    //[self addCustomerPointAnnotation];
    //  NSLog(@"heading is %@",userLocation.heading);
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation;{
   // _mapView.centerCoordinate = userLocation.location.coordinate;
    [_mapView updateLocationData:userLocation];
}

//添加标注
- (void)addCustomerPointAnnotation:(CLLocationCoordinate2D)customerPt
{
    ZETHPointAnnotation* pointAnnotation;
    if (pointAnnotation == nil) {
        pointAnnotation = [[ZETHPointAnnotation alloc]init];
        pointAnnotation.coordinate = customerPt;
        pointAnnotation.title = _result.CustomerName;
        pointAnnotation.subtitle = _result.Address;
    }
    [_mapView addAnnotation:pointAnnotation];
}

- (void)setResult:(ZEGrabCustomerResult *)result{
    if (!result) {
        return;
    }
    if (![result isKindOfClass:[ZEGrabCustomerResult class]]) {
        result = [ZEGrabCustomerResult mj_objectWithKeyValues:result];
        if (!result) {
            return;
        }
    }
    _result = result;
    [self setUI];
    self.hidden = NO; 
}
- (void)setUI{
    CLLocationCoordinate2D customerPt = CLLocationCoordinate2DMake([_result.PointX doubleValue], [_result.PointY doubleValue]);
    [self addCustomerPointAnnotation:customerPt];
}


// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    //普通annotation
    if ([annotation isMemberOfClass:[BMKPointAnnotation class]]) {
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = YES;
        }
        return annotationView;
    }else if ([annotation isMemberOfClass:[ZETHPointAnnotation class]]) {
        NSString *AnnotationViewID = @"THPointMark";
        ZETHAnnotationView *annotationView = (ZETHAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[ZETHAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            annotationView.title = annotation.title;
            annotationView.subtitle = annotation.subtitle;
            // 设置可拖拽
            //annotationView.draggable = YES;
           // [//annotationView setSelected:NO animated:YES];
        }
        return annotationView;
    }
    return nil;
}

@end
