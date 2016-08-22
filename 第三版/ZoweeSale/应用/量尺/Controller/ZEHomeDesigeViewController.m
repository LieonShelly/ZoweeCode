 //
//  ZEHomeDesigeViewController.m
//  easyMeasure
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 TH. All rights reserved.
//


#define defaultWsubUISize (self.wsubInfo.WSType.integerValue <= 2 ? CGSizeMake(96, 96) : CGSizeMake(80, 80))
#define arrowInset 0
#define filePath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define wallThicknessInView [filePath stringByAppendingPathComponent:@"wallThickInView.plist"]

#define toolTableViewHeight(modelCount,cellHeight,headerHeight) ((modelCount * cellHeight  > 400 ? 400 : modelCount * cellHeight ) + headerHeight)
#define animationDuration 1.0


#import "ZEHomeDesigeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEToolTabeleView.h"
#import "ZEDetaileTabView.h"
#import "ZEDoorHeader.h"
#import "ZEToolTbaleHeaderView.h"
#import "ZEMeasureTool.h"
#import "ZEToolTableModel.h"
#import "ZEtoolTableHeaderModel.h"
#import "ZWWallLayer.h"
#import "ZEButton.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "MBProgressHUD+NJ.h"
#import "ZEHomeDPhotosViewController.h"
#import "ApplicationManage.h"
#import "ZEPhotoViewController.h"
#import "ZEDoorButton.h"
#import "ZERoomInfo.h"
#import "ZECoverButton.h"
#import "MJExtension.h"
#import "ZWWSubUIContainer.h"
#import "ZEEditArrow.h"
#import "ZEArrowButton.h"
#import "Masonry.h"
#import "SVProgressHUD.h"
#import "TYAlertController.h"
#import "ZEMarkView.h"
#import "ZEFurnitureView.h"

typedef enum{
    ZEArrowTyeUp,
    ZEArrowTyeDown,
}ZEArrowTye;

@interface ZEHomeDesigeViewController ()<CBCentralManagerDelegate,CBPeripheralDelegate,ZEToolTabeleViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,ZEEditArrowDelegate,ZEFurnitureViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (weak, nonatomic) IBOutlet UIButton *lazerBtn;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIView *drawboardView;
@property (nonatomic,strong) ZEToolTabeleView * toolTableView;

@property (nonatomic ,strong) ZEFurnitureView * furnitureView;

@property (nonatomic,weak) ZEButton * selectBtn;
@property(nonatomic,strong) ZEToolTbaleHeaderView * toolheaderView;
@property (nonatomic,strong) ZEDoorHeader * doorHeader;
@property (nonatomic,strong) ZEDetaileTabView *detaileTab;

/**
  单击某面墙的编辑菜单的数据模型数组
 */
@property(nonatomic,strong) NSMutableArray * wallEditOptions;

#warning 下面的三个数组存放相同的模型
/**
 单击某个房间的编辑菜单的数据模型数组
 */
@property(nonatomic,strong) NSMutableArray * roomEditOptions;

/**
 *  附加物模型数组
 */
@property(nonatomic,strong) NSMutableArray * appendingObjects;

/**
 * 单击某个门的编辑菜单的数据模型数组
 */
@property(nonatomic,strong) NSMutableArray * doorEditOptions;


@property (nonatomic)UIView *contentView;
/**
 *   记录画图板contentView上的pan手势
 */
@property (nonatomic,weak) UIPanGestureRecognizer * pan;

/**
 *  toolTableView上的pan手势
 */
@property (nonatomic,strong) UIPanGestureRecognizer * toolTableViewPan;

/**
 *  toolTableView在画图板上的位置
 */
@property(nonatomic,assign)  CGRect toolTableViewFrameInContentView;



/**
 *  contenView上的点击手势
 */
@property (nonatomic,strong)  UITapGestureRecognizer * tap;
/**
 *  手势移动的时候在画板出现的墙体附加物
 */
@property(nonatomic,strong) ZEWSubUI * movingWSubUI;

@property (nonatomic,weak) ZEWSubUI * lastSelectedDoor;

/**
 *  存储四面墙
 */
@property (nonatomic,strong) NSArray * wallLayers;

/**
 *   存储所有墙的附加物
 */
@property (nonatomic,strong) NSMutableArray * wusbUIArray;

/**
 * 记录选中的墙
 */
@property (nonatomic,strong) ZWWallLayer * selectedWallLayer;





/**     激光测距仪相关    **/
@property(nonatomic,strong) CBCentralManager * centalManager;

@property(nonatomic,strong) NSMutableArray * periphals;

@property(nonatomic,strong) NSMutableArray * lengthes;


/**
 *  数据实体
 */

@property (nonatomic,strong) ZEOrderInfo *orderInfo;


/**
 *  点击房间产生的蒙版
 */
@property (nonatomic,strong) ZECoverButton *roomCover;
/**
 *  存储墙体的数据模型
 */
@property (nonatomic,strong) NSMutableArray * wallInfoArray;
/**
 *  记录墙体附加物的信息
 */
@property (nonatomic,strong) ZEWSubInfo *wsubInfo;

/**
 *  存储所有墙体的附加物信息
 */
@property (nonatomic,strong) NSMutableArray * wsubInfoArray;

/**
 *  选中的墙体附加物
 */
@property(nonatomic,weak)  ZWWSubUIContainer * selectedWSubUIContainner;

@property (nonatomic ,strong) ZEEditArrow * editArrow;
@property (nonatomic ,strong) ZERoomInfo * roomInfo;
@property (nonatomic,weak)   ZEMarkView* mark;
@property (nonatomic,weak)   ZEMarkView* firstMark ;
@property (nonatomic,weak)   ZEMarkView* secondMark ;;
@property (nonatomic ,strong) NSMutableArray * markArray;
@end


@implementation ZEHomeDesigeViewController
{
    
    CGPoint _initialPoint;//拖拽的起始坐标
    CGFloat _lastScale;//缩放比例
    NSUInteger _index; // 记录toolTableview中哪行被选中了
    NSUInteger _visibleCellCount;
    CGFloat _currentArrBtnY;// 记录箭头的位置
    CGSize _lastSelectedDoorSize; // 记录最开始选中的门尺寸
    NSArray * _latestPoints; // 记录墙的最新的位置
    CGFloat _thickness; // 记录墙在界面显示的数值

    ZWWallLayer * _belongedWall;//记录控件属于那面墙
    CGPoint _lastMovingPoint;// 记录上一次移动的点
    
    CGRect _subUIFrame; // 记录门的在第一次拖动到墙上的尺寸
    CGPoint _roomOrigin; // 记录墙体改变后，房间的起点
    CGFloat _roomWidth;//记录墙体改变后，房间的宽度
    CGFloat _roomLength;// 记录墙体改变后，房间的长度
    
    // 分别记录箭头创建时的起始位置
    CGPoint _orginArrowLeftCenter;
    CGPoint _orginArrowRightCenter;
    CGPoint _orginArrowUpCenter;
    CGPoint _orginArrowDownCenter;
    CGFloat _lazerValue;// 记录测距仪的值
    BOOL _isWusuUITestDis; //记录是否是wubUI在测距
    BOOL _isWallTestDis;//记录是否是墙在测距
    BOOL _isUpload;// 记录是否上传了数据
}


#pragma mark - 懒加载


- (NSMutableArray *)markArray
{
    if (_markArray == nil) {
        _markArray = [NSMutableArray array];
    }
    return _markArray;
}
- (ZEToolTbaleHeaderView *)toolheaderView
{
    if (_toolheaderView == nil) {
        _toolheaderView = [[ZEToolTbaleHeaderView alloc]init];
    }
    return _toolheaderView;
}

- (ZEDoorHeader *)doorHeader
{
    if (_doorHeader == nil) {
        _doorHeader = [[ZEDoorHeader alloc]init];
        _doorHeader.delegate = self;
    }
    return _doorHeader;
}

- (ZEToolTabeleView *)toolTableView
{
  
    if (_toolTableView == nil) {
        _toolTableView = [[ZEToolTabeleView alloc]init];
        _toolTableView.toolDelegate = self;
    }
    return _toolTableView;
}

- (ZEFurnitureView *)furnitureView
{
    if (_furnitureView == nil) {
        _furnitureView = [[ZEFurnitureView alloc]init];
        _furnitureView.delegate = self;
    }
    return _furnitureView;
}

- (NSMutableArray *)wallEditOptions
{
    
    __weak  typeof(self) weakSelf = self;
    
    if (_wallEditOptions == nil) {
        
        _wallEditOptions = [NSMutableArray array];
        ZEWallEditOption * option1 = [[ZEWallEditOption alloc]initWithIconName:@"icon_ depth" function:^{
            NSLog(@"默认尺寸");
            [weakSelf defaultWallSize];
            [self.toolTableView reloadData];
        } title:@"默认尺寸"];
        
        ZEWallEditOption * option2 = [[ZEWallEditOption alloc]initWithIconName:@"icon_camera" function:^{
            NSLog(@"拍照批注");
            [weakSelf openCamera];
        } title:@"拍照批注"];
 
        ZEWallEditOption * option4 = [[ZEWallEditOption alloc]initWithIconName:@"icon_draw" function:^{
            NSLog(@"编辑墙壁");
            [weakSelf clearAllFlag];
            _isWallTestDis = YES;
            [weakSelf showEditWallAlter];
        } title:@"编辑墙壁"];
        [_wallEditOptions addObjectsFromArray: @[option1,option2,option4]];
    }
    
   
   
    return _wallEditOptions;
}

- (NSMutableArray *)doorEditOptions
{
    
    __weak  typeof(self) weakSelf = self;
    
    if (_doorEditOptions == nil) {
        
        _doorEditOptions = [NSMutableArray array];

        ZEDoorEditOption * optoion = [[ZEDoorEditOption alloc]initWithIconName:@"icon_draw" function:^{
            NSLog(@"便捷尺寸");
            if (weakSelf.selectedWSubUIContainner == nil) {
                [SVProgressHUD showErrorWithStatus:@"请选择一扇门或者一扇窗"];
                return;
            }
            [weakSelf editSeletedWSbUI:weakSelf.selectedWSubUIContainner];
            
        } title:@"编辑尺寸"];
        
        
        ZEDoorEditOption * optoion1 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_bluetooth" function:^{
            NSLog(@"设备测距");
            [weakSelf clearAllFlag];
            _isWusuUITestDis = YES;

            [weakSelf setupLazer];
        } title:@"设备测距"];
        
        ZEDoorEditOption * optoion2 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_left_right" function:^{
            NSLog(@"左右对调");
            
            [self.selectedWSubUIContainner leftAndRightExchange];
        } title:@"左右对调"];
        
        ZEDoorEditOption * optoion3 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_inside_outside" function:^{
            NSLog(@"里外对调");
            [self.selectedWSubUIContainner outAndInnerExchange];
            
        } title:@"里外对调"];
        
        ZEDoorEditOption * optoion4 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_camera" function:^{
            NSLog(@"拍照批注");
            [weakSelf openCamera];
        } title:@"拍照批注"];
        
        
        ZEDoorEditOption * optoion5 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_deletel" function:^{
            NSLog(@"删除");
            [weakSelf deletSpecifyZEWsubUI:self.selectedWSubUIContainner];
        } title:@"删除"];
        
        [_doorEditOptions addObjectsFromArray:@[optoion,optoion1,optoion2,optoion3,optoion4,optoion5]];
    }
    return _doorEditOptions;
}

- (NSMutableArray*)roomEditOptions
{
     __weak  typeof(self) weakSelf = self;
    
    if (_roomEditOptions == nil) {
        _roomEditOptions = [NSMutableArray  array];
        ZEDoorEditOption * option2 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_height" function:^{
            NSLog(@"天花板高度");
            [weakSelf ceilingHeight];
        }  title:@"天花板高度"];
        ZEDoorEditOption * option3 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_rename" function:^{
            NSLog(@"重新命名");
            [weakSelf renameRoom];
        }  title:@"重新命名"];
        ZEDoorEditOption * option4 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_camera" function:^{
            
            NSLog(@"拍照批注");
            [weakSelf openCamera];
        }  title:@"拍照批注"];
        ZEDoorEditOption * option5 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_deletel" function:^{
            NSLog(@"删除");
            [weakSelf deleteRoom];
        }  title:@"删除"];
        
        [_roomEditOptions addObjectsFromArray:@[option2,option3,option4]];
    }
    return _roomEditOptions;
}

- (NSMutableArray *)appendingObjects
{
    
    __weak  typeof(self) weakSelf = self;
    
    if (_appendingObjects == nil) {
        _appendingObjects = [NSMutableArray array];
        ZEDoorEditOption * optoion0 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_draw" function:^{
            NSLog(@"编辑尺寸");
            
        } title:@"编辑尺寸"];
        
        ZEDoorEditOption * optoion1 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_bluetooth" function:^{
            NSLog(@"蓝牙测距");
        } title:@"蓝牙测距"];
        
        ZEDoorEditOption * optoion2 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_ depth" function:^{
            NSLog(@"默认尺寸");
        } title:@"默认尺寸"];
        
        ZEDoorEditOption * optoion3 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_camera" function:^{
            NSLog(@"拍照批注");
            [weakSelf openCamera];
        } title:@"拍照批注"];
        
        [_appendingObjects addObjectsFromArray:@[optoion0,optoion1,optoion2,optoion3]];
    }
    return _appendingObjects;
}

- (UIPanGestureRecognizer *)toolTableViewPan
{
    if (_toolTableViewPan == nil) {
        _toolTableViewPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(toolTableViewPanAction:)];
    }
    return _toolTableViewPan;
}

- (UITapGestureRecognizer *)tap
{
    if(_tap == nil)
    {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureInSelfContentView:)];
        _tap.delegate = self;
    }
    return _tap;
}

- (ZEWSubUI *)movingWSubUI
{
    if (_movingWSubUI == nil) {
        _movingWSubUI = [ZEWSubUI new];
        [_movingWSubUI setImage:[UIImage imageNamed:@"image-door"] forState:UIControlStateNormal];
        [_movingWSubUI sizeToFit];
    }
    return _movingWSubUI;
}


