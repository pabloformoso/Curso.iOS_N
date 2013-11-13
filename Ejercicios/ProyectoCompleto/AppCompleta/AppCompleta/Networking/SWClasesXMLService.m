//
//  SWClasesXMLService.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWClase.h"
#import "SWClasesXMLService.h"

@interface SWClasesXMLService ()

@property (nonatomic, strong) id controller;
@property (nonatomic, strong) NSMutableData *wip;
@property (nonatomic, strong) NSMutableArray *clases;
@property (nonatomic, strong) SWClase *tmpClase;

@end

@implementation SWClasesXMLService

- (void)getClasesForController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif

  
}

// Recivimos la primera respusta del server
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    int status = [res statusCode];
    
    if ((status >= 200) && (status <= 300)) {
      _wip = nil;
      _wip = [[NSMutableData alloc] init];
    } else {
      NSLog(@"Error con la conexión");
    }
  }
  
}

// Agregamos los datos descargados
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [_wip appendData:data];
}

// En caso de error
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
  NSLog(@"Fallo: %@", [error localizedDescription]);
#endif
  
  if ([_controller respondsToSelector:@selector(updateViewFailed)]) {
    [_controller performSelector:@selector(updateViewFailed)];
  }
}


// Cuando termina la conexión
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self parseDocument:_wip];
  
  if ([_controller respondsToSelector:@selector(updateView:)]) {
    [_controller performSelector:@selector(updateView:) withObject:_clases];
  }
}

#pragma mark - XMLParserDelegate
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
  
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([elementName isEqualToString:@"aecomo-classes"]) {
    _clases = [[NSMutableArray alloc] init];
  } else if ([elementName isEqualToString:@"aecomo-class"]) {
    if (_tmpClase != nil) {
      _tmpClase = nil;
    }
    _tmpClase = [[SWClase alloc] init];
  }
  
  // Limpiamos caracteres en el buffer
  [self clearContentsOfElement];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
  
#ifndef NDEBUG
  NSLog(@"%s (line:%d) %@ - %@", __PRETTY_FUNCTION__, __LINE__, elementName, _contentsOfElement);
#endif
  
  if ([elementName isEqualToString:@"id"]) {
    [_tmpClase setClaseId:[_contentsOfElement integerValue]];
    
  } else if ([elementName isEqualToString:@"name"]) {
    [_tmpClase setNombre:_contentsOfElement];
    
  } else if ([elementName isEqualToString:@"description"]) {
    [_tmpClase setDescripcion:_contentsOfElement];
    
  } else if ([elementName isEqualToString:@"aecomo-class"]) {
    [_tmpClase setFecha_inicio:[NSDate date]];
    [_tmpClase setFecha_fin:[NSDate date]];
    [_clases addObject:_tmpClase];
  }
  
  // Limpiamos caracteres en el buffer
  [self clearContentsOfElement];
}


@end
