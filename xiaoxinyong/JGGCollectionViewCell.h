//
//  JGGCollectionViewCell.h
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGGModel.h"


@interface JGGCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)JGGModel *JGGModel;

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *link;
@property(nonatomic,strong)NSString *uid;

@property(nonatomic,strong)UIImageView *chanpintu;
@property(nonatomic,strong)UILabel *cpname;

@end
