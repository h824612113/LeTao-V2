//
//  TRSortViewController.m
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRSortViewController.h"
#import "TRMetaDataTool.h"
#import "TRSort.h"
@interface TRSortViewController ()


@end
//即限定作用域，又限定是常量
static const CGFloat buttonWidth = 100;//静态常量值
static const CGFloat buttonHeight = 30;
static const CGFloat inset = 20;//上下间隔

@implementation TRSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//数据源
    NSArray *sortsArray = [TRMetaDataTool getAllSorts];
    //循环创建并添加UIButton
    for (int index = 0; index <sortsArray.count; index++) {
        UIButton *button = [UIButton new];
        button.frame =CGRectMake(inset, index*(buttonHeight+inset)+inset, buttonWidth, buttonHeight);
        //设置两个背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:(UIControlStateNormal)];
        //设置上下选中的背景颜色
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:(UIControlStateHighlighted)];
        //设置文本的颜色/字体大小
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateHighlighted)];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        //设置button文本
       TRSort *sort   =     sortsArray[index];
        [button setTitle:sort.label forState:(UIControlStateNormal)];
        //添加
        [self.view addSubview:button];
    }
    //设置view的宽和高
    self.preferredContentSize = CGSizeMake(2*inset+buttonWidth, sortsArray.count*(inset+buttonHeight)+inset);
    
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
