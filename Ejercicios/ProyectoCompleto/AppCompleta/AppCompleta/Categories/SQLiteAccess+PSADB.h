//
//  SQLiteAccess+PSADB.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWClase;
#import "SQLiteAccess.h"

@interface SQLiteAccess (PSADB)

+ (NSArray *)getClasesFromDB;
+ (SWClase *)getClasePorId:(int)claseId;

@end
