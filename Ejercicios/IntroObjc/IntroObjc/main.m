//
//  main.m
//  IntroObjc
//
//  Created by Pablo Formoso Estada on 11/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "Student.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    Student *s1 = [[Student alloc] initWithName:@"Pablo"
                                       andAge:29];
    NSLog(@"%@", [s1 name]);
    [s1 setName:@"Carlos"];
    
    NSLog(@"%@", [s1 fullStundentInfo]);
    
    [s1 signUpCourse];
    [s1 addToList:@"Día 1"];

    if ([s1 respondsToSelector:@selector(signOut)]) {
      [s1 performSelector:@selector(signOut) withObject:nil];
    } else {
      NSLog(@"No tiene el opcional");
    }
    
    void (^simpleBlock)(void) = ^{
#ifndef NDEBUG
      NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
      NSLog(@"This is a block");
    };
    
    simpleBlock();
    
    NSArray *anArray = @[@"1", [[NSNumber alloc] initWithInt:2], @"3"];

    //[s1 signOut];
  }
  
  return 0;
}

