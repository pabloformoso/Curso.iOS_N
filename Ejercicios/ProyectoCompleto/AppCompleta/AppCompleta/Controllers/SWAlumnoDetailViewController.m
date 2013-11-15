//
//  SWAlumnoDetailViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estadra. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "SWAlumno.h"
#import "SWAlumnoDetailViewController.h"

@interface SWAlumnoDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation SWAlumnoDetailViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
    [self loadData];
  
    /* Solo acepta protocolos de ficheros
      UIDocumentInteractionController *docCont = 
     [[UIDocumentInteractionController alloc] init];
     [docCont setURL:[NSURL URLWithString:@"psadoc://lalalalala"]];
     [docCont presentPreviewAnimated:YES];
     */
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super didReceiveMemoryWarning];
}


#pragma mark - Métodos privados
- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [_imageView setImageWithURL:[NSURL URLWithString:_alumno.avatarPath]];
  [_nameLabel setText:_alumno.nombre];
  [_emailLabel setText:_alumno.email];
  
}
- (IBAction)openGestorDeFicheros:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSURL *url = [NSURL URLWithString:@"psadoc://es.softwhisper.AppCompleta"];
  
  if([[UIApplication sharedApplication] canOpenURL:url])
    [[UIApplication sharedApplication] openURL:url];
  else
    NSLog(@"Sin app para psadoc://");
}

@end
