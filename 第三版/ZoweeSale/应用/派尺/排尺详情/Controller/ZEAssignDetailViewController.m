//
//  ZEAssignDetailViewController.m
//  ZoweeSale
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#define maxWeeksCountPerMonth 6
#define anmateDuration 1
#define consntantFoldTop 85
#import "ZEAssignDetailViewController.h"
#import "ZECalendar.h"
#import "ZEassignDetTableView.h"
#import "ZESendRulerTaskParam.h"
#import "ApplicationManage.h"
#import "ZESendRulerTask.h"
#import "ZESendRulerTableViewCell.h"
#import "ZESendRulerTasView.h"
#import "ZEArrangMentViewController.h"

@interface ZEAssignDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *_eventsByDate;
    
    NSDate *_todayDate;
    NSDate *_minDate;
    NSDate *_maxDate;
    
    NSDate *_dateSelected;
    
    CGFloat _contantHeight;
    BOOL _isFold;
}

@property (nonatomic,strong) ZECalendar * calendar;
@property (weak, nonatomic) IBOutlet ZESendRulerTasView *taskStatusView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *taskViewTopContraint;

@property (weak, nonatomic) IBOutlet ZEassignDetTableView *tableView;
@property (nonatomic,strong) ZESendRulerTaskResult * result;
@property (nonatomic,strong) ZESendRulerTaskParam * param ;
@property (nonatomic,strong) NSMutableArray * eventsArray;

@end

@implementation ZEAssignDetailViewController





#pragma mark - 系统方法
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化日历
    [self initCalendar];
    
    // 初始化其他UI
    [self setupOtherUI];
    
    [self addNotionfication];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    // 获取数据
    [self loadData];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)didGoTodayTouch
{
    
    [_calendarManager setDate:_todayDate];
    _dateSelected = _todayDate;
    [self loadData];
    
}

- (IBAction)didChangeModeTouch
{
    _calendarManager.settings.weekModeEnabled = !_calendarManager.settings.weekModeEnabled;
    [_calendarManager reload];
    
    CGFloat newHeight = 250;
    if(_calendarManager.settings.weekModeEnabled){
        newHeight = 85.;
    }
    
    self.calendarContentViewHeight.constant = newHeight;
    [self.view layoutIfNeeded];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(!self){
        return nil;
    }
    
    self.title = @"Custom";
    
    return self;
}


#pragma mark - getter

- (NSMutableArray *)eventsArray
{
    if (_eventsArray == nil) {
        _eventsArray = [NSMutableArray array];
    }
    return _eventsArray;
}
- (ZESendRulerTaskResult *)result
{
    if (_result == nil) {
        _result = [[ZESendRulerTaskResult alloc]init];
    }
    return _result;
}

- (ZESendRulerTaskParam *)param
{
    if (_param == nil) {
        _param = [[ZESendRulerTaskParam alloc]init];
        
    }
    return _param;
}
#pragma mark -selfMethod

- (void)addNotionfication
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(emptyTableViewDidCilckBtn) name:@"emptyTableViewDidCilckBtn" object:nil];
}

- (void)emptyTableViewDidCilckBtn
{
    [self rightBtnClick];
}
- (void)setupOtherUI
{
    self.view.backgroundColor = hexColorString(@"f5f2f2");
    self.tableView.allowsSelection = NO;
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn setTintColor:[UIColor blackColor]];
    btn.size = CGSizeMake(50, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtnClick)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.taskViewTopContraint.constant = self.calendarContentViewHeight.constant;
}
- (void)initCalendar
{
    _todayDate = [NSDate date];
    _calendarManager = [JTCalendarManager new];
    _calendarManager.delegate = self;
   
    _calendarMenuView.contentRatio = .75;
    _calendarManager.settings.weekDayFormat = JTCalendarWeekDayFormatSingle;
    _calendarManager.dateHelper.calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:_todayDate];
    _dateSelected = _todayDate;
    _contantHeight = self.calendarContentViewHeight.constant;
    [self settableViewInit];

}

