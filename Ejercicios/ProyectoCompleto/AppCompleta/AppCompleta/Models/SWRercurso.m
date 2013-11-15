//
//  SWRercurso.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWRercurso.h"

@implementation SWRercurso

/*
 {
 "id":1,
 "link":"http://pabloformoso.com",
 "name":"Pablo",
 "description":"Blog Pablo formos  estrada",
 "image_url": "http:...."
}
 */
- (id)initWithJSonDictionary:(NSDictionary *)dic {
  self = [super init];
  
  if (self) {
    _recursoId = [[dic valueForKey:@"id"] integerValue];
    _nombre = [dic objectForKey:@"name"];
    _link = [dic objectForKey:@"link"];
    _descripcion = [dic objectForKey:@"description"];
    _photo_url = @"";
  }
  
  return self;
}

@end
