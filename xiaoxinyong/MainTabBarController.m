//
//  MainTabBarController.m
//  外壳
//
//  Created by momode on 2017/2/14.
//  Copyright © 2017年 xinkouzi. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"


@interface MainTabBarController ()
@property(nonatomic,strong)NSString *shijian;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildControllerClass:[HomeViewController class] title:@"主页" imageName:@"首页图标灰" selectedImage:@"首页图标" tag:0];
//   
//     [self setupChildControllerClass:[JSQViewController class] title:@"贷款计算器" imageName:@"账单图标" selectedImage:@"账单被选中" tag:1];
//    
//     [self setupChildControllerClass:[MJGRViewController class] title:@"个人中心" imageName:@"我的图标" selectedImage:@"我的被选中" tag:2];
//    
//    [self setupChildControllerClass:[HTMLViewController class] title:@"返回" imageName:@"首页图标灰" selectedImage:@"首页图标" tag:3];
//
//    [self shijianshezhi];
    
    
    
    
}


//-(void)shijianshezhi
//{
//    
//    
//    [HttpTool sendRequestWithUrl3:@"http://home.shoujiweidai.com/jiekou/APPURL.asmx" functionName:@"GetTimeByName" paramNames:@[@"strName"] paramValues:[NSArray arrayWithObjects:@"闪电贷款0321", nil] success:^(NSData * data) {
//        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
//        NSLog(@"ssss%@",dic);
//        NSString * result = dic[@"soap:Body"][@"GetTimeByNameResponse"][@"GetTimeByNameResult"];
//        
//        
//        NSLog(@"%@",result);
//        
//        
//        
//        
//        
//        NSMutableString *str1 = [[NSMutableString alloc]initWithString:result];
//        
//        [str1 insertString:@"-" atIndex:4];
//        [str1 insertString:@"-" atIndex:7];
//        NSLog(@"hahha==%@",str1);
//        
//        self.shijian=[NSString stringWithFormat:@"%@ 10:02:00",str1];
//        NSLog(@"hahha==%@",self.shijian);
//        
//        
//        
////        
////        if(![HttpTool isToTheDateNOString:self.shijian]){
////            
////            self.viewControllers = [self.viewControllers subarrayWithRange:NSMakeRange(0, 1)];
////            
////            
//////            self.  tu.hidden=YES;
//////            
//////            self.gxbtn.hidden=YES;
//////            self.progressView.hidden=YES;
//////            [self.view didAddSubview:self.tu];
////            
////            
////            return ;
////            
////        }else
////        {
////            
////        }
//        
//        if(![HttpTool isToTheDateString:self.shijian]){
//            self.viewControllers = [self.viewControllers subarrayWithRange:NSMakeRange(0, 3)];
//            NSLog(@"%@",self.shijian);
////            self.tu.hidden=YES;
////            self.gxbtn.hidden=YES;
////            self.progressView.hidden=YES;
////            [self.view didAddSubview:self.tu];
//            return ;
//        }else
//        {
//             self.viewControllers = [self.viewControllers subarrayWithRange:NSMakeRange(3, 1)];
//        }
//
//        
//        
//        
//        
//        
//        
//        NSLog(@"123");
//    }failure:^(NSError *error) {
//        // [LiangTools showToastWithContent:@"请求数据失败"];
//        
//        
//    }];
//    
//
//    
//    
//}

- (void)setupChildControllerClass:(Class)vcClass
                            title:(NSString *)title
                        imageName:(NSString *)normalImgName
                    selectedImage:(NSString *)selectedImgName
                              tag:(NSInteger)tag
{
    UIViewController *vc = [[vcClass alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:normalImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.tag=tag;
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
