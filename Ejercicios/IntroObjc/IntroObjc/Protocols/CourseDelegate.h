//
//  CurseDelegate.h
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CourseDelegate <NSObject>

- (BOOL)signUpCourse;
- (void)addToList:(NSString *)session;

@optional

- (void)signOut;

@end
