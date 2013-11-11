//
//  NSString+PSA.m
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "NSString+PSA.h"

@implementation NSString (PSA)

- (NSString *)printWithPSA {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  return [NSString stringWithFormat:@"%@ %@", self, @"(PSA Vigo)"];
  
}

#pragma mark - Class Methods
+ (NSString *)signDocumentForString:(NSString *)aDoc {
  return [NSString stringWithFormat:@"%@ signed by (PSA Vigo©)", aDoc];
}

@end
