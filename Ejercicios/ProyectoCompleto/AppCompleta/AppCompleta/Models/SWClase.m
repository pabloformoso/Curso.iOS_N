//
//  SWClase.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//


#import "SWClase.h"

@implementation SWClase

/*
 *  Crea una instacia del objeto desde el diccionario creado.
 */
- (id)initFromDBDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [super init];
  
  if (self) {
    _claseId = [[dic valueForKey:@"id"] integerValue];
    _nombre = [dic objectForKey:@"nombre"];
    _descripcion = [dic objectForKey:@"descripcion"];
    
    // NSDateFormatter se usa para hacer parsing de fechas
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    _fecha_inicio = [formatter dateFromString:[dic objectForKey:@"inicio"]];
    _fecha_fin = [formatter dateFromString:[dic objectForKey:@"fin"]];
  }
  
  return self;
}

- (id)initWithJsonDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [super init];
  
  if (self) {
    _claseId = [[dic valueForKey:@"id"] integerValue];
    _nombre = [dic objectForKey:@"name"];
    _descripcion = [dic objectForKey:@"description"];
    _fecha_inicio = [NSDate date]; //Transformar la fecha con el string
    _fecha_fin = [NSDate date];   // de la hora que viene en el dic
  }
  
  return self;
}

- (id)initWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  self = [[SWClase alloc] init];
  
  if (self) {
    _claseId = [coder decodeIntForKey:@"clase_id"];
    _nombre = [coder decodeObjectForKey:@"nombre"];
    _descripcion = [coder decodeObjectForKey:@"descripcion"];
    _fecha_inicio = [coder decodeObjectForKey:@"fecha_inicio"];
    _fecha_fin = [coder decodeObjectForKey:@"fecha_fin"];
  }
  
  return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  
  [coder encodeInt:_claseId forKey:@"clase_id"];
  [coder encodeObject:_nombre forKey:@"nombre"];
  [coder encodeObject:_descripcion forKey:@"descripcion"];
  [coder encodeObject:_fecha_inicio forKey:@"fecha_inicio"];
  [coder encodeObject:_fecha_fin forKey:@"fecha_fin"];
  
}

@end
