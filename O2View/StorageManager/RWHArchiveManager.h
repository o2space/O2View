//
//  RWHArchiveManager.h
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWHArchiveManager : NSObject

+(instancetype)sharedInstance;

/**
 *  归档到Document目录下
 *
 *  @param data 要归档的数据源
 *  @param key  文件名称
 */
-(void)efArchiveObject:(id)data forKey:(NSString *)key;
+(void)efArchiveObject:(id)data forKey:(NSString *)key;

/**
 *  从设备取出数据
 *
 *  @param key 文件名称
 *
 *  @return 数据源
 */
-(id)efUnArcheiveForKey:(NSString *)key;
+(id)efUnArcheiveForKey:(NSString *)key;

@end
