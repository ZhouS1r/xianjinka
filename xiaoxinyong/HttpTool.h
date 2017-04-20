//
//  HttpTool.h
//  SSB01
//
//  Created by tarena on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

/**
 *  请求数据
 *
 *  @param url          请求url
 *  @param functionName 方法名
 *  @param paramNames   参数名数组
 *  @param paramValues  参数值数组
 *  @param success      请求成功返回值
 */
+(void)sendRequestWithUrl:(NSString *)url functionName:(NSString*)functionName paramNames:(NSArray *)paramNames paramValues:(NSArray *)paramValues success:(void (^)(NSData * data))success failure:(void (^)(NSError * error))failure;
+(void)sendRequestWithUrl2:(NSString *)url functionName:(NSString*)functionName paramNames:(NSArray *)paramNames paramValues:(NSArray *)paramValues success:(void (^)(NSData * data))success failure:(void (^)(NSError * error))failure;
//获取时间-里面的域名改变
+(void)sendRequestWithUrl3:(NSString *)url functionName:(NSString*)functionName paramNames:(NSArray *)paramNames paramValues:(NSArray *)paramValues success:(void (^)(NSData * data))success failure:(void (^)(NSError * error))failure;


+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
