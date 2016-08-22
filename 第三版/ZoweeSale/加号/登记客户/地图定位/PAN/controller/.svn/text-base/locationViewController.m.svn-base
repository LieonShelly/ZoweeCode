//
//  locationViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "locationViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIButton+Extension.h"

#import "mapLocationTableViewCell.h"
#import "ZEXVoice.h"


@interface locationViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,BMKPoiSearchDelegate,IFlyRecognizerViewDelegate>

@property (nonatomic ,strong) BMKMapView *mapView;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UITextField *textfield;

@property (nonatomic ,strong) NSArray *mapLocationArray;
@property (nonatomic ,assign) NSInteger curPage;
@property (nonatomic ,assign) BOOL isLocationSucceed;
@property (nonatomic ,strong) NSString *searchKeyWord;


@property (nonatomic, strong)BMKLocationService *locService;
@property (nonatomic, strong)BMKGeoCodeSearch *geocodesearch;
@property (nonatomic ,strong)BMKPoiSearch *poisearch;
@property (nonatomic, strong)mapLocation *selectedModel;

@property (nonatomic, assign)CLLocationCoordinate2D userLocation;


@property (nonatomic, strong)ZEXVoice  *voice;


@end

@implementation locationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"定位";
    self.navigationController.navigationBar.hidden = NO;
    [self uiInitSet];
    [self baiduMapInitSet];
    _curPage = 0;
    _searchKeyWord = @"楼盘";
    // Do any additional setup after loading the view.
}

- (void)uiInitSet {
    UIView *topView = [UIView new];
    topView.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    [self.view addSubview:topView];
    topView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(59);
    /**
     *  搜索框
     */
    _textfield = [UITextField new];
    _textfield.borderStyle = UITextBorderStyleRoundedRect;
    _textfield.backgroundColor = [UIColor whiteColor];
    _textfield.clearButtonMode = UITextFieldViewModeAlways;
    _textfield.placeholder = @"搜索";
    _textfield.returnKeyType = UIReturnKeySearch;
    _textfield.font = [UIFont systemFontOfSize:15];
    _textfield.textColor = [UIColor colorWithHexString:@"666666"];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"地图搜索"]];
    [leftView addSubview:leftImage];
    leftImage.sd_layout
    .rightSpaceToView(leftView,5)
    .centerYEqualToView(leftView)
    .heightIs(12)
    .widthIs(12);
    _textfield.leftView = leftView;
    _textfield.leftViewMode =  UITextFieldViewModeAlways;
    _textfield.delegate = self;
    [topView addSubview:_textfield];
    _textfield.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(10, 25, 10, 40));
    
    UIButton *voiceBtn = [[UIButton alloc]init];
    [voiceBtn addTarget:self action:@selector(iflyBtnClick)];
    voiceBtn.image = @"Voice";
    [topView addSubview:voiceBtn];
    voiceBtn.sd_layout
    .leftSpaceToView(_textfield,0)
    .topEqualToView(topView)
    .bottomEqualToView(topView)
    .widthIs(40);
    
    self.mapView = [[BMKMapView alloc]init];
    [self.view addSubview:_mapView];
    _mapView.sd_layout
    .topSpaceToView(topView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(275);
    /**
     地图中心
     */
    UIImageView *centerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"地图中心"]];
    [_mapView addSubview:centerImageView];
    centerImageView.sd_layout
    .heightIs(24)
    .widthIs(20)
    .centerYEqualToView(_mapView)
    .centerXEqualToView(_mapView);
    
    UIButton * mylocationBtn = [[UIButton alloc]init];
    [mylocationBtn setImage:[UIImage imageNamed:@"我的位置"] forState:UIControlStateNormal];
    mylocationBtn.backgroundColor = [UIColor whiteColor];
    [mylocationBtn addTarget:self action:@selector(myLocationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:mylocationBtn];
    mylocationBtn.sd_cornerRadius = @5;
    mylocationBtn.sd_layout
    .rightSpaceToView(_mapView,10)
    .bottomSpaceToView(_mapView,10)
    .widthIs(35)
    .heightIs(35);
    
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[mapLocationTableViewCell class] forCellReuseIdentifier:@"maplocation"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .topSpaceToView(_mapView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
}

- (void)baiduMapInitSet {
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _poisearch = [[BMKPoiSearch alloc]init];
    
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.zoomLevel = 17;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    _poisearch.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _locService.delegate = nil;
    _geocodesearch.delegate = nil;
    _poisearch.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mapLocationArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    mapLocation *model = self.mapLocationArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[mapLocationTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    mapLocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maplocation"];
    cell.model = self.mapLocationArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    mapLocation *model = self.mapLocationArray[indexPath.row];
    self.selectedModel = model;
    [self baiduReverseGeoCode:model.pt];
}
#pragma mark - 百度地图定位Delegate
- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};
    pt = _mapView.centerCoordinate;
    [self baiduPoiSearchStart:pt];
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    
    //  NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //[_mapView setCenterCoordinate:userLocation.location.coordinate];
    //[_locService stopUserLocationService];
    _userLocation = userLocation.location.coordinate;
    if(!_isLocationSucceed) {
        [self baiduPoiSearchStart:userLocation.location.coordinate];
        _isLocationSucceed = YES;
    }
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

#pragma mark - 百度地图 地理信息编码

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    // NSLog(@"didUpdateUserLocation lat %f,long %f",result.location.latitude,result.location.longitude);
    NSLog(@"address: %@",result.addressDetail);
    self.selectedModel.ProvinceName = result.addressDetail.province;
    self.selectedModel.CityName = result.addressDetail.city;
    self.selectedModel.CountyName = result.addressDetail.district;
    if ([self.Locdelegate respondsToSelector:@selector(checkedWithLocationModel:)]) {
        [self.Locdelegate checkedWithLocationModel:self.selectedModel];
    }
    [self.navigationController popViewControllerAnimated:YES];
    // [_locService stopUserLocationService];
}