- (NSMutableArray *)periphals
{
    if (_periphals == nil) {
        _periphals = [NSMutableArray array];
    }
    return _periphals;
}

- (NSMutableArray *)lengthes
{
    
    if (_lengthes == nil) {
        _lengthes = [NSMutableArray array];
    }
    return _lengthes;
}
- (NSMutableArray *)wusbUIArray
{
    if (_wusbUIArray == nil) {
        _wusbUIArray = [NSMutableArray array];
     }
    return _wusbUIArray;
}

- (NSMutableArray *)wallInfoArray
{
    if (_wallInfoArray == nil) {
        _wallInfoArray = [NSMutableArray array];
    }
    return _wallInfoArray;
}

- (NSMutableArray *)wsubInfoArray
{
    if (_wsubInfoArray == nil) {
        _wsubInfoArray =  [NSMutableArray array];
    }
    return _wsubInfoArray;
}


- (ZEOrderInfo *)orderInfo {
    if (!_orderInfo) {
        _orderInfo = [[ZEOrderInfo alloc]init];
    }
    return _orderInfo;
}

- (ZECoverButton *)roomCover
{
    if (_roomCover == nil) {
        _roomCover = [[ZECoverButton alloc]init];
        [_roomCover setImage:[UIImage imageNamed:@"icon_X"] forState:UIControlStateSelected];
        [_roomCover setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_roomCover addTarget:self action:@selector(editSpecifyRoom:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _roomCover;
}

 - (ZEWSubInfo *)wsubInfo
{
    if (_wsubInfo == nil) {
        _wsubInfo = [[ZEWSubInfo alloc]init];
    }
    return _wsubInfo;
}

- (ZEEditArrow *)editArrow
{
    if (_editArrow == nil) {
        _editArrow = [[ZEEditArrow alloc]init];
        _editArrow.delegate = self;
    }
    return _editArrow;
}

- (ZERoomInfo *)roomInfo
{
    if (_roomInfo == nil) {
        _roomInfo = [[ZERoomInfo alloc]init];
        
    }
    return _roomInfo;
}
#pragma - mark 网络方法测试
/**
 *  加载网络存储的画图信息
 */
- (void)loadingProjectInfo {
    
    __weak typeof(self) weakSelf = self;
    if (self.mission.ProjectID.isNoEmpty) {
        [[ApplicationManage shareManage] GetJsonDataWith:self.mission.ProjectID Block:^(THNetWorkError *error, ZEOrderInfo *orderINfo) {
            if (error) {
                NSLog(@"%@",error.errorDescription);
                return ;
            }
            ZERoomInfo * roomInfo = orderINfo.ORoomList[0];
            for (ZEWallInfo * wallInfo  in roomInfo.RWallList) {
                NSLog(@"walllInfo ------ %@",wallInfo.WallNo);
            }
            weakSelf.orderInfo = orderINfo;
           // [weakSelf drawWallFromOrderInfo];
            NSLog(@"loadingProjectInfo----%@",weakSelf.orderInfo.ProjectID);
        }];
    }
    
}
/**
 *  保存本地画图信息至网络
 */
- (void)saveProject{
    
    __weak typeof(self) weakSelf = self;
    
    [self updateOrderInfo];
    self.orderInfo.OrderID = self.mission.OrderID;
    self.orderInfo.ProjectID = self.mission.ProjectID;
   
    [[ApplicationManage shareManage] SaveProjectInfoWith:self.orderInfo Block:^(THNetWorkError *error, NSNumber *projectID) {
        if (error) {
            NSLog(@"%@",error.errorDescription);

            return ;
        }
        weakSelf.mission.ProjectID = projectID;
        [weakSelf saveProjectImage:projectID];
    }];
}
/**
 *  上传缩略图
 *
 *  @param projectID 工程ID
 */
- (void)saveProjectImage:(NSNumber *)projectID {
    ZEImageInfo *info = [[ZEImageInfo alloc]init];
    info.ID = self.mission.ID;
    info.ProjectID = projectID;
    info.RoomNo = @"0";
    info.TypeID = @1;
    UIGraphicsBeginImageContext(self.view.bounds.size);
    if ([self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:NO]){
        NSLog(@"Successfully draw the screenshot."); }
    else{
        NSLog(@"Failed to draw the screenshot.");
    }
    UIImage *iamgeScreen= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   // UIImageWriteToSavedPhotosAlbum(iamgeScreen, self, nil, nil);
    NSData *data;
    if (UIImagePNGRepresentation(iamgeScreen) == nil) {
        data = UIImageJPEGRepresentation(iamgeScreen, 1);
    } else {
        data = UIImagePNGRepresentation(iamgeScreen);
    }
    upLoadFile *loadFile = [[upLoadFile alloc] init];
    loadFile.name = @"saveImage";
    loadFile.fileName = @"asd.png";
    loadFile.type = @"png";
    loadFile.fileData = data;
    [[ApplicationManage shareManage] SaveProjectImageWiith:info file:loadFile Block:^(THNetWorkError *error, NSNumber *ID) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else{
            self.mission.ID = ID;
        }
    }];
}

-  (void)updateOrderInfo
{
    NSArray * us = self.wusbUIArray;
    NSInteger wallWindowCount = 0;
    NSInteger wallDoorCount = 0;
    NSInteger roomWindowCount = 0;
    NSInteger roomDoorCount = 0;
    // 房间信息模型
    self.roomInfo.RoomTitle = self.roomCover.titleLabel.text;
    if (self.wallInfoArray.count > 0) {
        [self.wallInfoArray removeAllObjects];
    }
    // 遍历墙体数组，取出数据模型
    for (ZWWallLayer * wallLayer in self.wallLayers)
    {
        // 清空之前的数据模型，下面进行新的数据赋值
        [wallLayer.wall.WSubList removeAllObjects];
        
        // 遍历墙体附加物的控件数组
      for (NSInteger i = 0 ; i <self.wusbUIArray.count;i++)
            {
                ZWWSubUIContainer * wsbUI = self.wusbUIArray[i];

                if ([wsbUI.wsubInfo.WSWallNo isEqualToString:wallLayer.wall.WallNo])
                {
                    // 将墙体控件转换为世界坐标系
                    [wsbUI convertWsubUIPositionToWorldCoordinate];
                    
                    [wallLayer.wall.WSubList addObject:wsbUI.wsubInfo];
                    // 判断是门或者窗
                    if (wsbUI.wsubInfo.WSGroup.integerValue == ZEFurnitureGroupTypeDoor)
                    {
                        wallDoorCount += 1;
                        roomDoorCount += 1;
                    }
                    if(wsbUI.wsubInfo.WSGroup.integerValue == ZEFurnitureGroupTypeWindow)
                    {
                        wallWindowCount += 1;
                        roomWindowCount += 1;
                    }
                }
                else
                {
                   continue ;
                }
            }
        
   
        wallLayer.wall.WWindowsCount = @(wallWindowCount);
        wallLayer.wall.WDoorCount = @(wallDoorCount);
        
        //转换坐标（和PC端对接的坐标）
        [wallLayer convertWallPositionWithReferPoint:[self currentScreenCenter]];
        [self.wallInfoArray addObject:wallLayer.wall];
        
       
        wallWindowCount = 0;
        wallDoorCount = 0;
    }
 
    
    // 保存房间列表数据
    self.roomInfo.RWallList = self.wallInfoArray;
    for (ZEWallInfo * wallInfo in self.wallInfoArray) {
        NSLog(@"墙的编号%@---墙的门窗个数%ld",wallInfo.WallNo,wallInfo.WSubList.count);
    }
    self.roomInfo.RoomTitle = self.roomCover.titleLabel.text;
    self.roomInfo.RArea =TwoBitNumber(self.roomCover.subText.floatValue);
    self.roomInfo.RWindowsCount =@(roomWindowCount) ;
    self.roomInfo.RDoorCount =@(roomDoorCount);
    self.orderInfo.ORoomList = @[ self.roomInfo];
    roomWindowCount = 0;
    roomDoorCount = 0;
    NSDictionary * dict = [self.roomInfo mj_keyValues];
    NSLog(@"JSON:%@",dict);
}

#pragma - mark 系统方法

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initUI];
    [self listenNotification];
    [self loadingProjectInfo];
    [self setupLazer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight;//根据需要
}

- (BOOL)shouldAutorotate
{
    return YES;//根据需要
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:nil];
}

#pragma mark - 点击按钮

- (IBAction)back:(id)sender {
    
    if (_isUpload == NO) {
        __weak typeof(self) weakSelf = self;
        
        UIAlertController * alterVC = [UIAlertController alertControllerWithTitle:nil message:@"数据还没保存，是否退出??" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            weakSelf.navigationController.navigationBar.hidden = NO;
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        [alterVC addAction:action1];
        [alterVC addAction:action2];
        [self presentViewController:alterVC animated:YES completion:nil];

    }else{
        
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }
    
   }
- (IBAction)drawWall:(ZEButton *)sender {
#warning 暂时设置只能点击一次
    sender.enabled = NO;
    [self drwaWall];
}

- (IBAction)drawDoor:(ZEButton*)sender {
 
    self.selectBtn.selected = NO;
    sender.selected = YES;
    self.selectBtn = sender;
    
   [self dragDoor];
  
}

- (IBAction)drawWindow:(ZEButton*)sender {
    
    [SVProgressHUD showInfoWithStatus:@"正在开发中哦!!!"];
//    self.selectBtn.selected = NO;
//    sender.selected = YES;
//    [self dragWindow];
}

- (IBAction)imageBtnClick:(ZEButton*)sender {
    self.selectBtn.selected = NO;
    sender.selected = YES;
    self.selectBtn = sender;
    ZEHomeDPhotosViewController * photosVC = [[ ZEHomeDPhotosViewController alloc]init];
    photosVC.mission = self.mission;
    [self.navigationController pushViewController:photosVC animated:YES];
    
}

- (IBAction)uploadBtnClick:(id)sender {
  //  [self editAppendingObject];
    _isUpload = YES;
    [self saveProject];
}

- (IBAction)aboutBtnClick:(id)sender {
   
}

- (IBAction)upBtnClick:(UIButton*)sender {
 
    UIButton * downBtn = [UIButton new];
    CGRect frame = [sender.superview convertRect:sender.frame toView:self.view];
    downBtn.frame = CGRectMake(frame.origin.x, 0, sender.width, sender.height);
    [downBtn addTarget:self action:@selector(downBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [downBtn setImage:[UIImage imageNamed:@"button_down"] forState:UIControlStateNormal];
    [self.view addSubview:downBtn];
    
    [UIView animateWithDuration:0.25 animations:^{
       
   
        downBtn.transform = CGAffineTransformTranslate(downBtn.transform , 0, frame.origin.y);
        self.toolBar.transform = CGAffineTransformTranslate(self.toolBar.transform, 0, -self.toolBar.height);
        self.lazerBtn.transform = CGAffineTransformTranslate(self.lazerBtn.transform,self.view.width - self.lazerBtn.frame.origin.x - self.lazerBtn.width, 0);
    }];

}

- (void)downBtnClick:(UIButton*)downBtn
{
    [UIView animateWithDuration:0.5 animations:^{
        [downBtn removeFromSuperview];
        self.toolBar.transform = CGAffineTransformIdentity;
        self.lazerBtn.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)rightBtnClick:(id)sender {
    [self updateOrderInfo];
    _detaileTab = [[ZEDetaileTabView alloc]init];
    [_detaileTab show];
    [_detaileTab setDataSourceWithOrderInfo:self.orderInfo mission:self.mission];
}

- (IBAction)lazerBtnClick:(id)sender {
    [self setupLazer];
}


#pragma mark - 私有方法
- (void)initUI
{

    self.titleLabel.text = self.mission.CustomerName;

    [self setupDrawBoard];
}

- (void)listenNotification
{
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(wsbUIDidClick:) name:@"wsbUIClick" object:nil];
    [center addObserver:self selector:@selector(wsubUIDidMove) name:@"subUIIsMoving" object:nil];
   
}
/**
 *  画板有主要的三层视图
 第一层是self的视图主要添加手势,协同contentview的手势操作
 第二层是contentview的父视图用于缩放,使contentView中的视图一起缩放
 第三层是contentView用于摆放控件,并且手势移动
 */
- (void) setupDrawBoard {
    //contentView的父视图
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.drawboardView addSubview:backView];
    backView.backgroundColor = [UIColor yellowColor];
    //控件内容视图
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _contentView.size = CGSizeMake(SCREEN_WIDTH *5, SCREEN_HEIGHT *5);
    _contentView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    [backView addSubview:_contentView];
    NSLog(@"%@",NSStringFromCGRect(_contentView.frame));
    _contentView.backgroundColor = hexColorString(@"f2f2f2");
    // backView.layer.masksToBounds = YES;
    self.view.backgroundColor = [UIColor blueColor];
    _lastScale = 1;
    
    //因为缩放后backView变小不能接受手势,所以添加两个相同的手势
    UIPanGestureRecognizer * recognizer;//内视图的手势
    UIPinchGestureRecognizer *pinchRecognizer;
    
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [_contentView addGestureRecognizer:recognizer];
    pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchFrameChange:)];
    [_contentView addGestureRecognizer:pinchRecognizer];
    self.pan = recognizer;
    
    UIPanGestureRecognizer * recognizer2;//外视图的手势
    UIPinchGestureRecognizer *pinchRecognizer2;
    
    recognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [self.view addGestureRecognizer:recognizer2];
    pinchRecognizer2 = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchFrameChange:)];
    [self.view addGestureRecognizer:pinchRecognizer2];
    self.pan = recognizer2;
}

/**
 *  手势滑动方法 开始状态:记录手势滑动的起始点
 *
 *  @param sender 滑动
 */
