//
//  TRSort.h
//  LeTao
//
//  Created by 韩浩 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRSort : NSObject
/** 排序对应的文本**/
@property(nonatomic,copy)NSString* label;
//**排序所对应的值 **/
@property(nonatomic,strong)NSNumber* value;
@end