#pragma mark - implement BMKSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        NSMutableArray *locatArray = [NSMutableArray array];
        for (int i = 0; i < result.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            mapLocation *location = [[mapLocation alloc]init];
            location.HouseName = poi.name;
            location.Address = poi.address;
            location.CityName = poi.city;
            location.PointX = [NSNumber numberWithFloat:poi.pt.latitude];
            location.PointY = [NSNumber numberWithFloat:poi.pt.longitude];
            location.pt = poi.pt;
            [locatArray addObject:location];
        }
        self.mapLocationArray = [NSArray arrayWithArray:locatArray];
        [_tableView reloadData];
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}
#pragma mark - 辅助方法
/**
 *  使用百度地图Poi搜索功能
 *
 *  @param userLocation 用户搜索的地址
 */
- (void) baiduPoiSearchStart:(CLLocationCoordinate2D)userLocation {
    if (!(_textfield.text.length > 0)) {
        _searchKeyWord = @"楼盘";
    }else {
        _searchKeyWord = _textfield.text;
    }
    BMKNearbySearchOption *nearbySearchOption = [[BMKNearbySearchOption alloc]init];
    nearbySearchOption.pageIndex = 0;
    nearbySearchOption.pageCapacity = 30;
    nearbySearchOption.location = userLocation;
    nearbySearchOption.radius = 1000;
    nearbySearchOption.keyword = _searchKeyWord;
    BOOL flag = [_poisearch poiSearchNearBy:nearbySearchOption];
    if(flag)
    {
        NSLog(@"周围楼盘信息检索发送成功");
    }
    else
    {
        NSLog(@"周围楼盘信息检索发送失败");
    }
}
/**
 *  使用百度地图的反编码功能
 *
 *  @param pt 反编码地址
 */
- (void) baiduReverseGeoCode:(CLLocationCoordinate2D)pt {
//    NSLog(@"%f,%f",_mapView.centerCoordinate.latitude,_mapView.centerCoordinate.longitude);
//    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};
//    pt = _mapView.centerCoordinate;
    BMKReverseGeoCodeOption *reverseGeoCodeOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeOption.reverseGeoPoint = pt;
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeoCodeOption];
    if(flag){
        NSLog(@"反geo检索发送成功");
    }
    else{
        NSLog(@"反geo检索发送失败");
    }
    
}

#pragma mark - textfieldDelegate 

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (!(textField.text.length > 0)) {
        _searchKeyWord = @"楼盘";
    }else {
        _searchKeyWord = textField.text;
    }
    [self baiduPoiSearchStart:_mapView.centerCoordinate];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 我的位置按钮

- (void)myLocationBtnClick:(UIButton*)sender {
    if (_isLocationSucceed) {
        [_mapView setCenterCoordinate:_userLocation animated:YES];
    }
    
    
}

-(void)iflyBtnClick{
    if(_voice == nil)
    {
        _voice = [[ZEXVoice alloc]initWithDelegate:self];
    }
    
    [_textfield setText:@""];
    [_textfield resignFirstResponder];
    
    [_voice start];
}

/**
 听写结束回调（注：无论听写是否正确都会回调）
 error.errorCode =
 0     听写正确
 other 听写出错
 ****/
- (void) onError:(IFlySpeechError *) error
{
}
/**
 有界面，听写结果回调
 resultArray：听写结果
 isLast：表示最后一次
 ****/
- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    NSString *newStr = [NSString stringWithFormat:@"%@%@",_textfield.text,result];
    _textfield.text = newStr;
    if (!(_textfield.text.length > 0)) {
        _searchKeyWord = @"楼盘";
    }else {
        _searchKeyWord = _textfield.text;
    }
    [self baiduPoiSearchStart:_mapView.centerCoordinate];

    
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
