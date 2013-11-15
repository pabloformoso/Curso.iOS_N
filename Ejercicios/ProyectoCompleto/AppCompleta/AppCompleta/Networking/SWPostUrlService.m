//
//  SWPostUrlService.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
// EJEMPLO DE POST CON AFNetworking
/* 
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  NSDictionary *parameters = @{@"foo": @"bar"};
  [manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
 */
#import "SWRercurso.h"
#import "AFNetworking.h"
#import "SWPostUrlService.h"

@interface SWPostUrlService ()
@property (nonatomic, strong) id controller;
@end

@implementation SWPostUrlService

- (void)postRescurso:(SWRercurso *)rec FromController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  NSDictionary *parameters = @{
                               @"resource[name]": rec.nombre,
                               @"resource[description]": rec.descripcion,
                               @"resource[link]": rec.link
                               };
  
  [manager POST:@"http://curso.softwhisper.es/resources.json"
     parameters:parameters
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
          
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
          
          if ([_controller respondsToSelector:@selector(updateView:)]) {
            [_controller performSelectorInBackground:@selector(updateView:) withObject:@"OK"];
          }
          
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    if ([_controller respondsToSelector:@selector(updateView:)]) {
      [_controller performSelectorInBackground:@selector(updateView:) withObject:@"KO"];
    }
  }];
  
}

@end
