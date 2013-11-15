//
//  SWAppDelegate.m
//  GestionDeFicheros
//
//  Created by Pablo Formoso Estada on 19/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWAppDelegate.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
  
    NSURL *urlToParse = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
#ifndef NDEBUG
  NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, urlToParse);
#endif
    if (urlToParse) {
      [self application:application handleOpenURL:urlToParse];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
	
  if ([[url scheme] isEqualToString:@"psadoc"]) {
    
    NSLog(@"App Completa abre el Gestor de fichero");
    
    NSString *url = @"psa://shishishi?param=1&token=8DEF1ABD";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    } else {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URLs"
                                                      message:@"Sin URL para abrir"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
      [alert show];
    }
    
	}
  
  return YES;
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
