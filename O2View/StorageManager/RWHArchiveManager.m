//
//  RWHArchiveManager.m
//  RWHCommonToolKit
//
//  Created by wukexiu on 16/11/10.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import "RWHArchiveManager.h"

/**
 *  归档目录
 */
NSString *const RWHArchivePath = @"_RWHAchive_";

@implementation RWHArchiveManager

static RWHArchiveManager *achiveManager = nil;

+(instancetype)sharedInstance{
    static dispatch_once_t onece;
    dispatch_once(&onece, ^{
        achiveManager = [[self alloc] init];
        BOOL isDirectory = YES;
        if (![[NSFileManager defaultManager] fileExistsAtPath:[achiveManager getArchivePath] isDirectory:&isDirectory]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[achiveManager getArchivePath] withIntermediateDirectories:NO attributes:nil error:nil];
        }
    });
    return achiveManager;
}

-(void)efArchiveObject:(id)data forKey:(NSString *)key{
    if ([NSKeyedArchiver archiveRootObject:data toFile:[self getPathWithKey:key]]) {
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
}

+(void)efArchiveObject:(id)data forKey:(NSString *)key{
    /*
    id tmpData;
    if ([NSJSONSerialization isValidJSONObject:data]) {
        tmpData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    }
     */
    [[RWHArchiveManager sharedInstance] efArchiveObject:data forKey:key];
     
}

-(id)efUnArcheiveForKey:(NSString *)key{
    id result = nil;
    id data = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getPathWithKey:key]];
    /*
    if (data) {
        if ([data isKindOfClass:[NSString class]]) {
            result = data;
        }else{
            result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        }
    }
     */
    
    return data;
}

+(id)efUnArcheiveForKey:(NSString *)key{
    return [[RWHArchiveManager sharedInstance] efUnArcheiveForKey:key];
}


-(NSString *)getPathWithKey:(NSString *)key{
    NSString *path = [self getArchivePath];
    path = [path stringByAppendingPathComponent:key];
    return path;
}

-(NSString *)getArchivePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSString *path = [documentsPath stringByAppendingPathComponent:RWHArchivePath];
    
    return path;
}

@end
