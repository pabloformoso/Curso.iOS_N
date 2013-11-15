//
//  SWWebDetailViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "UIWebView+AFNetworking.h"
#import "SWRercurso.h"
#import "SWWebDetailViewController.h"

@interface SWWebDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation SWWebDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSURLRequest *url = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_recurso.link]];
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
  [_webView loadRequest:url progress:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) load req", __PRETTY_FUNCTION__, __LINE__);
#endif
    if (totalBytesExpectedToWrite == totalBytesWritten) {
      [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
  } success:^NSString *(NSHTTPURLResponse *response, NSString *HTML) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) success", __PRETTY_FUNCTION__, __LINE__);
#endif
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    return HTML;
  } failure:^(NSError *error) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) error", __PRETTY_FUNCTION__, __LINE__);
#endif
    [MBProgressHUD hideHUDForView:self.view animated:YES];
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
