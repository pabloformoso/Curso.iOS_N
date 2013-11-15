//
//  SWAgreagarRecursoViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWRercurso.h"
#import "SWPostUrlService.h"
#import "SWAgreagarRecursoViewController.h"

@interface SWAgreagarRecursoViewController ()

@end

@implementation SWAgreagarRecursoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillAppear:animated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardUp)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardHidden)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIKeyboardWillShowNotification
                                                object:nil];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIKeyboardWillHideNotification
                                                object:nil];
  
  [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([textField isEqual:_nombreTextField]) {
    [_urlTextField becomeFirstResponder];
  } else if ([textField isEqual:_urlTextField]) {
    [_descTextField becomeFirstResponder];
  } else {
    [textField resignFirstResponder];
    [self save:nil];
  }
  
  return YES;
}

#pragma mark - IBActions & Services
- (IBAction)save:(id)sender {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  SWRercurso *res = [[SWRercurso alloc] init];
  res.nombre = _nombreTextField.text;
  res.descripcion = _descTextField.text;
  res.link = _urlTextField.text;
  
  SWPostUrlService *ws = [[SWPostUrlService alloc] init];
  [ws postRescurso:res FromController:self];
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)updateView:(NSString *)status {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
  
  if ([status isEqualToString:@"OK"]) {
    [self.navigationController popToRootViewControllerAnimated:YES];
  } else {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"no se ha podido crear"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
  }
  
}

#pragma mark - Keyboard Methods
- (void)keyboardUp {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
}

- (void)keyboardHidden {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
}

@end
