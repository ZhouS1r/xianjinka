//
//  H5ViewController.h
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface H5ViewController : UIViewController
-(instancetype)initWithWebURLStr:(NSString *)WebURLStr;

@property(nonatomic,copy)NSString *WebURLStr;



@end
