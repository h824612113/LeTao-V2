//
//  TRCity.h
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCity : NSObject
//按照字典对应的多个key原则声明
/** 城市的名字**/
@property(nonatomic,copy)NSString* name;
/** 城市的全拼**/
@property(nonatomic,copy)NSString* pinYin;
/** 城市对应首字母**/
@property(nonatomic,copy)NSString* pinYinHead;
//**该城市对应的所有区域数组（主区域+子区域） **/
@property(nonatomic,strong)NSArray* regions;

@end
