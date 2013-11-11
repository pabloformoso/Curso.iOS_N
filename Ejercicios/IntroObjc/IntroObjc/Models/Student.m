//
//  Alumno.m
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "NSString+PSA.h"
#import "Student.h"

@interface Student ()

@property (nonatomic, strong) NSString *lastName;

@end

@implementation Student

- (id)initWithName:(NSString *)aName andAge:(int)anAge {
  
  self = [super init];
  
  if (self) {
    _age = anAge;
    _name = aName;
    _lastName = @"Formoso";
  }
  
  return self;
  
}

- (NSString *)fullStundentInfo {
  NSLog(@"%@", [NSString signDocumentForString:@"Info curso ios"]);
  return [NSString stringWithFormat:@"%i - %@, %@ ",
          _age, [self composeLastName],[_name printWithPSA]];
}

#pragma mark - Course Delegate
- (BOOL)signUpCourse {
  return YES;
}

- (void)addToList:(NSString *)session {
  NSLog(@"Added to session: %@", session);
}

#pragma mark - Private
- (NSString *)composeLastName {
  return _lastName;
}


@end
