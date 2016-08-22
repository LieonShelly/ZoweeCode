//
//  customerMapAddressViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "customerMapAddressViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface customerMapAddressViewController ()<BMKMapViewDelegate>

@property (nonatomic ,strong) BMKMapView *mapView;

@end

@implementation customerMapAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"地图";
    [self uiInitSet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self addCustomerPointAnnotation];
    });
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)uiInitSet {
    _mapView = [[BMKMapView alloc]init];
    _mapView.zoomLevel = 17;
    [self.view addSubview:_mapView];
    _mapView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [_mapView setCenterCoordinate:_customerPt];
}

//添加标注
- (void)addCustomerPointAnnotation
{
    BMKPointAnnotation* pointAnnotation;
    if (pointAnnotation == nil) {
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        pointAnnotation.coordinate = _customerPt;
        pointAnnotation.title = self.customerAddress;
        pointAnnotation.subtitle = @"";
    }
    [_mapView addAnnotation:pointAnnotation];
}

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    //普通annotation
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
    [annotationView setSelected:YES animated:YES];
    return annotationView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