- (void)handleSwipeFrom:(UIPanGestureRecognizer *)sender {
    CGPoint recoginPoint = [sender translationInView:_contentView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        _initialPoint = _contentView.frame.origin;
    }
    [self checkUIPanGestureRecognizerPoint:recoginPoint];
}
/**
 *  缩放方法
 *
 *  @param sender 缩放
 */
- (void)pinchFrameChange:(UIPinchGestureRecognizer *)sender {
    
    // self.center = self.superview.center;
    sender.scale=sender.scale-_lastScale+1;
    //NSLog(@"a:%f scale:%f",self.transform.a,sender.scale);
    if (_contentView.superview.transform.a > 2 && sender.scale > 1) {
        return;
    }
    if (_contentView.superview.transform.a  < 0.5 && sender.scale < 1) {
        return;
    }
    _contentView.superview.transform = CGAffineTransformScale(_contentView.superview.transform, sender.scale,sender.scale);
    _lastScale=sender.scale;
    
}
/**
 *  画板移动范围限制
 *
 *  @param point 手势滑动距离
 *
 */
- (void) checkUIPanGestureRecognizerPoint:(CGPoint)point {
    _contentView.left = _initialPoint.x + point.x;
    _contentView.top = _initialPoint.y + point.y;
    
    if (_contentView.left > -SCREEN_WIDTH) {
        _contentView.left = -SCREEN_WIDTH;
    }
    if (_contentView.left < -SCREEN_WIDTH*3) {
        _contentView.left = -SCREEN_WIDTH*3;
    }
    if (_contentView.top > -SCREEN_HEIGHT) {
        _contentView.top = -SCREEN_HEIGHT;
    }
    if (_contentView.top < -SCREEN_HEIGHT*3) {
        _contentView.top = -SCREEN_HEIGHT*3;
    }
    NSLog(@"%@",NSStringFromCGRect(_contentView.frame));
}


- (void)appendView:(UIView *)view {
    CGPoint screenCenter = CGPointMake(SCREEN_WIDTH/2 - _contentView.left , SCREEN_HEIGHT/2 - _contentView.top);
    view.center = screenCenter;
    [_contentView addSubview:view];
}
/**
 *  屏幕的中心点坐标
 *
 *  @return 中心
 */
- (CGPoint)currentScreenCenter {
    CGPoint screenCenter = CGPointMake(SCREEN_WIDTH/2 - _contentView.left , SCREEN_HEIGHT/2 - _contentView.top);
    return screenCenter;
}



- (void)deletSpecifyZEWsubUI:(ZWWSubUIContainer*)door
{
    [door removeFromSuperview];
    [self deleteMarkView];
    [self.wsubInfoArray removeObject:door.wsubInfo];
    for (ZEWSubInfo * wsubInfo in door.belongedWall.wall.WSubList) {
        if ([wsubInfo.WSNo isEqualToString: door.wsubInfo.WSNo]) {
            [door.belongedWall.wall.WSubList removeObject:wsubInfo];
            break;
        }
    }
}

- (void)changeSelectedWallLength:(CGFloat)distance
{
    
// 判断是水平还是垂直
   if(self.selectedWallLayer.wall.WallNo.integerValue %2 == 0) // 水平
   {
       [self changeHorisonWallLength:distance];
       
   }else // 垂直
   {
       [self changeVerticalWallLength:distance];
   }
}

- (void)changeHorisonWallLength:(CGFloat)distance
{
   ZWWallLayer * wall0Layer = [self wallLayerWithWallNum:0];
    CGFloat b = wall0Layer.range.size.width;
    
    [self changeWall0LayerLength:distance];
    [self changeWall2LayerLength:distance];
    ZWWallLayer * wall00Layer = [self wallLayerWithWallNum:0];

    CGFloat c = wall00Layer.range.size.width;
    CGFloat a = b - c;
    [self changeWall1LayerPosition:a];
    [self displayRoomInfo];
}

- (void)changeVerticalWallLength:(CGFloat)distance
{
    ZWWallLayer * wall1Layer = [self wallLayerWithWallNum:1];
    CGFloat b = wall1Layer.range.size.height;

    [self changeWall1LayerLength:distance];
    [self changeWall3LayerLength:distance];
     ZWWallLayer * wall11Layer = [self wallLayerWithWallNum:1];
    CGFloat c = wall11Layer.range.size.height;
    CGFloat a = b - c;
    [self changeWall2LayerPosition:a];
    [self displayRoomInfo];
}
/**  改变第一面墙的长度 */
- (void)changeWall0LayerLength:(CGFloat)distance
{
    // 1m ----> 100pix;
    distance = distance * 100;
    
    ZWWallLayer * wallLayer0 = [self wallLayerWithWallNum:0];
    CGPoint wall0Point0 = [wallLayer0.points[0] CGPointValue];
    CGPoint wall0Point1 = [wallLayer0.points[1] CGPointValue];
    CGPoint wall0Point2 = [wallLayer0.points[2] CGPointValue];
    CGPoint wall0Point3 = [wallLayer0.points[3]CGPointValue];
    CGPoint wall0ArrowPoint0 = [wallLayer0.points[4] CGPointValue];
    CGPoint wall0ArrowPoint1 = [wallLayer0.points[5] CGPointValue];
    wall0Point1.x = wall0ArrowPoint0.x + distance;
    wall0Point2.x = wall0Point0.x + distance + (wall0Point0.x - wall0Point3.x) ;
    wall0ArrowPoint1.x = wall0ArrowPoint0.x + distance;
    
    UIBezierPath * newPath = [wallLayer0 pathWithPoints:@[pointValue(wall0Point0),pointValue(wall0Point1),pointValue(wall0Point2),pointValue(wall0Point3),pointValue(wall0ArrowPoint0),pointValue(wall0ArrowPoint1)]];
    
    
    wallLayer0.points = @[pointValue(wall0Point0),pointValue(wall0Point1),pointValue(wall0Point2),pointValue(wall0Point3),pointValue(wall0ArrowPoint0),pointValue(wall0ArrowPoint1)];
    
    wallLayer0.path = newPath.CGPath;
    wallLayer0.range = CGRectMake(wall0Point3.x, wall0Point3.y, wall0Point1.x - wall0Point0.x, wall0Point0.y - wall0Point3.y);
    wallLayer0.text = [NSString stringWithFormat:@"%.2fm",wallLayer0.range.size.width /100*1.00];
    wallLayer0.wall.WThick = TwoBitNumber( wall0Point0.y - wall0Point3.y);
    
}


/**  改变第二面墙的长度 */
- (void)changeWall1LayerLength:(CGFloat)distance
{
    
    // 1m ----> 100pix;
    distance = distance * 100;
    
    ZWWallLayer * wallLayer1 = [self wallLayerWithWallNum:1];
    CGPoint wall1Point0 = [wallLayer1.points[0] CGPointValue];
    CGPoint wall1Point1 = [wallLayer1.points[1] CGPointValue];
    CGPoint wall1Point2 = [wallLayer1.points[2] CGPointValue];
    CGPoint wall1Point3 = [wallLayer1.points[3]CGPointValue];
    CGPoint wall1ArrowPoint0 = [wallLayer1.points[4] CGPointValue];
    CGPoint wall1ArrowPoint1 = [wallLayer1.points[5] CGPointValue];
    wall1Point1.y = wall1Point0.y + distance;
    wall1Point2.y = wall1Point0.y + distance + (wall1Point0.y - wall1Point3.y);
    wall1ArrowPoint1.y = wall1ArrowPoint0.y + distance;
    
    UIBezierPath * newPath = [wallLayer1 pathWithPoints:@[pointValue(wall1Point0),pointValue(wall1Point1),pointValue(wall1Point2),pointValue(wall1Point3),pointValue(wall1ArrowPoint0),pointValue(wall1ArrowPoint1)]];
    wallLayer1.points = @[pointValue(wall1Point0),pointValue(wall1Point1),pointValue(wall1Point2),pointValue(wall1Point3),pointValue(wall1ArrowPoint0),pointValue(wall1ArrowPoint1)];
    
    wallLayer1.path = newPath.CGPath;
    wallLayer1.range = CGRectMake(wall1Point0.x, wall1Point0.y, wall1Point3.x - wall1Point0.x, wall1Point1.y - wall1Point0.y);
    wallLayer1.text = [NSString stringWithFormat:@"%.2fm",wallLayer1.range.size.height /100*1.00];
    wallLayer1.wall.WThick = TwoBitNumber( wall1Point3.x - wall1Point0.x);
    
}


/**  改变第三面墙的长度 */
- (void)changeWall2LayerLength:(CGFloat)distance
{
    // 1.1m ----> 100pix;
    distance = distance * 100;
    
    ZWWallLayer * wallLayer2 = [self wallLayerWithWallNum:2];
    CGPoint wall2Point0 = [wallLayer2.points[0] CGPointValue];
    CGPoint wall2Point1 = [wallLayer2.points[1] CGPointValue];
    CGPoint wall2Point2 = [wallLayer2.points[2] CGPointValue];
    CGPoint wall2Point3 = [wallLayer2.points[3]CGPointValue];
    CGPoint wall2ArrowPoint0 = [wallLayer2.points[4] CGPointValue];
    CGPoint wall2ArrowPoint1 = [wallLayer2.points[5] CGPointValue];
    wall2Point0.x = wall2ArrowPoint1.x + distance;
    wall2Point3.x = wall2Point1.x + distance + (wall2Point1.x - wall2Point2.x) ;
    wall2ArrowPoint0.x = wall2ArrowPoint1.x + distance;
    
    UIBezierPath * newPath = [wallLayer2 pathWithPoints:@[pointValue(wall2Point0),pointValue(wall2Point1),pointValue(wall2Point2),pointValue(wall2Point3),pointValue(wall2ArrowPoint0),pointValue(wall2ArrowPoint1)]];
    wallLayer2.points = @[pointValue(wall2Point0),pointValue(wall2Point1),pointValue(wall2Point2),pointValue(wall2Point3),pointValue(wall2ArrowPoint0),pointValue(wall2ArrowPoint1)];
    
    wallLayer2.path = newPath.CGPath;
    wallLayer2.range = CGRectMake(wall2Point1.x, wall2Point1.y, wall2Point0.x - wall2Point1.x, wall2Point3.y - wall2Point0.y);
    wallLayer2.text = [NSString stringWithFormat:@"%.2fm",wallLayer2.range.size.width /100*1.00];
    wallLayer2.wall.WThick = TwoBitNumber( wall2Point0.y - wall2Point3.y);
    
}


/**  改变第四面墙的长度 */
- (void)changeWall3LayerLength:(CGFloat)distance
{
    //1m ----> 100pix;
    distance = distance * 100;
    
    ZWWallLayer * wallLayer3 = [self wallLayerWithWallNum:3];
    CGPoint wall3Point0 = [wallLayer3.points[0] CGPointValue];
    CGPoint wall3Point1 = [wallLayer3.points[1] CGPointValue];
    CGPoint wall3Point2 = [wallLayer3.points[2] CGPointValue];
    CGPoint wall3Point3 = [wallLayer3.points[3]CGPointValue];
    CGPoint wall3ArrowPoint0 = [wallLayer3.points[4] CGPointValue];
    CGPoint wall3ArrowPoint1 = [wallLayer3.points[5] CGPointValue];
    wall3Point0.y = wall3Point1.y + distance;
    wall3Point3.y = wall3Point1.y + distance + (wall3Point1.y - wall3Point2.y);
    wall3ArrowPoint0.y = wall3ArrowPoint1.y + distance;
    
    UIBezierPath * newPath = [wallLayer3 pathWithPoints:@[pointValue(wall3Point0),pointValue(wall3Point1),pointValue(wall3Point2),pointValue(wall3Point3),pointValue(wall3ArrowPoint0),pointValue(wall3ArrowPoint1)]];
    
    wallLayer3.points = @[pointValue(wall3Point0),pointValue(wall3Point1),pointValue(wall3Point2),pointValue(wall3Point3),pointValue(wall3ArrowPoint0),pointValue(wall3ArrowPoint1)];
    
    wallLayer3.path = newPath.CGPath;
    wallLayer3.range = CGRectMake(wall3Point2.x, wall3Point2.y, wall3Point0.x - wall3Point3.x, wall3Point0.y - wall3Point1.y);
    wallLayer3.text = [NSString stringWithFormat:@"%.2fm",wallLayer3.range.size.height /100*1.00];
    wallLayer3.wall.WThick = TwoBitNumber( wall3Point0.x - wall3Point3.x);
}

/**
 *  改变第二面墙的位置
 */
- (void)changeWall1LayerPosition:(CGFloat)distance
{
    
    ZWWallLayer * wallLayer1 = [self wallLayerWithWallNum:1];
    CGPoint wall1Point0 = [wallLayer1.points[0] CGPointValue];
    CGPoint wall1Point1 = [wallLayer1.points[1] CGPointValue];
    CGPoint wall1Point2 = [wallLayer1.points[2] CGPointValue];
    CGPoint wall1Point3 = [wallLayer1.points[3]CGPointValue];
    CGPoint wall1ArrowPoint0 = [wallLayer1.points[4] CGPointValue];
    CGPoint wall1ArrowPoint1 = [wallLayer1.points[5] CGPointValue];
    wall1Point0.x -= distance;
    
    wall1Point1.x -= distance;
    
    wall1Point2.x -= distance;
    
    wall1Point3.x -= distance;
    wall1ArrowPoint0.x -= distance;
    wall1ArrowPoint1.x -= distance;
    
    
    UIBezierPath * newPath = [wallLayer1 pathWithPoints:@[pointValue(wall1Point0),pointValue(wall1Point1),pointValue(wall1Point2),pointValue(wall1Point3),pointValue(wall1ArrowPoint0),pointValue(wall1ArrowPoint1)]];
    
      wallLayer1.points = @[pointValue(wall1Point0),pointValue(wall1Point1),pointValue(wall1Point2),pointValue(wall1Point3),pointValue(wall1ArrowPoint0),pointValue(wall1ArrowPoint1)];
    
    wallLayer1.path = newPath.CGPath;
    wallLayer1.range = CGRectMake(wall1Point0.x, wall1Point0.y, wall1Point3.x - wall1Point0.x, wall1Point1.y - wall1Point0.y);
    wallLayer1.text = [NSString stringWithFormat:@"%.2fm",wallLayer1.range.size.height /100*1.00];
    wallLayer1.wall.WThick = TwoBitNumber( wall1Point0.y - wall1Point3.y);

  
}


