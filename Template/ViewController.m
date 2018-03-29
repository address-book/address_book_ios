//
//  ViewController.m
//  Template
//
//  Created by Wasif Qayyum on 11/3/16.
//  Copyright © 2016 Wasif Qayyum. All rights reserved.
//

#import "ViewController.h"
//#import "SVProgressHUD.h"

@interface ViewController () <UIWebViewDelegate>


@end

@implementation ViewController
- (IBAction)back:(id)sender {
    
    [_web_view goBack];
}
- (IBAction)home:(id)sender {
    
    _web_view.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://a.testaddressbook.com"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_web_view loadRequest:requestObj];
   
}
- (IBAction)forward:(id)sender {
    
    [_web_view goForward];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _web_view.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://a.testaddressbook.com"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_web_view loadRequest:requestObj];
     [self addPullToRefreshToWebView];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [SVProgressHUD dismiss];
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    [SVProgressHUD showWithStatus:@"Network Error"];
   
    
}



- (void)addPullToRefreshToWebView{
    UIColor *whiteColor = [UIColor whiteColor];
    UIRefreshControl *refreshController = [UIRefreshControl new];
    NSString *string = @"Pull down to refresh...";
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : whiteColor };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    refreshController.bounds = CGRectMake(0, 0, refreshController.bounds.size.width, refreshController.bounds.size.height);
    refreshController.attributedTitle = attributedString;
    [refreshController addTarget:self action:@selector(refreshWebView:) forControlEvents:UIControlEventValueChanged];
    [refreshController setTintColor:whiteColor];
    [self.web_view.scrollView addSubview:refreshController];
}

- (void)refreshWebView:(UIRefreshControl*)refreshController{
    [self.web_view reload];
    [refreshController endRefreshing];
}


@end
