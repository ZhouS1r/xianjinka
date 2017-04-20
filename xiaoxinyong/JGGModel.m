//
//  JGGModel.m
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import "JGGModel.h"

@implementation JGGModel
+ (JGGModel *)JGGModelWithDict:(NSDictionary *)dict;
{
    JGGModel *model=[JGGModel new];
    
    return [model modelWithDict:dict];
    
    
}
-(JGGModel *)modelWithDict:(NSDictionary *)dict
{
    
    self.demand1=dict[@"demand1"];
    self.demand2=dict[@"demand2"];
    self.difficulty=dict[@"difficulty"];
    self.lines=dict[@"lines"];
    self.link=dict[@"link"];
    self.logo=dict[@"logo"];
    self.name=dict[@"name"];
    self.orderpm=dict[@"orderpm"];
    self.rate=dict[@"rate"];
    self.speed=dict[@"speed"];
    self.summary=dict[@"summary"];
    self.timeLimit=dict[@"timeLimit"];
    self.tips1=dict[@"tips1"];
    self.tips2=dict[@"tips2"];
    self.uid=dict[@"uid"];

    
    return self;
}


@end