/**
 *  改变第三面墙的位置
 */
- (void)changeWall2LayerPosition:(CGFloat)distance
{
    ZWWallLayer * wallLayer2 = [self wallLayerWithWallNum:2];
    CGPoint wall2Point0 = [wallLayer2.points[0] CGPointValue];
    CGPoint wall2Point1 = [wallLayer2.points[1] CGPointValue];
    CGPoint wall2Point2 = [wallLayer2.points[2] CGPointValue];
    CGPoint wall2Point3 = [wallLayer2.points[3]CGPointValue];
    CGPoint wall2ArrowPoint0 = [wallLayer2.points[4] CGPointValue];
    CGPoint wall2ArrowPoint1 = [wallLayer2.points[5] CGPointValue];
    wall2Point0.y -= distance;
    
    wall2Point1.y -= distance;
    
    wall2Point2.y -= distance;
    
    wall2Point3.y -= distance;
    wall2ArrowPoint0.y -= distance;
    wall2ArrowPoint1.y -= distance;
    
    
    UIBezierPath * newPath = [wallLayer2 pathWithPoints:@[pointValue(wall2Point0),pointValue(wall2Point1),pointValue(wall2Point2),pointValue(wall2Point3),pointValue(wall2ArrowPoint0),pointValue(wall2ArrowPoint1)]];
    
    
    wallLayer2.points = @[pointValue(wall2Point0),pointValue(wall2Point1),pointValue(wall2Point2),pointValue(wall2Point3),pointValue(wall2ArrowPoint0),pointValue(wall2ArrowPoint1)];
    
    wallLayer2.path = newPath.CGPath;
    wallLayer2.range = CGRectMake(wall2Point1.x, wall2Point1.y, wall2Point0.x - wall2Point1.x, wall2Point3.y - wall2Point0.y);
    wallLayer2.text = [NSString stringWithFormat:@"%.2fm",wallLayer2.range.size.width /100*1.00];
    wallLayer2.wall.WThick = TwoBitNumber( wall2Point3.y - wall2Point0.y);
}
/**
 *  改变选中墙的厚度
 */
- (void)chageSelectedWallThickness:(CGFloat)thichness
{// 箭头的变化是哪个个点变了，就重新赋值
 
    CGRect range = self.selectedWallLayer.range;
    NSArray * points = self.selectedWallLayer.points;
    CGPoint point0 = [points[0] CGPointValue];
    CGPoint point1 = [points[1] CGPointValue];
    CGPoint point2 = [points[2] CGPointValue];
    CGPoint point3 = [points[3] CGPointValue];
    // 与标注箭头相关的点
    CGPoint arrowPoint0 = [points[4] CGPointValue];
    CGPoint arrowPoint1 = [points[5] CGPointValue];
    
    CGFloat WThick = 0;
    CGFloat lenght = 0;
    UIBezierPath  * newPath = [UIBezierPath bezierPath];
    
    // 找到选中的墙的邻居
    NSInteger preNo = self.selectedWallLayer.wall.WPreNo.integerValue;
    NSInteger nextNo = self.selectedWallLayer.wall.WNextNo.integerValue;
    ZWWallLayer * preWallLayer = self.wallLayers[preNo];
    ZWWallLayer * nextWallyer = self.wallLayers[nextNo];
    
    CGPoint preWallPoint0 = [preWallLayer.points[0] CGPointValue];
    CGPoint preWallPoint1 = [preWallLayer.points[1] CGPointValue];
    CGPoint preWallPoint2 = [preWallLayer.points[2] CGPointValue];
    CGPoint preWallPoint3 = [preWallLayer.points[3] CGPointValue];
    CGPoint preArrowPoint0 =[preWallLayer.points[4] CGPointValue];
    CGPoint preArrowPoint1 =[preWallLayer.points[5] CGPointValue];
    
    CGPoint nextWallPoint0 = [nextWallyer.points[0] CGPointValue];
    CGPoint nextWallPoint1 = [nextWallyer.points[1] CGPointValue];
    CGPoint nextWallPoint2 = [nextWallyer.points[2] CGPointValue];
    CGPoint nextWallPoint3 = [nextWallyer.points[3] CGPointValue];
    CGPoint nextArrowPoint0 =[nextWallyer.points[4] CGPointValue];
    CGPoint nextArrowPoint1 =[nextWallyer.points[5] CGPointValue];
    
    // 偏移量
    CGFloat delta = 0.2;
    
    if (range.size.width > range.size.height) { // 水平
        if (point0.y - point3.y > 0) { // 水平向上
            
            // 选中墙的形变
            point3.y = point3.y - thichness * delta;
            point2.y = point3.y;
            point0.y = point0.y + delta * thichness;
            point1.y = point0.y;
            WThick =  point1.y - point2.y;
            range = CGRectMake(point0.x, point3.y, point1.x - point0.x, WThick);
        
            
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x;
            arrowPoint0.y = point0.y + 20;
            arrowPoint1.x = point1.x;
            arrowPoint1.y = arrowPoint0.y;
            // 确定标注的位置
            self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x + 0.5 * range.size.width, arrowPoint0.y + self.selectedWallLayer.textLayer.width*0.5);
            preArrowPoint1 = CGPointMake(point0.x + 20, point0.y);
            preArrowPoint0 =  CGPointMake(preArrowPoint1.x, preArrowPoint0.y);
            nextArrowPoint0 = CGPointMake(point1.x -20, point1.y);
            nextArrowPoint1 = CGPointMake(nextArrowPoint0.x, nextArrowPoint1.y);
            
          }else  { // 水平向下
            
            point3.y = point3.y + thichness * delta;
            point2.y = point3.y;
            point0.y = point0.y - delta * thichness;
            point1.y = point0.y;
            
            WThick =  point3.y - point0.y;
            range = CGRectMake(point1.x, point1.y, point0.x - point1.x, WThick);
            
              // 确定水平向上的箭头的坐标
              arrowPoint0.x = point0.x;
              arrowPoint0.y = point0.y - 20;
              arrowPoint1.x = point1.x;
              arrowPoint1.y = arrowPoint0.y;
              // 显示标注
               self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x - 0.5 * range.size.width, arrowPoint0.y- 20);
              
              preArrowPoint1 = CGPointMake( point0.x -20, point0.y);
              preArrowPoint0 = CGPointMake(point0.x -20, preArrowPoint0.y);
              nextArrowPoint0 = CGPointMake(point1.x + 20, point1.y);
              nextArrowPoint1 = CGPointMake(nextArrowPoint0.x, nextArrowPoint1.y);
        }
        
        // 上一面墙的形变
        preWallPoint2 = point3;
        preWallPoint1 = point0;
        preWallPoint0.x = preWallPoint1.x;
        preWallPoint3.x = preWallPoint2.x;
       
        // 水平方向厚度改变，垂直方向的长度会改变
        lenght = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:preWallPoint0 secondPoint:preWallPoint1];
        
        // 下一面墙的形变
        nextWallPoint0 = point1;
        nextWallPoint3 = point2;
        nextWallPoint1.x = nextWallPoint0.x;
        nextWallPoint2.x = nextWallPoint3.x;
        
    }else {
        if (point0.x > point3.x ) { // 垂直向左
            
            point0.x = point0.x + delta * thichness;
            point3.x = point3.x - delta * thichness;
            point1.x = point0.x;
            point2.x = point3.x;
            
            WThick = point1.x - point2.x;
            range = CGRectMake(point2.x, point1.y, WThick, point0.y - point1.y);
            
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x + 20;
            arrowPoint0.y = point0.y;
            arrowPoint1.x = arrowPoint0.x;
            arrowPoint1.y = point1.y;
            // 显示标注
            self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x , arrowPoint0.y - 0.5 * range.size.height);
            preArrowPoint1 = CGPointMake(point0.x, point0.y -20);
            preWallPoint0 = CGPointMake(preWallPoint0.x, preArrowPoint1.y);
            nextArrowPoint0 = CGPointMake(point1.x, point1.y + 20);
            nextArrowPoint1 = CGPointMake(nextArrowPoint1.x, nextArrowPoint0.y);
        }else { //  垂直向右
            
            point0.x = point0.x - delta * thichness;
            point3.x = point3.x + delta * thichness;
            point1.x = point0.x;
            point2.x = point3.x;
            
            WThick = point3.x- point0.x;
            range = CGRectMake(point0.x, point0.y, WThick, point1.y - point0.y);
            
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x  - 20;
            arrowPoint0.y = point0.y;
            arrowPoint1.x = arrowPoint0.x;
            arrowPoint1.y = point1.y;
            // 显示标注
           self.selectedWallLayer.textLayer.position = CGPointMake( arrowPoint0.x - self.selectedWallLayer.textLayer.height  , arrowPoint0.y + 0.5 * range.size.height);;
           
            
            preArrowPoint1 = CGPointMake(point0.x,  point0.y+20);
            preArrowPoint0 = CGPointMake(preArrowPoint0.x, preArrowPoint1.y);
            nextArrowPoint0 = CGPointMake(point1.x, point1.y - 20);
            nextArrowPoint1 = CGPointMake(nextArrowPoint1.x, nextArrowPoint0.y);
        }
        
        // 上一面墙
        preWallPoint1 = point0;
        preWallPoint2 = point3;
        preWallPoint0.y = preWallPoint1.y;
        preWallPoint3.y = preWallPoint2.y;
        
        // 下一面墙
        nextWallPoint0 = point1;
        nextWallPoint3 = point2;
        nextWallPoint1.y = nextWallPoint0.y;
        nextWallPoint2.y = nextWallPoint3.y;
        
        // 垂直方向厚度改变，水平方向的长度会改变
        lenght = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:preWallPoint0 secondPoint:preWallPoint1];
    }
    

    
    newPath = [self.selectedWallLayer pathWithPoints:@[pointValue(point0),pointValue(point1),pointValue(point2),pointValue(point3),pointValue(arrowPoint0),pointValue(arrowPoint1)]];
    self.selectedWallLayer.path = newPath.CGPath;
    self.selectedWallLayer.range = range;
    self.selectedWallLayer.selectedWallPoints = @[pointValue(point0),pointValue(point1),pointValue(point2),pointValue(point3),pointValue(arrowPoint0),pointValue(arrowPoint1)];
    self.selectedWallLayer.text = self.selectedWallLayer.textLayer.string;
    self.selectedWallLayer.wall.WThick = TwoBitNumber( WThick);
    NSString * wThicknessStr  = [NSString stringWithFormat:@"%@", self.selectedWallLayer.wall.WThick];
    [ wThicknessStr writeToFile:wallThicknessInView atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    preWallLayer.path = [preWallLayer pathWithPoints:@[pointValue(preWallPoint0),pointValue(preWallPoint1),pointValue(preWallPoint2),pointValue(preWallPoint3),pointValue(preArrowPoint0),pointValue(preArrowPoint1)]].CGPath;
    // 更新数据
    preWallLayer.points = @[pointValue(preWallPoint0),pointValue(preWallPoint1),pointValue(preWallPoint2),pointValue(preWallPoint3),pointValue(preArrowPoint0),pointValue(preArrowPoint1)];
    preWallLayer.textLayer.string = [NSString stringWithFormat:@"%.02fm",lenght/100 *1.00];
    preWallLayer.text = preWallLayer.textLayer.string;
    
    nextWallyer.path = [nextWallyer pathWithPoints:@[pointValue(nextWallPoint0),pointValue(nextWallPoint1),pointValue(nextWallPoint2),pointValue( nextWallPoint3),pointValue(nextArrowPoint0),pointValue(nextArrowPoint1)]].CGPath;
    // 更新数据
    nextWallyer.points = @[pointValue(nextWallPoint0),pointValue(nextWallPoint1),pointValue(nextWallPoint2),pointValue( nextWallPoint3),pointValue(nextArrowPoint0),pointValue(nextArrowPoint1)];
    nextWallyer.textLayer.string = [NSString stringWithFormat:@"%.02fm",lenght/100 *1.00];
    nextWallyer.text = nextWallyer.textLayer.string;

    [self displayRoomInfo];
}

