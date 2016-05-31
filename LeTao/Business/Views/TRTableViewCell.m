//
//  TRTableViewCell.m
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRTableViewCell.h"

@implementation TRTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedName:(NSString *)selectedName
{
    //
    static NSString *identifier = @"cell";
    TRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TRTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    //cell的两个图片
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:selectedName]];
    
    return cell;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
