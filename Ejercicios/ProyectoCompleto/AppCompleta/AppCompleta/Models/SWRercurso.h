//
//  SWRercurso.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWRercurso : NSObject

- (id)initWithJSonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int recursoId;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *descripcion;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *photo_url;

@end
