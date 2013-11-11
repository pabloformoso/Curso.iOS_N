//
//  NSString+PSA.h
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PSA)

- (NSString *)printWithPSA;
+ (NSString *)signDocumentForString:(NSString *)aDoc;

@end