#warning 有很多冗余的代码
- (void)defaultWallSize
{
    CGRect range = self.selectedWallLayer.range;
    NSArray * points = self.selectedWallLayer.points;
    CGPoint point0 = [points[0] CGPointValue];
    CGPoint point1 = [points[1] CGPointValue];
    CGPoint point2 = [points[2] CGPointValue];
    CGPoint point3 = [points[3] CGPointValue];
    
    // 与标注箭头相关的点
    CGPoint arrowPoint0 = [points[4] CGPointValue];
    CGPoint arrowPoint1 = [points[5] CGPointValue];
    
    CGPoint originPoint0 = [self.selectedWallLayer.orignalPoints[0] CGPointValue];
    CGPoint originPoint1 = [self.selectedWallLayer.orignalPoints[1] CGPointValue];
    CGPoint originPoint2 = [self.selectedWallLayer.orignalPoints[2] CGPointValue];
    CGPoint originPoint3 = [self.selectedWallLayer.orignalPoints[3] CGPointValue];
    
    CGFloat WThick = 0;
    CGFloat length = 0;
    
    UIBezierPath  * newPath = [UIBezierPath bezierPath];
    
    // 找到选中的墙的邻居
    NSInteger preNo = self.selectedWallLayer.wall.WPreNo.integerValue;
    NSInteger nextNo = self.selectedWallLayer.wall.WNextNo.integerValue;
    ZWWallLayer * preWallLayer = self.wallLayers[preNo];
    ZWWallLayer * nextWallyer = self.wallLayers[nextNo];
    
    CGPoint preWallPoint0 = [preWallLayer.points[0] CGPointValue];
    CGPoint preWallPoint1 = [preWallLayer.points[1] CGPointValue];
    CGPoint preWallPoint2 = [preWallLayer.points[2] CGPointValue];
    CGPoint preWallPoint3 = [preWallLayer.points[3] CGPointValue];
    CGPoint preArrowPoint0 =[preWallLayer.points[4] CGPointValue];
    CGPoint preArrowPoint1 =[preWallLayer.points[5] CGPointValue];
    
    CGPoint nextWallPoint0 = [nextWallyer.points[0] CGPointValue];
    CGPoint nextWallPoint1 = [nextWallyer.points[1] CGPointValue];
    CGPoint nextWallPoint2 = [nextWallyer.points[2] CGPointValue];
    CGPoint nextWallPoint3 = [nextWallyer.points[3] CGPointValue];
    CGPoint nextArrowPoint0 =[nextWallyer.points[4] CGPointValue];
    CGPoint nextArrowPoint1 =[nextWallyer.points[5] CGPointValue];
    
    if (range.size.width > range.size.height) { // 水平
        if (point0.y - point3.y > 0) { // 水平向上
            
            // 选中墙的形变
            point0.x = preWallPoint1.x;
            point0.y = originPoint0.y;
            
            point3.x = preWallPoint2.x;
            point3.y = originPoint3.y;
            
            point1.x = nextWallPoint0.x;
            point1.y = originPoint1.y;
            
            point2.x = nextWallPoint3.x;
            point2.y  = originPoint2.y;
            
            WThick =  point1.y - point2.y;
            range = CGRectMake(point0.x, point3.y, point1.x - point0.x, WThick);
          
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x;
            arrowPoint0.y = point0.y + 20;
            arrowPoint1.x = point1.x;
            arrowPoint1.y = arrowPoint0.y;
            // 确定标注的位置
            self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x + 0.5 * range.size.width, arrowPoint0.y + self.selectedWallLayer.textLayer.width * 0.5);
            preArrowPoint1 = CGPointMake(point0.x + 20, point0.y);
            preArrowPoint0 =  CGPointMake(preArrowPoint1.x, preArrowPoint0.y);
            nextArrowPoint0 = CGPointMake(point1.x -20, point1.y);
            nextArrowPoint1 = CGPointMake(nextArrowPoint0.x, nextArrowPoint1.y);
            
        }else  { // 水平向下
            
            point0 = CGPointMake(preWallPoint0.x, originPoint0.y);
            point1 = CGPointMake(nextWallPoint0.x, originPoint1.y);
            point2 = CGPointMake(nextWallPoint3.x, originPoint2.y);
            point3 = CGPointMake(preWallPoint2.x, originPoint3.y);
            
            WThick =  point3.y - point0.y;
            range = CGRectMake(point1.x, point1.y, point0.x - point1.x, WThick);
          
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x;
            arrowPoint0.y = point0.y - 20;
            arrowPoint1.x = point1.x;
            arrowPoint1.y = arrowPoint0.y;
            // 显示标注
            self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x - 0.5 * range.size.width, arrowPoint0.y- 20);
            
            preArrowPoint1 = CGPointMake( point0.x -20, point0.y);
            preArrowPoint0 = CGPointMake(point0.x -20, preArrowPoint0.y);
            nextArrowPoint0 = CGPointMake(point1.x + 20, point1.y);
            nextArrowPoint1 = CGPointMake(nextArrowPoint0.x, nextArrowPoint1.y);
        }
        
        // 上一面墙的形变
        preWallPoint2 = point3;
        preWallPoint1 = point0;
        preWallPoint0.x = preWallPoint1.x;
        preWallPoint3.x = preWallPoint2.x;
        
        // 下一面墙的形变
        nextWallPoint0 = point1;
        nextWallPoint3 = point2;
        nextWallPoint1.x = nextWallPoint0.x;
        nextWallPoint2.x = nextWallPoint3.x;
        
        length = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:preWallPoint0 secondPoint:preWallPoint1];
        
    }else {
        if (point0.x > point3.x ) { // 垂直向左
            
            point0 = CGPointMake(originPoint0.x,preWallPoint0.y);
            point1 = CGPointMake(point0.x, nextWallPoint1.y);
            point2 = CGPointMake(originPoint2.x, nextWallPoint3.y);
            point3 = CGPointMake(point2.x, preWallPoint2.y);
            
            WThick = point1.x - point2.x;
            range = CGRectMake(point2.x, point1.y, WThick, point0.y - point1.y);

            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x + 20;
            arrowPoint0.y = point0.y;
            arrowPoint1.x = arrowPoint0.x;
            arrowPoint1.y = point1.y;
            // 显示标注
            self.selectedWallLayer.textLayer.position = CGPointMake(arrowPoint0.x , arrowPoint0.y - 0.5 * range.size.height);
            preArrowPoint1 = CGPointMake(point0.x, point0.y -20);
            preWallPoint0 = CGPointMake(preWallPoint0.x, preArrowPoint1.y);
            nextArrowPoint0 = CGPointMake(point1.x, point1.y + 20);
            nextArrowPoint1 = CGPointMake(nextArrowPoint1.x, nextArrowPoint0.y);
        }else { //  垂直向右
            
            point0 = CGPointMake(originPoint0.x,preWallPoint0.y);
            point1 = CGPointMake(point0.x, nextWallPoint0.y);
            point2 = CGPointMake(originPoint2.x, nextWallPoint3.y);
            point3 = CGPointMake(point2.x, preWallPoint2.y);
            
            WThick = point3.x- point0.x;
            range = CGRectMake(point0.x, point0.y, WThick, point1.y - point0.y);
     
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point0.x  - 20;
            arrowPoint0.y = point0.y;
            arrowPoint1.x = arrowPoint0.x;
            arrowPoint1.y = point1.y;
            // 显示标注
            self.selectedWallLayer.textLayer.position = CGPointMake( arrowPoint0.x - self.selectedWallLayer.textLayer.height  , arrowPoint0.y + 0.5 * range.size.height);
          
            preArrowPoint1 = CGPointMake(point0.x,  point0.y+20);
            preArrowPoint0 = CGPointMake(preArrowPoint0.x, preArrowPoint1.y);
            nextArrowPoint0 = CGPointMake(point1.x, point1.y - 20);
            nextArrowPoint1 = CGPointMake(nextArrowPoint1.x, nextArrowPoint0.y);
            
            
        }
        
        // 上一面墙
        preWallPoint1 = point0;
        preWallPoint2 = point3;
        preWallPoint0.y = preWallPoint1.y;
        preWallPoint3.y = preWallPoint2.y;
        
        // 下一面墙
        nextWallPoint0 = point1;
        nextWallPoint3 = point2;
        nextWallPoint1.y = nextWallPoint0.y;
        nextWallPoint2.y = nextWallPoint3.y;
        
        length = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:preWallPoint0 secondPoint:preWallPoint1];
        
    }
    
    
    newPath = [self.selectedWallLayer pathWithPoints:@[pointValue(point0),pointValue(point1),pointValue(point2),pointValue(point3),pointValue(arrowPoint0),pointValue(arrowPoint1)]];
    self.selectedWallLayer.path = newPath.CGPath;
    self.selectedWallLayer.range = range;
    self.selectedWallLayer.selectedWallPoints = @[pointValue(point0),pointValue(point1),pointValue(point2),pointValue(point3),pointValue(arrowPoint0),pointValue(arrowPoint1)];
    
    self.selectedWallLayer.wall.WThick = TwoBitNumber( WThick);
    NSString * wThicknessStr  = [NSString stringWithFormat:@"%@", self.selectedWallLayer.wall.WThick];
    [ wThicknessStr writeToFile:wallThicknessInView atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    preWallLayer.path = [preWallLayer pathWithPoints:@[pointValue(preWallPoint0),pointValue(preWallPoint1),pointValue(preWallPoint2),pointValue(preWallPoint3),pointValue(preArrowPoint0),pointValue(preArrowPoint1)]].CGPath;
    // 更新数据
    preWallLayer.points = @[pointValue(preWallPoint0),pointValue(preWallPoint1),pointValue(preWallPoint2),pointValue(preWallPoint3),pointValue(preArrowPoint0),pointValue(preArrowPoint1)];
    preWallLayer.textLayer.string = [NSString stringWithFormat:@"%.2fm",length/100 *1.00];
    
    nextWallyer.path = [nextWallyer pathWithPoints:@[pointValue(nextWallPoint0),pointValue(nextWallPoint1),pointValue(nextWallPoint2),pointValue( nextWallPoint3),pointValue(nextArrowPoint0),pointValue(nextArrowPoint1)]].CGPath;
    // 更新数据
    nextWallyer.points = @[pointValue(nextWallPoint0),pointValue(nextWallPoint1),pointValue(nextWallPoint2),pointValue( nextWallPoint3),pointValue(nextArrowPoint0),pointValue(nextArrowPoint1)];
    nextWallyer.textLayer.string = [NSString stringWithFormat:@"%.2fm",length/100 *1.00];
    // 更新房间信息
     [self displayRoomInfo];
}

/**
 *  @param btn 正在移动的控件
 *
 *  @return 控件属于哪面墙
 */

- (ZWWallLayer *)getBelongedWallFromMovingKit:(ZEWSubUI*)btn
{
    btn.isInWall = NO;
    btn.backgroundColor = hexColorString(@"f4b37a");
    ZEWSubInfo * wsubInfo = [[ZEWSubInfo alloc]init];
  for (ZWWallLayer * wallLayer in self.wallLayers)
    {
        
        wsubInfo.WSWallNo = wallLayer.wall.WallNo;
        wsubInfo.WSGroup = @(self.selectBtn.furniture.furnitureGroupType);
        wsubInfo.WSType = @(self.selectBtn.furniture.furnitureType);
        wsubInfo.WallSubTitle = self.selectBtn.furniture.furnitureName; // 名称是toolTable 的模型
        UIImage * image = [UIImage imageWithWSuInfo:wsubInfo];
        
        CGRect range = wallLayer.range;
        CGPoint point = btn.center;
      if (CGRectContainsPoint(range, point)) { // 判断改点是否在墙上
          btn.isInWall = YES;
       switch (wallLayer.direction) {
              case ZEWallLayerDirectionHorizontalUp:
           {
               btn.y = range.origin.y ;
               btn.height = range.size.height;
               btn.width = image.size.width;
               
           }
               break;
              case  ZEWallLayerDirectionHorizontalDown:
              {
                  btn.y = range.origin.y ;
                  btn.height = range.size.height;
                  btn.width = image.size.width;
          
              }
                  break;
                  
              case ZEWallLayerDirectionVerticalLeft:
               {
                   btn.x = range.origin.x;
                   btn.width = range.size.width;
                   btn.height = image.size.height;
               }
               break;
              case ZEWallLayerDirectionVerticalRight:
              {
                
                  btn.x = range.origin.x;
                  btn.width = range.size.width;
                  btn.height = image.size.height;
                  
              }
                  break;
          }
        
          wsubInfo.WSSX = TwoBitNumber(btn.x);
          wsubInfo.WSSY = TwoBitNumber(btn.y);
          wsubInfo.WSLength  = TwoBitNumber(btn.width);
          wsubInfo.WSHeight = TwoBitNumber(btn.height);
          self.wsubInfo = wsubInfo;
          [btn setImage:[UIImage imageWithWSuInfo:wsubInfo] forState:UIControlStateNormal];
//          [btn sizeToFit];
          return wallLayer;
      }
      else{
          [btn setImage:[UIImage imageNamed:self.selectBtn.furniture.furnitureIcon] forState:UIControlStateNormal];
          [btn sizeToFit];
      }
    }
    return nil;
}

/**
 *  计算房间的位置和大小
 */
- (CGRect)roomFrame
{
    CGPoint startPoint = CGPointZero;
    CGFloat wallWidth = 0;
    CGFloat wallLength = 0;
    
    for (NSInteger i = 0;i < self.wallLayers.count;i++) {
        ZWWallLayer * wallLayer = self.wallLayers[i];
        if([wallLayer.wall.WallNo isEqualToString :@"0"]) // 第一面墙确定房间的起点和长度
        {
            startPoint = [wallLayer.selectedWallPoints[0] CGPointValue];
            wallLength =  [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:startPoint secondPoint:[wallLayer.selectedWallPoints[1] CGPointValue]];
        }else if ([wallLayer.wall.WallNo isEqualToString :@"1"]){ // 第二面前墙确定房间的宽度
            wallWidth = [[ZEMeasureTool sharedZEMeasureTool] distanceBetweenTwoPointsFirstPoint:[wallLayer.selectedWallPoints[0] CGPointValue] secondPoint:[wallLayer.selectedWallPoints[1] CGPointValue]];
        }else{
           
        }
    }
    return CGRectMake(startPoint.x, startPoint.y, wallLength, wallWidth);
}
/**
 *  显示房间的信息
 *
 */
- (void)displayRoomInfo
{
    CGSize roomSize = [self roomFrame].size;
    NSString * sizeStr = [NSString stringWithFormat:@"%.2f㎡",(roomSize.width)/100 * (roomSize.height)/100];
    self.roomCover.frame = [self roomFrame];
    self.roomCover.backgroundColor = [UIColor clearColor];
    self.roomCover.alpha = 1;
    [self.contentView addSubview:self.roomCover];
    [self.roomCover setTitle:@"客厅" forState:UIControlStateNormal];
    self.roomCover.subText = sizeStr;
    self.roomCover.clickTime = 1;
}

/**
 *  根据数据模型还原墙上的附加物
 */
- (void)recoverWallSubWithWSubList:(NSArray*)list inWall:(ZWWallLayer*)wall
{
    //  清空数组
    [self.wsubInfoArray removeAllObjects];
    
    for (ZEWSubInfo * wsubInfo in list) {
        ZWWSubUIContainer * subUI = [ZWWSubUIContainer wsubUIWithWSubInfo:wsubInfo belongedWall:wall];
        [self.contentView addSubview:subUI];
        [self.wusbUIArray addObject:subUI];
    }

}

