//
//  TRCategoryViewController.m
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRCategoryViewController.h"

@interface TRCategoryViewController ()

@end

@implementation TRCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //修改当前控制器的大小
    self.preferredContentSize = CGSizeMake(100, 300);
    
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
