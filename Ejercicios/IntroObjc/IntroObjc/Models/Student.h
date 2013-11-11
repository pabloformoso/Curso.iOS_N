//
//  Alumno.h
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "CourseDelegate.h"

@interface Student : NSObject <CourseDelegate>

- (id)initWithName:(NSString *)aName andAge:(int)anAge;

@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;

- (NSString *)fullStundentInfo;


@end
