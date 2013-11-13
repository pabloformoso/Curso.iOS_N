//
//  SWAlumno.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWAlumno : NSObject

- (id)initWithJSonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int alumnoId;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *apellidos;
@property (nonatomic, strong) NSString *ciudad;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *avatarPath;

@end
