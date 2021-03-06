//
//  SWAppDelegate.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWRecursosTableViewController.h"
#import "SWClase.h"
#import "SWAppDelegate.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  // Array con n clases
  NSMutableArray *clases = [[NSMutableArray alloc] init];
  
  for (int i = 0; i <= 50; i++) {
    SWClase *tmp = [[SWClase alloc] init];
    
    [tmp setClaseId:i];
    [tmp setNombre:@"Sesión de ejemplo"];
    [tmp setDescripcion:@"Una descripción extendida de la clase"];
    [tmp setFecha_inicio:[NSDate date]];
    [tmp setFecha_fin:[NSDate date]];
    
    [clases addObject:tmp];
  }
  
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  
  [userDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:clases]
                  forKey:@"clases_array"];
  
  NSURL *urlToParse = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];

  if (urlToParse) {
    [self application:application handleOpenURL:urlToParse];
  }
  
  [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
  
  return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {

  if ([[url scheme] isEqualToString:@"psa"]) {
    NSLog(@"Recibidos varios params %@", [url parameterString]);
	}
  
  return YES;
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  UITabBarController *tabController = (UITabBarController *)_window.rootViewController;
  id controller = [tabController selectedViewController];
  
  if ([controller isKindOfClass:[SWRecursosTableViewController class]]) {
    [(SWRecursosTableViewController *)controller loadData];
  }
  
  completionHandler(UIBackgroundFetchResultNoData);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
