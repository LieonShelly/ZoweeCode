//
//  writeTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface writeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (assign ,nonatomic) BOOL isNeed;

@end
