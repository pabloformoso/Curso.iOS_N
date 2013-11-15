//
//  SWWebDetailViewController.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWRercurso;
#import <UIKit/UIKit.h>

@interface SWWebDetailViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) SWRercurso *recurso;

@end