// 添加编辑尺寸箭头

- (void)editSeletedWSbUI:(ZWWSubUIContainer *)subUI
{
    
    if (subUI.isHorison)
    {
        [self addArrowForHorisonSubUI:subUI];
    }else if(subUI.isVertical)
    {
        [self addArrowForVerticalSubUI:subUI];
    }else
    {
        
    }
}
//  为水平方向的墙体附加物添加箭头
- (void)addArrowForHorisonSubUI:(ZWWSubUIContainer*)subUI
{
    
    [self.contentView addSubview: self.editArrow.arrowLeft];
    [self.contentView addSubview:self.editArrow.arrrowRight];
    

    self.editArrow.arrowLeft.x = subUI.x - self.editArrow.arrowLeft.width;
    self.editArrow.arrowLeft.y = subUI.y;
    self.editArrow.arrrowRight.x =CGRectGetMaxX(subUI.frame);
    self.editArrow.arrrowRight.y = subUI.y;
}

//  为垂直方向的墙体附加物添加箭头
- (void)addArrowForVerticalSubUI:(ZWWSubUIContainer*)subUI
{
    
    [self.contentView addSubview: self.editArrow.arrowUp];
    [self.contentView addSubview:self.editArrow.arrowDown];
    
    
    self.editArrow.arrowUp.x = subUI.x;
    self.editArrow.arrowUp.y = subUI.y - self.editArrow.arrowUp.height ;
    self.editArrow.arrowDown.x =subUI.x;
    self.editArrow.arrowDown.y = CGRectGetMaxY(subUI.frame);
}

// 通过左箭头改变subUI的尺寸
- (void)updateWsubUILayoutWithArrowLeft:(CGPoint)point
{
    // 1.改变外观尺寸
    self.editArrow.arrowLeft.centerX = point.x;
    self.selectedWSubUIContainner.sd_layout
    .leftSpaceToView(self.editArrow.arrowLeft,0)
    .rightSpaceToView(self.editArrow.arrrowRight,0)
    .heightIs(self.selectedWSubUIContainner.width);
    
    [self.selectedWSubUIContainner updateLayout];
    // 2.改变模型数据
    
    [self.selectedWSubUIContainner updateSubUIInfo];
}

// 通过右边箭头改变subUI的尺寸
- (void)updateWsubUILayoutWithArrowRight:(CGPoint)point
{
       // 1.改变外观尺寸
    self.editArrow.arrrowRight.centerX = point.x;
    self.selectedWSubUIContainner.sd_layout
    .rightSpaceToView(self.editArrow.arrrowRight,0)
    .leftSpaceToView(self.editArrow.arrowLeft,0)
       .heightIs(self.selectedWSubUIContainner.width);
    [self.selectedWSubUIContainner updateLayout];
    
    // 2.改变模型数据
    [self.selectedWSubUIContainner updateSubUIInfo];
    
    
}

// 通过上箭头改变subUI的尺寸
- (void)updateWsubUILayoutWithArrowUp:(CGPoint)point
{
       // 1.改变外观尺寸
    self.editArrow.arrowUp.centerY = point.y;
    self.selectedWSubUIContainner.sd_layout
    .topSpaceToView(self.editArrow.arrowUp,0)
    .bottomSpaceToView(self.editArrow.arrowDown,0)
    .widthIs(self.selectedWSubUIContainner.height);
    [self.selectedWSubUIContainner updateLayout];
    
    // 2.改变模型数据
    [self.selectedWSubUIContainner updateSubUIInfo];
}

// 通过下箭头改变subUI的尺寸
- (void)updateWsubUILayoutWithArrowDown:(CGPoint)point
{
       // 1.改变外观尺寸
    self.editArrow.arrowDown.centerY = point.y;
    self.selectedWSubUIContainner.sd_layout
    .bottomSpaceToView(self.editArrow.arrowDown,0)
    .topSpaceToView(self.editArrow.arrowUp,0)
    .widthIs(self.selectedWSubUIContainner.height);
    
    [self.selectedWSubUIContainner updateLayout];
    
    // 2.改变模型数据
    [self.selectedWSubUIContainner updateSubUIInfo];
}

// 显示测距仪的值
- (void)updateDistanceWithTestValue:(CGFloat)distance
{
    if (_isWallTestDis) {
        [self changeSelectedWallLength:distance];
        [self displayTestedWallLength:distance];
        
        return;
    }
    if (_isWusuUITestDis) {
        
        [self displaySelectedWsubUIValue:distance];
        return;
    }
}


// 清除所有的标志
- (void)clearAllFlag
{
    _isWusuUITestDis = NO;
    _isWallTestDis = NO;
    _isUpload = NO;
}

/**
 *  显示两面墙的测距值（因为是长方形，所以要同时显示两面墙的长度）
 */
- (void)displayTestedWallLength:(CGFloat)distance
{
    CGFloat size = 0;
    ZWWallLayer * vw = nil;
    self.selectedWallLayer.text = [NSString stringWithFormat:@"%.3fm",distance];
    if (self.selectedWallLayer.wall.WallNo.integerValue %2 == 0) { // 水平
        // 从数组中取出水平方向的墙
        for (ZWWallLayer * wallLayer in self.wallLayers) {
            if (wallLayer.wall.WallNo.integerValue %2 == 0) {
                wallLayer.text = self.selectedWallLayer.text;
                //更新数据模型
                wallLayer.wall.WLength = @(distance);
            }
            // 找出垂直的墙
            vw = [self wallLayerWithWallNum:1];
            size = [self floatStringWithString:wallLayer.text].floatValue * [self floatStringWithString:vw.text].floatValue * 1.000;
        }
    }else{ // 垂直
        // 从数组中取出垂直方向的墙
        for (ZWWallLayer * wallLayer in self.wallLayers) {
            if (wallLayer.wall.WallNo.integerValue %2 != 0) {
                wallLayer.text = self.selectedWallLayer.text;
                //更新数据模型
                wallLayer.wall.WLength = @(distance);
            }
            // 找出水平的墙
            vw = [self wallLayerWithWallNum:2];
            size = [self floatStringWithString:wallLayer.text].floatValue * [self floatStringWithString:vw.text].floatValue * 1.000;
        }
    }
    
    [self displayChangeRoomArrea:size];
   
}

- (void)displayChangeRoomArrea:(CGFloat)size
{
    self.roomCover.subText = [NSString stringWithFormat:@"%.3f㎡",size];
    
}
- (ZWWallLayer*)wallLayerWithWallNum:(NSInteger)wallNum
{
    for (ZWWallLayer * wallLayer in self.wallLayers) {
        if (wallLayer.wall.WallNo.integerValue == wallNum) {
            return wallLayer;
        }
    }
    return nil;
}

- (NSString*)floatStringWithString:(NSString*)str
{
    CGFloat le = str.length;
    NSRange range = NSMakeRange(0, le - 1);
    NSLog(@"floatStringWithString:%@",[str substringWithRange:range]);
    return [str substringWithRange:range];
}
- (void)displaySelectedWsubUIValue:(CGFloat)distance
{
    if (distance == 0.0) {
        return;
    }
    switch (self.selectedWSubUIContainner.belongedWall.direction) {
        case ZEWallLayerDirectionHorizontalUp:
        case ZEWallLayerDirectionHorizontalDown:
        {
            self.selectedWSubUIContainner.wsubInfo.WSLength = TwoBitNumber(distance);
            [self updateLayoutForHorisonMarkView];
            break;
        }
            
            case ZEWallLayerDirectionVerticalLeft:
            case ZEWallLayerDirectionVerticalRight:
        {
            self.selectedWSubUIContainner.wsubInfo.WSHeight = TwoBitNumber(distance);
            [self updateLayoutForVerticalMarkView];
        }
        default:
            break;
    }
}
// 天花板高度
- (void)ceilingHeight
{
    __weak typeof(self) weakSelf = self;
    
    TYAlertView * alterView = [TYAlertView alertViewWithTitle:@"请输入天花板的高度" message:@"单位为m"];
    [alterView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"天花板的高度";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    TYAlertAction * action = [TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:nil];
    
    TYAlertAction * action1 = [TYAlertAction actionWithTitle:@" 确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        UITextField * textField = [alterView.textFieldArray firstObject];
        
        NSLog(@"%@",textField.text);
        weakSelf.roomCover.sstext = [NSString stringWithFormat:@"天花板高度:%@m",textField.text];
        // 更新模型数据
        weakSelf.roomInfo.RPlatHeight = TwoBitNumber(textField.text.doubleValue);
    }];
    
    [alterView addAction:action];
    [alterView addAction:action1];
    TYAlertController * controller =  [TYAlertController alertControllerWithAlertView:alterView preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationDropDown];
    [self presentViewController:controller animated:YES completion:nil];

}

//重新命名
- (void)renameRoom
{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"请输入房间名" message: nil];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    // 弱引用alertView 否则 会循环引用
    __typeof (alertView) __weak weakAlertView = alertView;
    __weak typeof(self) weakSelf = self;
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        for (UITextField *textField in weakAlertView.textFieldArray) {
            [weakSelf.roomCover setTitle:textField.text forState:UIControlStateNormal];
        }
    }]];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"房间名";
    }];
    
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
}

// 删除房间
- (void)deleteRoom
{
    NSLog(@"%ld",self.wallLayers.count);
    if (self.wallLayers.count != 0)
    {
        
        [self.contentView removeAllSubviews];
        for (ZWWallLayer  * wall in self.wallLayers) {
            [wall removeFromSuperlayer];
        }
        
        self.wallLayers = nil;
        
        [self.wusbUIArray removeAllObjects];
    }
   
    
}
// 编辑墙壁
- (void)showEditWallAlter
{
    __weak typeof(self) weakSelf = self;
    
    if (self.selectedWallLayer == nil) {
        [SVProgressHUD setMinimumDismissTimeInterval:2.0];
        [SVProgressHUD showErrorWithStatus:@"请先选中一面墙壁"];
        return ;
    }
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"编辑墙壁" message:@"您可以使用以下两种方式编辑墙壁"];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"使用测距仪" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        
        [weakSelf setupLazer];
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"手动输入" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        [weakSelf handInput];
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    // first way to show
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];
    

    //alertController.alertViewOriginY = 60;
    [self presentViewController:alertController animated:YES completion:nil];

}

// 手动输入墙壁的长度
- (void)handInput
{
    
    __weak typeof(self) weakSelf = self;
    
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"请输入墙壁的长度" message:@"单位是m"];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"墙壁的长度单位是m";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        UITextField * textField = [alertView.textFieldArray firstObject];
        [weakSelf changeSelectedWallLength:textField.text.floatValue];
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationDropDown];
    [self presentViewController:alertController animated:YES completion:nil];
}



- (void)createMarkViewWithWusbUI:(ZWWSubUIContainer*)wsuUI
{
    //创建之前先已移除原有的
    for (ZEMarkView * mark  in self.markArray) {
        [mark removeFromSuperview];
    }
    
    [self.markArray removeAllObjects];
    // 根据控件的所在的墙体返回不同位置的箭头
    
    ZEWallLayerDirection direction = wsuUI.belongedWall.direction;
    
    switch (direction) {
        case ZEWallLayerDirectionHorizontalUp :
            [self creatHorizonWsubUIMarkViewWithWsubUI:wsuUI];
            break;
        case ZEWallLayerDirectionHorizontalDown:
            
            [self creatHorizonWsubUIMarkViewWithWsubUI:wsuUI];
            break;
        case ZEWallLayerDirectionVerticalLeft:
            [self creatVerticalWsubUIMarkViewWithWsubUI:wsuUI];
            break;
        case ZEWallLayerDirectionVerticalRight:
            [self creatVerticalWsubUIMarkViewWithWsubUI:wsuUI];
            break;
            
    }
    
}

// 创建水平方向的标注箭头（三个）

- (void)creatHorizonWsubUIMarkViewWithWsubUI:(ZWWSubUIContainer*)subUI
{
    ZEMarkView* mark = [ZEMarkView markViewWithType:ZEMarkViewTypeHorison];
    [self.contentView addSubview:mark];
    self.mark = mark;
    
    ZEMarkView* firstMark = [ZEMarkView markViewWithType:ZEMarkViewTypeHorison];
    self.firstMark = firstMark;
    [self.contentView addSubview:firstMark];
    
    ZEMarkView* secondMark = [ZEMarkView markViewWithType:ZEMarkViewTypeHorison];
    self.secondMark = secondMark;
    [self.contentView addSubview:secondMark];
    
   
    
    [self updateLayoutForHorisonMarkView];
    
    [self.markArray addObjectsFromArray:@[mark,self.firstMark,self.secondMark]];
 
   
}

// 创建垂直方向的标注箭头（三个）
- (void)creatVerticalWsubUIMarkViewWithWsubUI:(ZWWSubUIContainer*)subUI
{
    ZEMarkView* mark = [ZEMarkView markViewWithType:ZEMarkViewTypeVertical];
    [self.contentView addSubview:mark];
    self.mark = mark;
    
    ZEMarkView* firstMark = [ZEMarkView markViewWithType:ZEMarkViewTypeVertical];
    self.firstMark = firstMark;
    [self.contentView addSubview:firstMark];
    
    ZEMarkView* secondMark = [ZEMarkView markViewWithType:ZEMarkViewTypeVertical];
    self.secondMark = secondMark;
    [self.contentView addSubview:secondMark];
    
    [self.markArray addObjectsFromArray:@[ self.mark, self.firstMark, self.secondMark]];
    
    [self updateLayoutForVerticalMarkView];
}


