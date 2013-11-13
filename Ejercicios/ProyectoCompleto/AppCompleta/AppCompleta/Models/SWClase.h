//
//  SWClase.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClase : NSObject

- (id)initFromDBDictionary:(NSDictionary *)dic;
- (id)initWithJsonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int claseId;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *descripcion;
@property (nonatomic, strong) NSDate *fecha_inicio;
@property (nonatomic, strong) NSDate *fecha_fin;

@end
