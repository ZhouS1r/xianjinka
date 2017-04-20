//
//  HomeViewController.m
//  xiaoxinyong
//
//  Created by momode on 2017/4/6.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//
static  NSMutableArray *httpUrls ;//全局变量

#import "HomeViewController.h"
#define chanpinqudao @"IOS"
#import "JGGCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,NewPagedFlowViewDelegate, NewPagedFlowViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UIView *heardView;
@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, strong) NewPagedFlowView *pageFlowView;

@property(nonatomic,strong)UICollectionView *collectionView;


@property(nonatomic,strong)NSMutableArray *jjgArraty;



@end

@implementation HomeViewController

-(void)jggshuju
{
    
    [HttpTool sendRequestWithUrl2:jgg functionName:@"Suiji10Product" paramNames:@[@"xuhao"] paramValues:[NSArray arrayWithObjects:@"7", nil] success:^(NSData * data) {
        
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"33333333333%@",dic);
        NSString * result = dic[@"soap:Body"][@"Suiji10ProductResponse"][@"Suiji10ProductResult"];
        NSLog(@"result====%@3123123123",result);
        
        NSDictionary * resutlDic = [HttpTool dictionaryWithJsonString:result];
        NSLog(@"%@",resutlDic);
        
        NSArray *prdListArray = resutlDic[@"prdList"];
        
        NSMutableArray *xsxArray = [NSMutableArray array];
        
        
        
        
        for (NSDictionary *dict  in prdListArray) {
            JGGModel *model = [JGGModel JGGModelWithDict:dict];
            [xsxArray addObject:model];
        }
        
        
        self.jjgArraty = xsxArray;
        
        NSLog(@"%@",self.jjgArraty);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.collectionView reloadData];
        }];
        
        
        
        
        //   NSLog(@"RESPONSE　DATA: %@", jsonData);
        //        NSMutableArray * imageUrls = [NSMutableArray array];
        //        for (NSDictionary * dict in resutData[@"Daohang"]) {
        //            [imageUrls addObject:[NSString stringWithFormat:@"http://www.shoujiweidai.com%@",dict[@"advpath"]]];
        //
        //
        //            //UIImageView *tupian=[UIImageView new];
        //            UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.shoujiweidai.com%@",dict[@"advpath"]]]]];
        //
        //
        //
        //            [self.imageArray addObject:image];
        //        }
        //        NSLog(@"imageurls:%@",self.imageArray);
        //
        //
        //        httpUrls = [NSMutableArray array];
        //
        //        for (NSDictionary *dict in resutData[@"Daohang"]) {
        //
        //            [httpUrls addObject:[NSString stringWithFormat:@"%@",dict[@"link"]]];
        //            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        //
        //                [self.pageFlowView reloadData];
        //            }];
        //
        //        }
        //        //
        //        //
        //        NSLog(@"httpUrls:%@",httpUrls);
        //        //
        //
        //        //     [self viewDidLoad];
        //
        //        [self.pageFlowView reloadData];
        
    }failure:^(NSError *error) {
        
        NSLog(@"error===%@",error);
        //[LiangTools showToastWithContent:@"网络不好,未获取到"];
    }
     
     ];
    
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kWindowW/4+8, kWindowH/7+12);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(13, 13, 13, 13);
}
-(void)suoyoulianjie
{
    
    [HttpTool sendRequestWithUrl2:zhengshijiekou functionName:@"Daohang" paramNames:@[@"channel"] paramValues:[NSArray arrayWithObjects:chanpinqudao, nil] success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"%@",dic);
        NSData *jsonData = [dic[@"soap:Body"][@"DaohangResponse"][@"DaohangResult"] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resutData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];//转换数据格式
        NSLog(@"RESPONSE　DATA: %@", resutData);
        NSMutableArray * tianjia=[NSMutableArray array];
        NSMutableArray * imageUrls = [NSMutableArray array];
        for (NSDictionary * dict in resutData[@"Daohang"]) {
            [imageUrls addObject:[NSString stringWithFormat:@"http://www.shoujiweidai.com%@",dict[@"advpath"]]];
            
            
            //UIImageView *tupian=[UIImageView new];
            UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.shoujiweidai.com%@",dict[@"advpath"]]]]];
            
            
            
            [tianjia addObject:image];
        }
        self.imageArray=tianjia;
        NSLog(@"imageurls:%@",self.imageArray);
        
        
        httpUrls = [NSMutableArray array];
        
        for (NSDictionary *dict in resutData[@"Daohang"]) {
            
            [httpUrls addObject:[NSString stringWithFormat:@"%@",dict[@"link"]]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                [self.pageFlowView reloadData];
            }];
            
        }
        //
        //
        NSLog(@"httpUrls:%@",httpUrls);
        //
        
        //     [self viewDidLoad];
        
        [self.pageFlowView reloadData];
        
    }failure:^(NSError *error) {
        
        NSLog(@"error===%@",error);
        //[LiangTools showToastWithContent:@"网络不好,未获取到"];
    }
     
     ];
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    
    [self suoyoulianjie];
    
    [self jggshuju];
    
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.headerReferenceSize=CGSizeMake(kWindowW, 0);
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH) collectionViewLayout:flowLayout];
        CGFloat jianju=(kWindowW-80)/4;
        //        _collectionView.backgroundColor = [UIColor whiteColor];
        
        flowLayout.itemSize=CGSizeMake(jianju, 80);
        flowLayout.minimumLineSpacing=10;
        flowLayout.minimumInteritemSpacing=10;
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        
        [_collectionView registerClass:[JGGCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        
        
        _collectionView.backgroundColor=[UIColor whiteColor];
        //         _collectionView.autoresizingMask=UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
        
    }
    return _collectionView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.heardView=[UIView new];
    self.heardView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.heardView];
    self.heardView.sd_layout.topSpaceToView(self.view, 0).widthIs(kWindowW).heightIs((kWindowW - 84) * 9 / 16 + 24);
    
    
    //    for (int index = 1; index < 4; index++) {
    //
    //
    //
    //        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"1000%d",index]];
    //        [self.imageArray addObject:image];
    //  }
    
    // [self suoyoulianjie];
    
    
    
    //    [self suoyoulianjie];
    
    NSLog(@"tupianshuzu%@",self.imageArray);
    
    [self.view addSubview:self.collectionView];
    self.collectionView.sd_layout.topSpaceToView(self.heardView,0).widthIs(kWindowW).bottomSpaceToView(self.view,0);
    
    [self chuangjietupian];
    
    
}
-(void)chuangjietupian
{
    // [self suoyoulianjie];
    NewPagedFlowView *pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, (kWindowW - 84) * 9 / 16 + 24)];
    pageFlowView.backgroundColor = [UIColor whiteColor];
    // pageFlowView.pageSize = CGSizeMake(kWindowW, 300);
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.minimumPageAlpha = 0.4;
    pageFlowView.minimumPageScale = 0.85;
    pageFlowView.orginPageCount = self.imageArray.count;
    pageFlowView.isOpenAutoScroll = YES;
    pageFlowView.autoTime=2.7;
    
    
    UIScrollView *bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, (kWindowW - 84) * 9 / 16 + 24)];
    [pageFlowView reloadData];
    [bottomScrollView addSubview:pageFlowView];
    [self.heardView addSubview:bottomScrollView];
    //bottomScrollView.sd_layout.topSpaceToView(self.heardView, 0).widthIs(kWindowW).heightIs(250);
    
    
    [bottomScrollView addSubview:pageFlowView];
    //  pageFlowView.sd_layout.topSpaceToView(bottomScrollView, 0).widthIs(kWindowW).heightIs(250);
    
    
    
    
    self.pageFlowView = pageFlowView;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(kWindowW - 84, (kWindowW - 84) * 9 / 16);
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    
    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
    
    
    NSLog(@"dianjilianjie%@",httpUrls[subIndex]);
    
    H5ViewController *l1= [[H5ViewController alloc]initWithWebURLStr:httpUrls[subIndex]];
    
    [self.navigationController pushViewController:l1 animated:YES];
    
    
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    
    return self.imageArray.count;
}