//  跟新垂直方向箭头的约束
- (void)updateLayoutForVerticalMarkView
{
    
    
    self.mark.sd_layout
    .topEqualToView(self.selectedWSubUIContainner)
    .bottomEqualToView(self.selectedWSubUIContainner)
    .rightSpaceToView(self.selectedWSubUIContainner,0)
    .widthIs(self.mark.width);
    [self.mark updateLayout];
    
    self.firstMark.sd_layout
    .rightEqualToView(self.mark)
    .leftEqualToView(self.mark)
    .bottomSpaceToView(self.mark,0)
    .heightIs(self.selectedWSubUIContainner.belongedWall.range.origin.y - self.mark.y);
    [self.firstMark updateLayout];
    
    self.secondMark.sd_layout
    .rightEqualToView(self.mark)
    .leftEqualToView(self.mark)
    .topSpaceToView(self.mark,0)
    .heightIs(self.selectedWSubUIContainner.belongedWall.range.size.height - self.firstMark.height - self.mark.height);
    [self.secondMark updateLayout];
    
    [self updateVerticalMarkViewValue];
    
}

// 更新垂直方向箭头的值
- (void)updateVerticalMarkViewValue
{
    self.mark.text = [NSString stringWithFormat:@"%.2f",self.selectedWSubUIContainner.wsubInfo.WSHeight.floatValue /100 * 1.00];
    self.firstMark.text = [NSString stringWithFormat:@"%.2f",self.firstMark.height /100 * 1.00];
    self.secondMark.text = [NSString stringWithFormat:@"%.2f",self.secondMark.height/100 * 1.00];
}

//  跟新水平方向箭头的约束
- (void)updateLayoutForHorisonMarkView
{
    self.mark.sd_layout
    .leftEqualToView(self.selectedWSubUIContainner)
    .rightEqualToView(self.selectedWSubUIContainner)
    .bottomSpaceToView(self.selectedWSubUIContainner,0)
    .heightIs(self.mark.height);
    [self.mark updateLayout];
    
    self.firstMark.sd_layout
    .rightSpaceToView(self.mark,0)
    .bottomEqualToView(self.mark)
    .topEqualToView(self.mark)
    .widthIs(self.selectedWSubUIContainner.belongedWall.range.origin.x - self.mark.x);
    [ self.firstMark updateLayout];
    
    self.secondMark.sd_layout
    .leftSpaceToView(self.mark,0)
    .bottomEqualToView(self.mark)
    .topEqualToView(self.mark)
    .widthIs(CGRectGetMaxX(self.selectedWSubUIContainner.belongedWall.range) - CGRectGetMaxX(self.mark.frame));
    [self.secondMark updateLayout];
  
    [self updateHorisonMarkViewValue];
}

// 更新水平方向wsui的显示箭头的值
- (void)updateHorisonMarkViewValue
{
    
    self.mark.text = [NSString stringWithFormat:@"%.2f",self.selectedWSubUIContainner.wsubInfo.WSLength.floatValue /100 * 1.00];
    self.firstMark.text = [NSString stringWithFormat:@"%.2f",self.firstMark.width /100 *1.00];
    self.secondMark.text = [NSString stringWithFormat:@"%.2f",self.secondMark.width /100 *1.00];
}

- (void)deleteMarkView
{
    [self.mark removeFromSuperview];
    [self.firstMark removeFromSuperview];
    [self.secondMark removeFromSuperview];
}

#pragma mark -- 转换坐标系相关


#pragma mark -- 与工具菜单相关的方法

- (void)drwaWall
{
    
    /**
     * 墙的长度和厚度要做一个转换，（比如1m ---->100）
     */
    // 1.获取参考点
    CGPoint contentViewCenter = [self currentScreenCenter];
    
    ZEWallInfo*  wall0 = [[ZEWallInfo alloc]init];
    wall0.WallNo = @"0";
    wall0.WNextNo = [NSString stringWithFormat:@"%ld",wall0.WallNo.integerValue +1];
    wall0.WThick = @20;
    wall0.WSX = @(contentViewCenter.x- 300 );
    wall0.WSY = @(contentViewCenter.y- 200);
    wall0.WEX = @(contentViewCenter.x + 400);
    wall0.WEY = wall0.WSY;
    wall0.WJSX = @(wall0.WEX.doubleValue + wall0.WThick.doubleValue);
    wall0.WJSY = @(wall0.WEY.doubleValue - wall0.WThick.doubleValue );
    wall0.WJEX = @(wall0.WSX.doubleValue - wall0.WThick.doubleValue);
    wall0.WJEY = wall0.WJSY;
    
    ZWWallLayer * wallLayer0 = [ZWWallLayer wallLayerWithWallModel:wall0 ];
    [self.contentView.layer addSublayer:wallLayer0];
    
    ZEWallInfo*  wall1 = [[ZEWallInfo alloc]init];
    wall1.WallNo = @"1";
    wall1.WNextNo =[NSString stringWithFormat:@"%ld",wall1.WallNo.integerValue + 1];
    wall1.WPreNo = [NSString stringWithFormat:@"%ld",wall1.WallNo.integerValue -1];
    wall1.WThick = @20;
    wall1.WSX = wall0.WEX;
    wall1.WSY = wall0.WEY;
    wall1.WEX = wall1.WSX;
    wall1.WEY = [NSNumber numberWithDouble:(wall1.WSY.doubleValue + 400)];
    wall1.WJSX = @(wall1.WEX.doubleValue + wall1.WThick.doubleValue);
    wall1.WJSY = @(wall1.WEY.doubleValue + wall1.WThick.doubleValue );
    wall1.WJEX = wall1.WJSX;
    wall1.WJEY = @(wall1.WSY.doubleValue - wall1.WThick.doubleValue );
    ZWWallLayer * wallLayer1 = [ZWWallLayer wallLayerWithWallModel:wall1 ];
    [self.contentView.layer addSublayer:wallLayer1];

    ZEWallInfo*  wall2 = [[ZEWallInfo alloc]init];
    wall2.WallNo = @"2";
    wall2.WPreNo = [NSString stringWithFormat:@"%ld",wall2.WallNo.integerValue -1];
    wall2.WNextNo = [NSString stringWithFormat:@"%ld",wall2.WallNo.integerValue +1];
    wall2.WThick = @20;
    wall2.WSX = wall1.WEX;
    wall2.WSY = wall1.WEY;
    wall2.WEX = wall0.WSX;
    wall2.WEY = wall2.WSY;
    wall2.WJSX = @(wall2.WEX.doubleValue - wall2.WThick.doubleValue);
    wall2.WJSY = @(wall2.WEY.doubleValue + wall2.WThick.doubleValue );
    wall2.WJEX = @(wall2.WSX.doubleValue + wall0.WThick.doubleValue);
    wall2.WJEY = wall2.WJSY;
    ZWWallLayer * wallLayer2 = [ZWWallLayer wallLayerWithWallModel:wall2 ];
    [self.contentView.layer addSublayer:wallLayer2];
    
    ZEWallInfo*  wall3 = [[ZEWallInfo alloc]init];
    wall3.WallNo = @"3";
    wall3.WPreNo = [NSString stringWithFormat:@"%ld",wall3.WallNo.integerValue -1];
    wall3.WNextNo = wall0.WallNo;
    wall3.WThick = @20;
    wall3.WSX = wall2.WEX;
    wall3.WSY = wall2.WEY;
    wall3.WEX = wall0.WSX;
    wall3.WEY =wall0.WSY;
    wall3.WJSX = @(wall3.WEX.doubleValue - wall3.WThick.doubleValue);
    wall3.WJSY = @(wall3.WEY.doubleValue - wall3.WThick.doubleValue );
    wall3.WJEX = wall3.WJSX;
    wall3.WJEY = @(wall3.WSY.doubleValue + wall3.WThick.doubleValue );
    ZWWallLayer * wallLayer3 = [ZWWallLayer wallLayerWithWallModel:wall3];
    [self.contentView.layer addSublayer:wallLayer3];
    
    self.wallLayers = @[wallLayer0,wallLayer1,wallLayer2,wallLayer3];
    [self.contentView addGestureRecognizer:self.tap];
    
#warning 记录第一面墙的WPreNo
    wallLayer0.wall.WPreNo = [NSString stringWithFormat:@"%ld",(long)wall3.WallNo.integerValue ];
    
    // 墙画完之后显示房间的尺寸和房间的类型
    [self displayRoomInfo];
}
- (void)drawWallFromOrderInfo
{
    NSMutableArray * wallLayers = [NSMutableArray array];

    ZERoomInfo * roomInfo = self.orderInfo.ORoomList[0];
    for (ZEWallInfo * wallInfo  in roomInfo.RWallList) {
        
        NSDictionary* dict = [wallInfo mj_keyValues];
        NSLog(@"return from server JSON:%@",dict);
        ZWWallLayer * wallLayer = [ZWWallLayer wallLayerWithWallModel:wallInfo];
        [self.contentView.layer addSublayer:wallLayer];
        [wallLayers addObject:wallLayer];
        // 恢复墙体附加物
        [self recoverWallSubWithWSubList:wallInfo.WSubList inWall:wallLayer];
        
    }
    
    self.wallLayers = wallLayers;
    [self.contentView addGestureRecognizer:self.tap];
    
    // 墙画完之后显示房间的尺寸和房间的类型
    [self displayRoomInfo];
    
 
}

- (void)dragDoor
{
//    ZEToolTableModel * model = [[ZEToolTableModel alloc]init];
//    model.items = self.doorList;
//    model.isDoorType = YES;
//    [self addToolTableViewWithTableHeaderModel:nil tableViewModel:model tableHeaderSize:CGSizeMake(175, 44) tableCellSize:CGSizeMake(175, 64)];
//    self.doorHeader.width = 175;
//    self.doorHeader.height = 44 * 2;
//    self.doorHeader.titleLable.text = @"门窗";
//    self.toolTableView.toolHeader = self.doorHeader;
    [self.toolTableView removeFromSuperview];
     [self.view insertSubview:self.furnitureView aboveSubview:self.drawboardView];
    self.furnitureView.sd_layout
    .leftSpaceToView(self.view,10)
    .widthIs(175)
    .centerYEqualToView(self.view)
    .heightIs(400);
}


- (void)editSpecifyWsbUI:(ZWWSubUIContainer*)wsubUI
{
    [self.furnitureView removeFromSuperview];
    
    // 赋值数据
    ZEToolTableModel * model = [[ZEToolTableModel alloc]init];
    model.items = self.doorEditOptions;
    model.isSpecifyDoorType =  YES;
    self.toolTableView.toolTableModel = model;
  
    // 赋值数据
    ZEtoolTableHeaderModel * door = [[ ZEtoolTableHeaderModel alloc]init];
    door.typeName = wsubUI.wsubInfo.WallSubTitle;
    door.iconName = self.selectBtn.furniture.furnitureIcon;
   
    [self addToolTableViewWithTableHeaderModel:door tableViewModel:model tableHeaderSize:CGSizeMake(160, 44) tableCellSize:CGSizeMake(160, 44)];
}
- (void)editWall
{
    
    [self.furnitureView removeFromSuperview];
    // 赋值数据
    ZEToolTableModel * model = [[ZEToolTableModel alloc]init];
    model.items = self.wallEditOptions;
    model.isWallType = YES;
    // 赋值数据
    ZEtoolTableHeaderModel * wall = [[ ZEtoolTableHeaderModel alloc]init];
    wall.typeName = @"墙";
    wall.iconName = @"icon_wall";
   
    [self addToolTableViewWithTableHeaderModel:wall tableViewModel:model tableHeaderSize:CGSizeMake(160, 44) tableCellSize:CGSizeMake(160, 44)];
}
- (void)editAppendingObject
{
    [self.furnitureView removeFromSuperview];
    // 赋值数据
    ZEToolTableModel * model = [[ZEToolTableModel alloc]init];
    model.items = self.appendingObjects;
    model.isSpecifyDoorType =  YES;
    
    // 赋值数据
    ZEtoolTableHeaderModel * door = [[ ZEtoolTableHeaderModel alloc]init];
    door.typeName = @"附件物";
    door.iconName = @"icon_add-ons";
    
    [self addToolTableViewWithTableHeaderModel:door tableViewModel:model tableHeaderSize:CGSizeMake(160, 44) tableCellSize:CGSizeMake(160, 44)];

}

- (void)editSpecifyRoom:(ZECoverButton*)cover
{
    [self.furnitureView removeFromSuperview];
    cover.clickTime ++ ;
    cover.alpha = 1;
    cover.backgroundColor = [UIColor clearColor];
    cover.selected = NO;
    if (cover.clickTime ==2) {
        cover.clickTime =0;
        cover.selected = YES;
        cover.alpha = 0.4;
        cover.backgroundColor = hexColorString(@"f4b37a");

    }
    // 赋值数据
    ZEToolTableModel * model = [[ZEToolTableModel alloc]init];
    model.items = self.roomEditOptions;
    model.isSpecifyRoomType=  YES;
    
    // 赋值数据
    ZEtoolTableHeaderModel * room = [[ ZEtoolTableHeaderModel alloc]init];
    room.typeName = @"房间";
    room.iconName = @"icon_room"; 
    
    [self addToolTableViewWithTableHeaderModel:room tableViewModel:model tableHeaderSize:CGSizeMake(160, 44) tableCellSize:CGSizeMake(160, 44)];
    
}


- (void)addToolTableViewWithTableHeaderModel:(ZEtoolTableHeaderModel*)headerModel tableViewModel:(ZEToolTableModel*)tableModel tableHeaderSize:(CGSize)size tableCellSize:(CGSize)cellSize
{
    // 赋值数据
    self.toolTableView.toolTableModel = tableModel;
    
    self.toolheaderView.width = size.width;
    self.toolheaderView.height = size.height  ;
    self.toolTableView.backgroundColor = hexColorString(@"f0f0f0");
    [self.view insertSubview:self.toolTableView aboveSubview:self.drawboardView];
    
    self.toolTableView.sd_layout
    .leftSpaceToView(self.view,10)
    .widthIs(cellSize.width)
    .centerYEqualToView(self.view)
    .heightIs(toolTableViewHeight(tableModel.items.count, cellSize.height, self.toolheaderView.height));
    lieonLog(@"wall:%f",self.toolTableView.height);
    
    //  记录可见的cell的个数(门)
    if (tableModel.isDoorType) {
        _visibleCellCount = (self.toolTableView.height - 44 -20) / 64 +1;
    }
    // 赋值数据
    self.toolheaderView.headerModel = headerModel;
    self.toolTableView.toolHeader = self.toolheaderView;
    [UIView transitionWithView:self.toolTableView duration:animationDuration options: UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
    } completion:nil];
    
    // 记录工具栏在contView上对应的位置
    CGRect toolTableViewFrameInContentView =  [ self.toolTableView.superview convertRect:self.toolTableView.frame toView:self.contentView];
    
}

