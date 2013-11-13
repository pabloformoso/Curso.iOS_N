//
//  SWClase.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWClase.h"
#import <XCTest/XCTest.h>

@interface SWClaseTest : XCTestCase

@property (nonatomic, strong) NSDictionary *okDic;
@property (nonatomic, strong) NSDictionary *failDic;

@end

@implementation SWClaseTest

- (void)setUp {
    [super setUp];
  
  _okDic = @{@"id": [NSNumber numberWithInt:1],
             @"nombre": @"Sesion 1",
             @"descripcion": @"Ejemplo de test ok",
             @"inicio": @"13/11/2013 08:30",
             @"fin": @"13/11/2013 13:30"
             };
  
  _failDic = @{@"id": [NSNumber numberWithInt:1],
             @"nombre": @"Sesion 1",
             @"descripcion": @"Ejemplo de test ok",
             @"inicio": @"",
             @"fin": @"13/11/2013 13:30"
             };
}

- (void)tearDown {
    [super tearDown];
}

- (void)testInitDbComplete {
  SWClase *testOkClase = [[SWClase alloc] initFromDBDictionary:_okDic];
  
  XCTAssertTrue(testOkClase != nil, @"El objeto Clase no es nil");
  XCTAssertEqual([testOkClase nombre], @"Sesion 1", @"El nombre es Sesion 1");
  XCTAssertNotNil([testOkClase fecha_inicio], @"La fecha de inicio es nil");
}

@end