- (void)loadData
{
    // 加载当天的量尺情况
    NSDateFormatter * dateformater = [[NSDateFormatter alloc]init];
    dateformater.dateFormat = @"yyy-MM-dd hh:mm:ss";
     self.param.NowTime =  [dateformater stringFromDate:_dateSelected];

    __weak typeof(self) weakSelf = self;
   [ApplicationManage sendRulerTaskLisWithParma:self.param success:^(ZESendRulerTaskResult *result) {
  
       weakSelf.result = result;
       weakSelf.taskStatusView.result = result;
       [weakSelf.tableView reloadData];
       
   } failure:^(THNetWorkError *error) {
       NSLog(@"%@",error);
   }];
    
    
    // 加载当月的事件
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
   
    paramDict[@"Year"] = [self.param.NowTime substringWithRange:NSMakeRange(0, 4)];
    paramDict[@"Month"] = [self.param.NowTime substringWithRange:NSMakeRange(5, 2)];
   
    [[THNetWork sharedInstance]accessServerWithUIViewController:self WithAction:@"GetCircleTaskDate" WithParam:paramDict WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        NSString * eventsDay = dataDic[@"ReturnParList"][@"Day"];
        // 去掉逗号
        NSString * str = [eventsDay stringByReplacingOccurrencesOfString:@"," withString:@""];
       
        // 每两位取一天
        for(NSInteger i = 0;i<str.length;i += 2)
        {
            NSString *dayStr = [str substringWithRange:NSMakeRange(i, 2)];
            //需要转换的字符串
            NSString *dateString =[NSString stringWithFormat:@"%@-%@-%@",paramDict[@"Year"],paramDict[@"Month"],dayStr];
            NSLog(@"dateString--%@",dateString);
            //设置转换格式
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
            [formatter setDateFormat:@"yyyy-MM-dd"];
            //NSString转NSDate
            NSDate *date=[formatter dateFromString:dateString];
            [weakSelf.eventsArray addObject:date];
        }
        // 创建有事件的日子
        [weakSelf createCalendarEvents:weakSelf.eventsArray];
        [weakSelf.calendarManager reload];
        
            [self updateTaskViewTopContraintWith:_calendarManager];
    }];
}

- (void)settableViewInit{
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSString *point =[NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        CGFloat height = -[self scrollHeightWith:point];
        CGFloat newHeight;
        if (height>50) {
            if (_calendarManager.settings.weekModeEnabled) {
                _calendarManager.settings.weekModeEnabled = NO;
                [_calendarManager reload];
                newHeight = _contantHeight;
                [UIView animateWithDuration:0.4 animations:^{
                    self.calendarContentViewHeight.constant = newHeight;
                    [self updateTaskViewTopContraintWith:_calendarManager];
                   
                    [self.view layoutIfNeeded];
                }completion:^(BOOL finished) {
                    
                }];
            }
        }else if (height<-50){
            if (!_calendarManager.settings.weekModeEnabled) {
                newHeight = 85;
                _calendarManager.settings.weekModeEnabled = YES;
                [_calendarManager reload];
                [UIView animateWithDuration:0.5 animations:^{
                    self.calendarContentViewHeight.constant = newHeight;
                    
                    self.taskViewTopContraint.constant = self.calendarContentViewHeight.constant;
                   
                    [self.view layoutIfNeeded];
                } completion:^(BOOL finished) {
                    
                }];
            }
        }

    }
}

- (CGFloat)scrollHeightWith:(NSString *)point{
    NSArray *array = [point componentsSeparatedByString:@","];
    NSString *heightStr = array.lastObject;
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@")" withString:@""];
    return [heightStr floatValue];
}


#pragma mark - Events

