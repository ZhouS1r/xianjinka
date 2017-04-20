//
//  JGGCollectionViewCell.m
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import "JGGCollectionViewCell.h"
@implementation JGGCollectionViewCell

-(void)setJGGModel:(JGGModel *)JGGModel
{
    _JGGModel=JGGModel;
    NSString *str=JGGModel.logo;
    NSString *yuanurl=qianbufen;
    NSURL *tupianurl=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",yuanurl,str]];
    
     UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:tupianurl]];
    
    [_chanpintu setImage:image];
    _uid=JGGModel.uid;
    _cpname.text=JGGModel.name;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        
        UIImageView *beijingtu=[UIImageView new];
        beijingtu.backgroundColor=[UIColor whiteColor];
        
        [self addSubview:beijingtu];
        
        
        beijingtu.sd_layout.topSpaceToView(self,0).widthIs(self.size.width).heightIs(self.size.height).bottomSpaceToView(self, 5);
        
        self.chanpintu=[UIImageView new];
        self.chanpintu.backgroundColor=[UIColor whiteColor];
        //[self.cptu setImage:[UIImage imageNamed:@"闪银_image"]];
        CGFloat kuan=(kWindowW-80)/4-20;
        [self addSubview:self.chanpintu];
        self.chanpintu.sd_layout.topSpaceToView(self,10).leftSpaceToView(self,10).rightSpaceToView(self,10).bottomSpaceToView(self, 10);
        
        
        
        
        
        
        
        self.cpname=[UILabel new];
        self.cpname.textColor=kRGBColor(50, 50, 50, 1.0);
        self.cpname.font=[UIFont systemFontOfSize:12];
        // self.cpname.text=@"现金贷贷";
        self.cpname.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:self.cpname];
        self.cpname.sd_layout.topSpaceToView(self.chanpintu,0).widthIs(self.size.width).bottomSpaceToView(self,0);
        
        
        
        
        
    }
    
    
    
    
    return self;
}



@end
