//
//  TRMetaDataTool.h
//  LeTao
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMetaDataTool : NSObject

//返回所有订单数组，给定服务器返回的result(JSON数据)
+ (NSArray *)parseDealsResult:(id)result;
//返回所有排序数组（TRSort）
+(NSArray*)getAllSorts;

//返回所有城市数组（TRCity）
+(NSArray*)getAllCities;
//给定城市的名字，返回该城市的所有区域数组（TRRegion）
+(NSArray*)getRegionsByCityName:(NSString*)cityName;





@end
