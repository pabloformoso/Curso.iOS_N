//
//  SWAlumnosJsonService.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWAlumno.h"
#import "AFNetworking.h"
#import "SWAlumnosJsonService.h"

@interface SWAlumnosJsonService ()

@property (nonatomic,strong) id controller;
@property (nonatomic,strong) NSMutableArray *alumnos;

@end

@implementation SWAlumnosJsonService

- (void)getAlumnosForController:(id)aController {
  #ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
  #endif

  _controller = aController;

  // 1 - Creamos la Request
  NSURL *url = [NSURL URLWithString:@"http://curso.softwhisper.es/stundents.json"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];

  // 2 - Creamos la intancia de AFNetworking para la request y fijamos el serializer
  AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  operation.responseSerializer = [AFJSONResponseSerializer serializer];

  // 3 - Le indicamos que hacer en caso de ejecutarse correctamente o en caso de fallo
  [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    // 4 - Lanzamos el JSON
    [self parseJson:responseObject];
    
    // 5 - Devolvemos los datos a la UI
    if ([_controller respondsToSelector:@selector(updateView:)]) {
      [_controller performSelector:@selector(updateView:) withObject:_alumnos];
    }
    
  #ifndef NDEBUG
    NSLog(@"%s (line:%d) end json", __PRETTY_FUNCTION__, __LINE__);
  #endif
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
  #ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
  #endif
  }];

  //[operation start];

  [[NSOperationQueue mainQueue] addOperation:operation];

  /* Creación de colas de tareas personalizadas
   NSOperationQueue *queue = [[NSOperationQueue alloc] init];
   [queue setName:@"network"];
   [queue setMaxConcurrentOperationCount:2];
   [queue addOperation:operation];
   */
}

// Parseamos el JSON que nos llega
- (void)parseJson:(id)responseObject {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _alumnos = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dic in responseObject) {
    SWAlumno *temp = [[SWAlumno alloc] initWithJSonDictionary:dic];
    [_alumnos addObject:temp];
  }
}


@end