- (void)rightBtnClick
{
    ZEArrangMentViewController *controler = [[ZEArrangMentViewController alloc]init];
    controler.tablement.MeasureDate = [[self dateFormatter] stringFromDate:_dateSelected];
    controler.time = ^(NSString* dateStr){
        _dateSelected = [[self dateFormatter] dateFromString:dateStr];
        [self.calendarManager setDate:_dateSelected];
        
    };
    
    [self.navigationController pushViewController:controler animated:YES];
 
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.result.TaskList.count);
    return self.result.TaskList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZESendRulerTask * task = self.result.TaskList[indexPath.row];
    ZESendRulerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZESendRulerTableViewCell"];
    if (cell == nil) {
        cell = [[ZESendRulerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZESendRulerTableViewCell"];
        
    }
    cell.task = task;
    return cell;
}


#pragma mark - UITableViewDelegate

-  (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  88;
}
#pragma mark - CalendarManager delegate

- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(JTCalendarDayView *)dayView
{
    dayView.hidden = NO;
    
    // Other month
    if([dayView isFromAnotherMonth]){
        dayView.hidden = YES;
    }
   
  // Today
   else if([_calendarManager.dateHelper date:_todayDate  isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = hexColorString(@"fa5e5e");
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    
    // Selected date
    else if(_dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor orangeColor];
            dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Another day of the current month
    else{
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = hexColorString(@"2e2e2e");
    }
    
    if([self haveEventForDay:dayView.date]){
        dayView.dotView.hidden = NO;
    }
    else{
        dayView.dotView.hidden = YES;
    }
    dayView.textLabel.font = [UIFont systemFontOfSize:12];
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(JTCalendarDayView *)dayView
{
    _dateSelected = dayView.date;
    
    [self loadData];
    
    // Animation for the circleView
    dayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView duration:.3 options:0 animations:^{
        dayView.circleView.transform = CGAffineTransformIdentity;
                        } completion:^(BOOL finished) {
                            
                            [_calendarManager reload];
                        }];
    if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        if([_calendarContentView.date compare:dayView.date] == NSOrderedAscending){
            [_calendarContentView loadNextPageWithAnimation];
        }
        else{
            [_calendarContentView loadPreviousPageWithAnimation];
        }
    }
  
    [self updateTaskViewTopContraintWith:calendar];
    NSLog(@"%f",self.taskViewTopContraint.constant);
}

- (void)calendarDidLoadNextPage:(JTCalendarManager *)calendar
{
    [self updateTaskViewTopContraintWith:calendar];
    
}

- (void)calendarDidLoadPreviousPage:(JTCalendarManager *)calendar
{
    
    [self updateTaskViewTopContraintWith:calendar];
   
    
}

- (void)updateTaskViewTopContraintWith:(JTCalendarManager*)calendar
{
    NSInteger i  = [calendar.dateHelper numberOfWeeks:calendar.date];
    [UIView animateWithDuration:anmateDuration animations:^{
    
    self.taskViewTopContraint.constant = i * self.calendarContentViewHeight.constant / maxWeeksCountPerMonth ;
    
        [self.view layoutIfNeeded];
    }];
}


#pragma mark - Views customization

- (UIView *)calendarBuildMenuItemView:(JTCalendarManager *)calendar
{
    UILabel *label = [UILabel new];
    
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = hexColorString(@"2e2e2e");
    return label;
}

- (void)calendar:(JTCalendarManager *)calendar prepareMenuItemView:(UILabel *)menuItemView date:(NSDate *)date
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyy年MM月";
        
        dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
        dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    }
    
    menuItemView.text = [dateFormatter stringFromDate:date];
}

- (UIView<JTCalendarWeekDay> *)calendarBuildWeekDayView:(JTCalendarManager *)calendar
{
    JTCalendarWeekDayView *view = [JTCalendarWeekDayView new];
    
    for(UILabel *label in view.dayViews){
        label.textColor = hexColorString(@"2e2e2e");
        label.font = [UIFont  systemFontOfSize:12];
        
    }
    
    return view;
}




- (NSDate*)selectedDateInCurrentMonth:(NSDate*)currentDate withPreDate:(NSDate*)preDate
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
    }
    // 1.找到上一次Date中的day
    NSString * dayStr = [dateFormatter stringFromDate:preDate];
    NSString *tempStr =  [dayStr substringFromIndex:dayStr.length -1 ];
    // 2.找到本月
    NSString * currentDateStr = [dateFormatter stringFromDate:currentDate];
    NSString * monthStr = [currentDateStr substringToIndex:currentDateStr.length - 1];
    // 3.拼接
    NSString * currentDayStr = [monthStr stringByAppendingString:tempStr];
    NSDate * currentDay = [dateFormatter dateFromString:currentDayStr];
    NSLog(@"-----%@",currentDayStr);
    return currentDay;
}

// Used only to have a key for _eventsByDate
- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
    }
    
    return dateFormatter;
}

- (BOOL)haveEventForDay:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(_eventsByDate[key] && [_eventsByDate[key] count] > 0){
        
        return YES;
    }
    
    return NO;
    
}

- (void)createCalendarEvents:(NSArray *)events
{
    _eventsByDate = [NSMutableDictionary new];
    for(int i = 0; i < events.count; ++i){
        
        
        NSDate *randomDate = events[i];
        
        // Use the date as key for eventsByDate
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if(!_eventsByDate[key]){
            _eventsByDate[key] = [NSMutableArray new];
        }
        
        [_eventsByDate[key] addObject:randomDate];
    }
 
}

- (NSDate*)localTimeWithStandardDate:(NSDate*)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * localTime = [date dateByAddingTimeInterval:interval];
    return localTime;
}

@end
