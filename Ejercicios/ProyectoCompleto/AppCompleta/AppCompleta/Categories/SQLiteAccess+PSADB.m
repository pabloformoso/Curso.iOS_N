//
//  SQLiteAccess+PSADB.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWClase.h"
#import "SQLiteAccess+PSADB.h"

@implementation SQLiteAccess (PSADB)

/*
 * Devuelve todos los elementos de la tabla clases en forma de NSArray. 
 * Cada posición del array corresponde a una fila con los datos
 * representados en forma de clave - valor en un objeto NSDictionary.
 */
+ (NSArray *)getClasesFromDB {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSString *query = @"SELECT * FROM clases";
  
  NSArray *resultSet = [self selectManyRowsWithSQL:query];
  NSMutableArray *clases = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dic in resultSet) {
    SWClase *tmpClase = [[SWClase alloc] initFromDBDictionary:dic];
    [clases addObject:tmpClase];
  }
  
  return clases;
}


/*
 * Recpera un objeto por id de la base de datos.
 */
+ (SWClase *)getClasePorId:(int)claseId {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSString *query = [NSString stringWithFormat:@"SELECT * FROM clases WHERE id=%i", claseId];
  NSDictionary *dic = [self selectOneRowWithSQL:query];
  
  return [[SWClase alloc] initFromDBDictionary:dic];
}

@end