-(void) openCamera
{
    //    判断照相机能否可用
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    UIImagePickerController * ipc = [UIImagePickerController new];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark --- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    [picker dismissViewControllerAnimated:NO completion:nil];
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    NSData * headerData = UIImageJPEGRepresentation(image, 0.3);
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
    
    ZEPhotoViewController * photoVC =[sb instantiateViewControllerWithIdentifier:@"ZEPhotoViewController"];
    photoVC.photoData = headerData;
    photoVC.imageInfo.ProjectID = self.orderInfo.ProjectID;
#warning 由于目前只有一个房间，所以暂时传0
    photoVC.imageInfo.RoomNo =@"0" ;
    [self.navigationController pushViewController:photoVC animated:YES];
    
    NSLog(@"%lu",(unsigned long)headerData.length);
  
}

#pragma mark --- ZEToolTabeleViewDelegate


- (void)toolTabeleView:(ZEToolTabeleView *)toolTableView DidSelcetedFurniture:(ZEFurnitureModel *)furniture
{
    // 进行了拽控件的同时,应该原先的手势无效
    self.pan.enabled = NO;
    [toolTableView addGestureRecognizer:self.toolTableViewPan];
    self.selectBtn.furniture= furniture;
}

- (void)toolTabeleView:(ZEToolTabeleView *)toolTableView DidChangeWallThickness:(CGFloat)thickness
{
    [self chageSelectedWallThickness:thickness];
}

#pragma mark --- ZEFurnitureViewDelegate

- (void)furnitureView:(ZEFurnitureView *)furnitureView DidSelcetedFurniture:(ZEFurnitureModel *)furniture
{
    // 进行了拽控件的同时,应该原先的手势无效
    self.pan.enabled = NO;
    [furnitureView addGestureRecognizer:self.toolTableViewPan];
    self.selectBtn.furniture= furniture;
}




#pragma mark - ZEEditArrowDelegate

- (void)editArrowDidMoved:(ZEEditArrow *)arrow
{
    [self.editArrow removeArrow];
    [self.selectedWSubUIContainner sd_clearAutoLayoutSettings];
}

- (void)editArrowButton:(ZEArrowButton *)arrow IsMoving:(CGPoint)point
{
    
    switch (arrow.type) {
            
        case ZEArrowButtonTypeUp:
        {
            //  1.更新选中控件的约束
            [self updateWsubUILayoutWithArrowUp:point];
            
            // 2.更新显示控件尺寸的约束
            [self updateLayoutForVerticalMarkView];
            break;
        }
        case ZEArrowButtonTypeDown:
            
        {
            [self updateWsubUILayoutWithArrowDown:point];
            
            [self updateLayoutForVerticalMarkView];
            break;
        }
        case ZEArrowButtonTypeLeft:
        {
            
            [self updateWsubUILayoutWithArrowLeft:point];
            [self updateLayoutForHorisonMarkView];
            break;
        }
        case ZEArrowButtonTypeRight:
        {
            [self updateWsubUILayoutWithArrowRight:point];
            
            [self updateLayoutForHorisonMarkView];
            break;
        }
            
    }
    

}

#pragma mark - 手势相关

- (void)toolTableViewPanAction:(UIPanGestureRecognizer*)pan
{
    [self.editArrow removeArrow];
    
    // 记录在画板上的位置
    CGPoint point = [pan locationInView:self.contentView];
    if(point.x >= self.toolTableViewFrameInContentView.origin.x + self.toolTableView.width){
        self.movingWSubUI.center = CGPointMake(point.x - 50, point.y - 50);
        [self.contentView addSubview:self.movingWSubUI];
        
        ZWWSubUIContainer  * subUI = [[ZWWSubUIContainer alloc]init];
        switch (pan.state ) {
            case UIGestureRecognizerStateChanged:
            {
                // 移动的时候告诉门属于那面墙
                _belongedWall =[self getBelongedWallFromMovingKit:self.movingWSubUI];
                _subUIFrame = self.movingWSubUI.frame;
               
                 break;
            }
               
            case UIGestureRecognizerStateEnded:
            {
                if (self.movingWSubUI.isInWall)
                {
                    subUI.origin = _subUIFrame.origin;
                    subUI.size = defaultWsubUISize;
                    
                    subUI.image =self.movingWSubUI.imageView.image;
                    [self.contentView addSubview:subUI];
                    
                    //在手势结束后设置墙的模型数据（将要发送给服务器的数据）
                    
                    [_belongedWall.wall.WSubList addObject:self.wsubInfo];
                    //  赋值这面墙的数据
                    subUI.wsubInfo = self.wsubInfo;
                    subUI.belongedWall = _belongedWall;
                    
                    [self.wusbUIArray addObject:subUI];
                    [self.movingWSubUI removeFromSuperview];
                }
                
                [self.movingWSubUI removeFromSuperview];
                [pan.view removeGestureRecognizer:pan];
                    
                break;
                
            }
            default:
                break;
        }
    }
    
    for (ZWWSubUIContainer * wsubUI in self.wusbUIArray) {
        NSLog(@"+++++++======%@",wsubUI.wsubInfo.WSWallNo);
    }
}

- (void)specifyDoorPanAction:(UIPanGestureRecognizer*)pan
{
    self.pan.enabled = NO;
    CGPoint point = [pan locationInView:self.contentView];
    
    ZWWallLayer * wallLayer = self.lastSelectedDoor.belongedWall;
    NSLog(@"specifyDoorPanAction%d",wallLayer.direction);
    CGRect range = wallLayer.range;
    
    switch (wallLayer.direction) {
        case ZEWallLayerDirectionHorizontalUp:
        case  ZEWallLayerDirectionHorizontalDown:
        {
            if (point.x >= CGRectGetMaxX(range)- self.lastSelectedDoor.width * 0.5) {
                point.x = CGRectGetMaxX(range)- self.lastSelectedDoor.width * 0.5;
            }
            if (point.x < range.origin.x +self.lastSelectedDoor.width * 0.5) {
                point.x = range.origin.x +self.lastSelectedDoor.width * 0.5;
            }
            self.lastSelectedDoor.centerX = point.x;
          
        }
            break;
            
        case ZEWallLayerDirectionVerticalLeft:
        case ZEWallLayerDirectionVerticalRight:
        {
            if (point.y >= CGRectGetMaxY(range) - self.lastSelectedDoor.height * 0.5) {
                point.y = CGRectGetMaxY(range)- self.lastSelectedDoor.height * 0.5;
            }
            if (point.y <= range.origin.y + self.lastSelectedDoor.height * 0.5) {
                point.y = range.origin.y + self.lastSelectedDoor.height * 0.5;
            }
            self.lastSelectedDoor.centerY = point.y;
        }
            break;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        [pan.view removeGestureRecognizer:pan];
    }

}


- (void)tapGestureInSelfContentView:(UITapGestureRecognizer*)tap
{
   
    CGPoint tapPoint = [tap locationInView:self.contentView];

    UIColor * fillSelsetedColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image_wall_selected"]];
    UIColor * fillNormalColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image_wall_normal"]];
    
    self.selectedWallLayer.fillColor = fillNormalColor.CGColor;
    
    
    // 检查触点是否在有效范围内
    NSLog(@"%@",NSStringFromCGPoint(tapPoint));
    NSLog(@"%@",NSStringFromCGRect([self roomFrame]));
    // 是否点击了房间
    if (CGRectContainsPoint([self roomFrame], tapPoint))
    {
        self.roomCover.alpha = 0.4;
        self.roomCover.backgroundColor =  hexColorString(@"f4b37a");
        return;
    }

    
    // 是否点击了墙
    for (ZWWallLayer * wallLayer  in self.wallLayers) {
        
        CGRect range =  wallLayer.range;
        if (CGRectContainsPoint(range, tapPoint)) {
            
            self.selectedWallLayer.fillColor = fillNormalColor.CGColor;
            // 设置为选中状态
            wallLayer.fillColor =fillSelsetedColor.CGColor;
            self.selectedWallLayer = wallLayer;
            [self editWall];
            return;
        }
    }
    self.selectedWallLayer = nil;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}


#pragma mark - 通知相关

- (void)wsbUIDidClick:(NSNotification*)notification
{
    
    // 1.选中某个wsubUI控件
    self.selectedWSubUIContainner = notification.userInfo[@"wsbUI"];
    [self editSpecifyWsbUI:self.selectedWSubUIContainner];
   // 2.在选中的控件上显示标注箭头
    [self createMarkViewWithWusbUI:self.selectedWSubUIContainner];

    
}
- (void)wsubUIDidMove
{
    
    [self.editArrow removeArrow];
    if (self.markArray.count == 0) {
        return;
    }
    [self.mark updateLayout];
    switch (self.selectedWSubUIContainner.belongedWall.direction) {
        case ZEWallLayerDirectionHorizontalUp:
        case ZEWallLayerDirectionHorizontalDown:
        {
            
            [self updateLayoutForHorisonMarkView];
            break;
        }
        
        case ZEWallLayerDirectionVerticalLeft:
        case ZEWallLayerDirectionVerticalRight:
        {
            [self updateLayoutForVerticalMarkView];
            break;
        }

    }
}

#pragma mark - 蓝牙相关

- (void)setupLazer
{
    
    self.centalManager = [[CBCentralManager alloc]initWithDelegate:self queue:nil options:nil];
}
#pragma mark -- CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    NSLog(@"Central Update State");
    
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
            NSLog(@"CBCentralManagerStatePoweredOn");
            [self.centalManager scanForPeripheralsWithServices:nil options:nil];
            
            break;
            
        case CBCentralManagerStatePoweredOff:
        {
            NSLog(@"CBCentralManagerStatePoweredOff");
            [MBProgressHUD showError:@"蓝牙打开失败" toView:self.navigationController.view];
        }
            
            break;
            
        case CBCentralManagerStateUnsupported:
            NSLog(@"CBCentralManagerStateUnsupported");
            break;
            
        default:
            break;
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"Discover name : %@", peripheral.name);
    
    if ([peripheral.name hasPrefix:@"iLDM"]) {
        if (![self.periphals containsObject:peripheral]) {
            
            [self.periphals addObject:peripheral];
        }
        // 当我们查找到Peripheral端时，我们可以停止查找其它设备，以节省电量
        [self.centalManager stopScan];
        [self.centalManager connectPeripheral:peripheral options:nil];
        [SVProgressHUD showWithStatus:@"连接中..."];
        
    }else
    {
        [SVProgressHUD setMinimumDismissTimeInterval:1];
        [SVProgressHUD showErrorWithStatus:@"未找到设备"];
    }
    
    
    
}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"Peripheral Connected");
    if(peripheral.state == CBPeripheralStateConnected)
    {
        [SVProgressHUD showSuccessWithStatus:@"设备已连接"];
    }else{
        
        [SVProgressHUD showSuccessWithStatus:@"设备连接成功"];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.lazerBtn.selected = YES;
        self.lazerBtn.transform = CGAffineTransformTranslate(self.lazerBtn.transform,self.view.width - self.lazerBtn.frame.origin.x - self.lazerBtn.width, 0);
    }];
    peripheral.delegate = self;
    
    [peripheral discoverServices:nil];
}


- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error
{
    [UIView animateWithDuration:0.25 animations:^{
        self.lazerBtn.selected = NO;
        self.lazerBtn.transform = CGAffineTransformIdentity;
    }];
    NSLog(@"已断开连接:%@",error);
    [SVProgressHUD showInfoWithStatus:@"设备已断开连接"];
}
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"连接失败:%@",error);
    [SVProgressHUD showErrorWithStatus:@"连接失败"];
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    NSLog(@"Discover Service");
    
    for (CBService *service in peripheral.services)
    {
        NSLog(@"Discovered service %@", service);
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    NSLog(@"Discover Characteristics");
    
    for (CBCharacteristic *characteristic in service.characteristics)
    {
        NSLog(@"Discovered characteristic %@", characteristic);
        NSLog(@"Reading value for characteristic %@", characteristic);
        NSLog(@"service.uuid:%@",service.UUID.UUIDString);
        [peripheral readValueForCharacteristic:characteristic];
        [peripheral setNotifyValue:YES forCharacteristic:characteristic];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    NSData *data = characteristic.value;
    NSLog(@"characteristic.uuid:%@",characteristic.UUID.UUIDString);
    
    NSLog(@"Data = %@", data);
    
    if (![characteristic.UUID.UUIDString isEqualToString:@"FFF2"]) {
        return;
    }
    NSString *hexStr=@"";
    Byte * testByte = (Byte*)[data bytes];
    for(int i=0;i<[data length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",testByte[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        
    }
    NSLog(@"原始字符串:%@",hexStr);
    
    // 对输出的字符串做处理,只发送关灯后的数据,关灯后的数据长度至少大于12
    if (hexStr.length >= 10) {
        
        NSRange range = NSMakeRange(hexStr.length - 10, 8);
        NSString * valueStr = [hexStr substringWithRange:range];
        NSLog(@"处理后的字符串:%@",valueStr);
        int z = (int)strtol( [valueStr UTF8String], NULL, 16 );
        // 转换为m
        if (z > 0) {
            
            float a = z * 0.001;
            if (a < 40) { // 测得的最小距离
                [self.lengthes addObject:[NSNumber numberWithFloat:a]];
                _lazerValue = a;
                NSLog(@"测得距离:%.3f",a);
                [self updateDistanceWithTestValue:a];
            }
        }
        
    }
    
    if (error)
    {
        NSLog(@"Error changing notification state: %@", [error localizedDescription]);
    }
}


@end
    
