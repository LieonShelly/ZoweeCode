//
//  ZEServiceRuleViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEServiceRuleViewController.h"

@interface ZEServiceRuleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *contenlabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

@end

@implementation ZEServiceRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}

- (void)initUI
{
    self.titleLabel.textColor = hexColorString(@"2e2e2e");
    self.contenlabel.textColor = hexColorString(@"4c4c4c");
    self.companyLabel.textColor = hexColorString(@"4c4c4c");
    self.websiteLabel.textColor = hexColorString(@"2e2e2e");
    self.contenlabel.font = [UIFont systemFontOfSize:15];
    self.headerLabel.font = [UIFont systemFontOfSize:15];
    self.companyLabel.font = self.contenlabel.font;
    self.websiteLabel.font =self.contenlabel.font;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
