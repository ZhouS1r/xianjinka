//
//  JGGModel.h
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGGModel : NSObject

@property(strong,nonatomic)NSString *demand1;
@property(strong,nonatomic)NSString *demand2;
@property(strong,nonatomic)NSString *difficulty;
@property(strong,nonatomic)NSString *lines;
@property(strong,nonatomic)NSString *link;
@property(strong,nonatomic)NSString *logo;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *orderpm;
@property(strong,nonatomic)NSString *rate;
@property(strong,nonatomic)NSString *speed;
@property(strong,nonatomic)NSString *summary;
@property(strong,nonatomic)NSString *timeLimit;
@property(strong,nonatomic)NSString *tips1;
@property(strong,nonatomic)NSString *tips2;
@property(strong,nonatomic)NSString *uid;

+ (JGGModel *)JGGModelWithDict:(NSDictionary *)dict;

@end
