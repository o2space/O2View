//
//  RWHUserInfo.h
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWHUserInfo : NSObject<NSCoding,NSCopying>

@property (nonatomic, copy) NSString *uId;
@property (nonatomic, copy) NSString *uToken;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *password;

@end
