//
//  TRMetaDataTool.m
//  LeTao
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMetaDataTool.h"
#import "TRDeal.h"
#import "TRSort.h"
#import "TRCity.h"
#import "TRRegion.h"
@implementation TRMetaDataTool
static NSArray *_sortsArray = nil;
+(NSArray *)getAllSorts
{
    if (!_sortsArray) {

        _sortsArray = [[self alloc]getAndParseWithPlistFile:@"sorts.plist" withClass:[TRSort class]];
    }
    return _sortsArray;
}

static NSArray *_cityArray = nil;
+(NSArray *)getAllCities{
    if (!_cityArray) {
        _cityArray = [[self alloc]getAndParseWithPlistFile:@"cities.plist" withClass:[TRCity class]];
    }
    return _cityArray;
}

+(NSArray *)getRegionsByCityName:(NSString *)cityName{
    //1.取到所有的城市数组
    //2.从城市数组中循环中找cityName对应的TRCity
     NSArray *cityArray = [self getAllCities];
    for (TRCity *city in cityArray) {
        if ([city.name isEqualToString:cityName]) {
            //city.regions:数组中是字典类型
            /**
             *  调用getArrayWithArray方法，把city.regions数组中的字典转成了TRRegion对象，返回
             */
            return [[self alloc]getArrayWithArray:city.regions withClass:[TRRegion class]];
        }
    }
    return nil;//如果找不到返回nil
}


//前提：从plist文件中读数据；数组嵌套字典的样式
-(NSArray*)getAndParseWithPlistFile:(NSString*)plistFileName withClass:(Class)modeClass{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:plistFileName ofType:nil];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:plistPath];
    NSArray *returnArray = [self getArrayWithArray:plistArray withClass:modeClass];
    return returnArray;

}

-(NSArray*)getArrayWithArray:(NSArray*)array withClass:(Class)modelClass{
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        id model = [modelClass new];
        //KVC转换
        [model setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:model];
    }
    return [mutableArray copy];
}

+ (NSArray *)parseDealsResult:(id)result {
    //取到deals的key对应数组(字典类型)
    NSArray *dealsArray = result[@"deals"];
    //for循环把字典转成TRDeal; 添加到可变数组中；返回
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dealDic in dealsArray) {
        //创建订单对象
        TRDeal *deal = [TRDeal new];
        //KVC转换
        [deal setValuesForKeysWithDictionary:dealDic];
        [mutableArray addObject:deal];
    }
    
    return [mutableArray copy];
}









@end
