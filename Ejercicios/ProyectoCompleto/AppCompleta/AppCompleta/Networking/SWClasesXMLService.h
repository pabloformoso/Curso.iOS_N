//
//  SWClasesXMLService.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "BaseXmlParser.h"

@interface SWClasesXMLService : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (void)getClasesForController:(id)aController;

@end
