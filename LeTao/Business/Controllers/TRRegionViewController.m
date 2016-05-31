//
//  TRRegionViewController.m
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRRegionViewController.h"
#import "TRMetaDataTool.h"
#import "TRMetaDataView.h"
#import "TRRegion.h"
#import "TRTableViewCell.h"
@interface TRRegionViewController ()<UITableViewDataSource,UITableViewDelegate>
//记录某个城市的所有区域数据
@property(nonatomic,strong)NSArray *regionArray;
@property(nonatomic,strong)TRMetaDataView *metaDataView;
@end

@implementation TRRegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //修改当前控制器的大小
    self.preferredContentSize = CGSizeMake(200, 400);
   self.regionArray =    [TRMetaDataTool getRegionsByCityName:@"北京"];
    //实例化并添加自定义的视图
    [self addMetaDataView];
}

#pragma mark --------和界面相关的方法
-(void)addMetaDataView{
    //添加
    self.metaDataView = [[[NSBundle mainBundle]loadNibNamed:@"TRMetaDataView" owner:self options:nil]firstObject];
    self.metaDataView.frame = self.view.bounds;
    //设置tableview属性
    self.metaDataView.mainTableView.dataSource    = self;
    _metaDataView.mainTableView.delegate        = self;
    _metaDataView.subTabView.dataSource        = self;
    _metaDataView.subTabView.delegate            = self;
    [self.view addSubview:self.metaDataView];

}
#pragma mark-------UITableView相关协议

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //如果是左边的表视图
    if(tableView == self.metaDataView.mainTableView){
        return self.regionArray.count;
    }else{
        //右边的表视图
        //获取左边用户点击的行号（行号和数组下标一一对应）
   NSInteger selectedRow =   [_metaDataView.mainTableView indexPathForSelectedRow].row;
        //取出选中行对应的TRRegion
        TRRegion *region = self.regionArray[selectedRow];
        return region.subregions.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==self.metaDataView.mainTableView) {
        //左表视图
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedName:@"bg_dropdown_left_selected"];
        TRRegion *region = self.regionArray[indexPath.row];
        cell.textLabel.text =region.name;
        return cell;
    }else {
        //右表视图
       TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedName:@"bg_dropdown_left_selected"];
        NSInteger selectedRow = [_metaDataView.mainTableView indexPathForSelectedRow].row;
        TRRegion *region = self.regionArray[selectedRow];
            cell.textLabel.text =region.subregions[indexPath.row];

            return cell;

    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView ==self.metaDataView.mainTableView) {
        [_metaDataView.subTabView reloadData];
    }
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
