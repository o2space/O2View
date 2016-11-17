//
//  RWHUserInfo.m
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import "RWHUserInfo.h"

@implementation RWHUserInfo

-(id)copyWithZone:(NSZone *)zone{
    RWHUserInfo *copy = [[[self class] allocWithZone:zone] init];
    copy.uId = [self.uId copyWithZone:zone];
    copy.uToken = [self.uToken copyWithZone:zone];
    copy.name = [self.name copyWithZone:zone];
    copy.password = [self.password copyWithZone:zone];
    return copy;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.uId forKey:@"uId"];
    [aCoder encodeObject:self.uToken forKey:@"uToken"];
    [aCoder encodeObject:self.uToken forKey:@"name"];
    [aCoder encodeObject:self.uToken forKey:@"password"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.uId = [aDecoder decodeObjectForKey:@"uId"];
        self.uToken = [aDecoder decodeObjectForKey:@"uToken"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
    }
    return self;
}
@end
