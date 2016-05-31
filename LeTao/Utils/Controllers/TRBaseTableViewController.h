//
//  TRBaseTableViewController.h
//  LeTao
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRBaseTableViewController : UIViewController

/** 声明tableView属性*/
@property (nonatomic, strong) UITableView *tableView;

//父类声明/调用，由子类实现(设置请求参数)
- (void)settingRequestParams:(NSMutableDictionary *)params;








@end
