//
//  SWAlumno.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWAlumno.h"

@implementation SWAlumno

- (id)initWithJSonDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [super init];
  
  if (self) {
    _alumnoId = [[dic objectForKey:@"id"] integerValue];
    _nombre = [dic objectForKey:@"name"];
    _apellidos = [dic objectForKey:@"lastname"];
    _ciudad = [dic objectForKey:@"city"];
    _email = [dic objectForKey:@"email"];
    _avatarPath = [@"http://curso.softwhisper.es" stringByAppendingString:[dic objectForKey:@"image_url"]];    
  }
  
  return self;
}

@end
