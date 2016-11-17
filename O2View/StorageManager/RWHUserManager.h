//
//  RWHUserManager.h
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWHUserInfo.h"

@interface RWHUserManager : NSObject

+(instancetype)shareInstance;//共享实例
+(void)destroyInstance;//销毁实例

/**
 *  获取用户信息
 *
 *  @return 用户信息
 */
-(RWHUserInfo *)efGetUserInfo;

/**
 *  保存用户信息
 *
 *  @param user 用户信息
 */
-(void)efSaveUserInfo:(RWHUserInfo *)user;

/**
 *  判断用户是否是登录状态
 *
 *  @return 登录状态
 */
- (BOOL)efIsLogin;

/**
 *  登出操作
 */
-(void)efLogout;


@end