- (UIView *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    
    PGIndexBannerSubiew *bannerView = (PGIndexBannerSubiew *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] initWithFrame:CGRectMake(0, 0, kWindowW - 84, (kWindowW - 84) * 9 / 16)];
        bannerView.layer.cornerRadius = index;
        bannerView.layer.masksToBounds = YES;
    }
    
    //在这里下载网络图片
    //[bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = self.imageArray[index];
    
    return bannerView;
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
    NSLog(@"TestViewController 滚动到了第%ld页",pageNumber);
}

#pragma mark --懒加载
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

//- (UILabel *)indicateLabel {
//
//    if (_indicateLabel == nil) {
//        _indicateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, Width, 16)];
//        _indicateLabel.textColor = [UIColor blueColor];
//        _indicateLabel.font = [UIFont systemFontOfSize:16.0];
//        _indicateLabel.textAlignment = NSTextAlignmentCenter;
//        _indicateLabel.text = @"指示Label";
//    }
//
//    return _indicateLabel;
//}

#pragma mark --旋转屏幕改变newPageFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        [coordinator animateAlongsideTransition:^(id context) { [self.pageFlowView reloadData]; } completion:NULL];
    }
}

- (void)dealloc {
    
    /****************************
     在dealloc或者返回按钮里停止定时器
     ****************************/
    
    [self.pageFlowView stopTimer];
}






-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.jjgArraty.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JGGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //
    JGGModel * model = self.jjgArraty[indexPath.row];//获取当前这个大cell对应的model
    //
    cell.JGGModel=model;
    //
    [cell sizeToFit];
    //
    //    UIImageView *tupian=[UIImageView new];
    //    tupian.backgroundColor=[UIColor redColor];
    //    [cell.contentView addSubview:tupian];
    //    tupian.sd_layout.topSpaceToView(cell.contentView, 0).bottomSpaceToView(cell.contentView, 0).rightSpaceToView(cell.contentView, 10).leftSpaceToView(cell.contentView, 10);
    
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JGGModel * model = self.jjgArraty[indexPath.row];//获取当前这个大cell对应的model
    NSLog(@"点击了%@",model.name);
    NSLog(@"点击了%@",model.link);
    
    
    H5ViewController *l1= [[H5ViewController alloc]initWithWebURLStr:model.link];
    
    [self.navigationController pushViewController:l1 animated:YES];
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
