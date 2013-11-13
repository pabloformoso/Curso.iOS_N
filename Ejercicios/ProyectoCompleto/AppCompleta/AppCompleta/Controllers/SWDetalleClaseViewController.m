//
//  SWDetalleClaseViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWClase.h"
#import "SWDetalleClaseViewController.h"

@interface SWDetalleClaseViewController ()

@end

@implementation SWDetalleClaseViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewDidLoad];
  
  [_nombreLabel setText:_clase.nombre];
  [_descTextView setText:_clase.descripcion];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewWillAppear:animated];
  
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidAppear:animated];
  
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidDisappear:animated];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
