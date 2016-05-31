//
//  TRBusinessViewController.m
//  LeTao
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRBusinessViewController.h"
#import "TRBusinessHeaderView.h"
#import "UIView+Extension.h"
#import "TRSortViewController.h"
#import "TRCategoryViewController.h"
#import "TRRegionViewController.h"

@interface TRBusinessViewController ()<UIPopoverPresentationControllerDelegate>
/**
 *  头部视图属性
 */
@property(nonatomic,strong)TRBusinessHeaderView *headerView;


/**
*  排序控制器
*/
@property(nonatomic,strong)TRSortViewController *sortViewController;

@property(nonatomic,strong)TRCategoryViewController *categoryViewController;
@property(nonatomic,strong)TRRegionViewController *regionViewController;

@end

@implementation TRBusinessViewController

/**原因：商家控制器持有排序控制器对象，在整个程序生命周期只有一个排序控制器对象
 */
-(TRSortViewController *)sortViewController
{
    if (!_sortViewController) {
        _sortViewController = [TRSortViewController new];
    }
    return _sortViewController;
}
-(TRCategoryViewController *)categoryViewController
{
    if (!_categoryViewController) {
        _categoryViewController = [TRCategoryViewController new];
    }
    return _categoryViewController;
}

-(TRRegionViewController *)regionViewController
{
    if (!_regionViewController) {
        _regionViewController = [TRRegionViewController new];
    }
    return _regionViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建并添加自定义的头部视图
    [self setUpHeaderView];
    
    //为头部视图的是三个按钮分别添加事件
    [self addTargetsForButton];
    
    
}

#pragma mark-----和界面相关的方法
-(void)addTargetsForButton{
    //未排序按钮添加的action
    [self.headerView.sortButton addTarget:self action:@selector(clickSortButton) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [self.headerView.categoryButton addTarget:self action:@selector(clickCategoryButton) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headerView.regionButton addTarget:self action:@selector(clickRegionButton) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
}



#pragma mark -- 和界面相关的方法
- (void)setUpHeaderView {
    //1.实例化xib文件的视图对象
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"TRBusinessHeaderView" owner:self options:nil] firstObject];
    self.headerView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50);
    //2.添加到view上
    [self.view addSubview:self.headerView];
    //3.修改父类的tableView属性的y值(第三方库)
    self.tableView.y = 50;
//    CGRect frame = self.tableView.frame;
//    frame.origin.y = 50;
//    self.tableView.frame = frame;
    
}







#pragma  mark -----按钮的触发方法
-(void)clickSortButton{
    //1.获取要弹出控制器
    //2.设置一些属性（指定显示那个控件；指定具体显示在哪；箭头的方向）
        self.sortViewController.modalPresentationStyle = UIModalPresentationPopover;//带anchor锚点的样式
    //指向相对显示区域
    self.sortViewController.popoverPresentationController.sourceView = self.headerView.sortButton;
    //指定相对于排序button具体的位置
    self.sortViewController.popoverPresentationController.sourceRect = self.headerView.sortButton.bounds;
    //箭头的显示方向(默认指定Any枚举值：自动找最优的方向)
    self.sortViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    
    self.sortViewController.popoverPresentationController.delegate = self;
    //3.显示弹出控制器
    [self presentViewController:self.sortViewController animated:YES completion:nil];
}


-(void)clickCategoryButton{
    //1.获取要弹出控制器
    //2.设置一些属性（指定显示那个控件；指定具体显示在哪；箭头的方向）
    self.categoryViewController.modalPresentationStyle = UIModalPresentationPopover;//带anchor锚点的样式
    //指向相对显示区域
    self.categoryViewController.popoverPresentationController.sourceView = self.headerView.categoryButton;
    //指定相对于排序button具体的位置
    self.categoryViewController.popoverPresentationController.sourceRect = self.headerView.categoryButton.bounds;
    //箭头的显示方向(默认指定Any枚举值：自动找最优的方向)
    self.categoryViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    
    self.categoryViewController.popoverPresentationController.delegate = self;
    //3.显示弹出控制器
    [self presentViewController:self.categoryViewController animated:YES completion:nil];
}


-(void)clickRegionButton{
    //1.获取要弹出控制器
    //2.设置一些属性（指定显示那个控件；指定具体显示在哪；箭头的方向）
    self.regionViewController.modalPresentationStyle = UIModalPresentationPopover;//带anchor锚点的样式
    //指向相对显示区域
    self.regionViewController.popoverPresentationController.sourceView = self.headerView.regionButton;
    //指定相对于排序button具体的位置
    self.regionViewController.popoverPresentationController.sourceRect = self.headerView.regionButton.bounds;
    //箭头的显示方向(默认指定Any枚举值：自动找最优的方向)
    self.regionViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    self.regionViewController.popoverPresentationController.delegate = self;
    //3.显示弹出控制器
    [self presentViewController:self.regionViewController animated:YES completion:nil];
}





#pragma mark  ----------UIPresentationDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}






- (void)settingRequestParams:(NSMutableDictionary *)params {
#warning TODO: 硬编码
    //city+category+region+sort
    params[@"city"]     = @"北京";
    params[@"category"] = @"美食";
    params[@"region"]   = @"西城区";
    params[@"sort"]     = @2;//最低价格优先
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
