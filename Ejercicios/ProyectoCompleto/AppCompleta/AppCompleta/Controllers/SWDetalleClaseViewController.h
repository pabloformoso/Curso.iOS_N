//
//  SWDetalleClaseViewController.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWClase;
#import <UIKit/UIKit.h>

@interface SWDetalleClaseViewController : UIViewController

@property (nonatomic, strong) SWClase *clase;

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

@end
