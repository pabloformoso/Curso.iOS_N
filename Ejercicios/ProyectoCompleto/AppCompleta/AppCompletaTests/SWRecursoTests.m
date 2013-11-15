//
//  SWRecursoTests.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estadra. All rights reserved.
//
#import "SWRercurso.h"
#import <XCTest/XCTest.h>

@interface SWRecursoTests : XCTestCase
@property (nonatomic, strong) NSDictionary *dicOk;
@end

@implementation SWRecursoTests

- (void)setUp {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super setUp];
  
  _dicOk = @{
    @"id": [NSNumber numberWithInt:1],
    @"link": @"http://pabloformoso.com",
    @"name": @"Pablo",
    @"description": @"Blog Pablo formos  estrada",
    @"image_url": @"http:...."
  };
}

- (void)tearDown {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super tearDown];
}

- (void)testInitWithJsonDic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  SWRercurso *rec = [[SWRercurso alloc] initWithJSonDictionary:_dicOk];
  
  XCTAssertNotNil(rec, @"El %@ es nil cuando no debería", [rec description]);
  XCTAssertEqual(rec.nombre, @"Pablo");
}

@end
