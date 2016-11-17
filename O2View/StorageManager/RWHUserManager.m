//
//  RWHUserManager.m
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import "RWHUserManager.h"
#import "RWHArchiveManager.h"

NSString *const RWHArchiveUserInfoKey = @"user.archiver";

@interface RWHUserManager()

@property (nonatomic,strong)RWHUserInfo *user;

@end

@implementation RWHUserManager

static RWHUserManager*  userManager = nil;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        userManager =  [[self alloc] init];
    });
    return userManager;
}

+(void)destroyInstance
{
    if (nil != userManager) {
        userManager = nil;
    }
}

-(RWHUserInfo *)efGetUserInfo{
    RWHUserInfo *userInfo = [RWHUserManager shareInstance].user;
    if (!userInfo) {
        userInfo = [RWHArchiveManager efUnArcheiveForKey:RWHArchiveUserInfoKey];
        self.user = userInfo;
    }
    return userInfo;
}

-(void)efSaveUserInfo:(RWHUserInfo *)user{
    self.user = user;
    [RWHArchiveManager efArchiveObject:user forKey:RWHArchiveUserInfoKey];
}

/*
 *@method  efIsLogin
 *@abstract 判断是否已登录
 *@discussion 程序启动时，需调用此方法，判断是否已登录。
 */
-(BOOL)efIsLogin{
    if(!self.user){
        [[RWHUserManager shareInstance] efGetUserInfo];
    }
    return self.user.uId!=nil && self.user.uToken!=nil;
}

/**
 *  登出操作
 */
-(void)efLogout{
    self.user = nil;
    [RWHArchiveManager efArchiveObject:nil forKey:RWHArchiveUserInfoKey];
}

@end
