//
//  TRHomeViewController.m
//  LeTao
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeViewController.h"

@interface TRHomeViewController ()

@end

@implementation TRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//实现父类声明的设置请求参数的方法
- (void)settingRequestParams:(NSMutableDictionary *)params {
#warning TODO:city和category是hard code(硬编码)
    params[@"city"] = @"北京";
    params[@"category"] = @"美食";
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
