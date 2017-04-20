//
//  H5ViewController.m
//  xiaoxinyong
//
//  Created by ZhouSir on 2017/4/18.
//  Copyright © 2017年 xiaoxinyong. All rights reserved.
//

#import "H5ViewController.h"
#import "WYWebProgressLayer.h"


@interface H5ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation H5ViewController
{
    
    
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _webView.backgroundColor=[UIColor whiteColor];
        _webView.delegate =self;
        [self.view addSubview:_webView];
        _webView.sd_layout.topSpaceToView(self.view,64).widthIs(kWindowW).bottomSpaceToView(self.view, 0);
    }
    return _webView;
}

-(instancetype)initWithWebURLStr:(NSString *)WebURLStr
{
    if (self = [super init]) {
        self.WebURLStr = WebURLStr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"现金贷";
    self.view.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:self.webView];

    _progressLayer = [WYWebProgressLayer new];
    _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
    
    //设置webview代理,跟踪加载请求,
    self.webView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //网页内容缩小到适应整个设备屏幕
    self.webView.scalesPageToFit = YES;
    
    //检测网页中的各种特殊的字符串 比如:电话,网址,能自动识别,在用户长按时,从底部弹出菜单操作
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;//全部都识别
    NSURL *webURL = [NSURL URLWithString:self.WebURLStr];
    [self.webView loadRequest:[NSURLRequest requestWithURL:webURL]];

    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_progressLayer finishedLoad];
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_progressLayer finishedLoad];
}

- (void)dealloc {
    
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
    NSLog(@"i am dealloc");
    //[LiangTools showToastWithContent:@"换个有网的姿势吧"];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;

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
