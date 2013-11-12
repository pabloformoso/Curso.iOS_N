//
//  SWMasterViewController.h
//  MasterDetailEjemplo
//
//  Created by Pablo Formoso Estada on 12/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDetailViewController;

@interface SWMasterViewController : UITableViewController

@property (strong, nonatomic) SWDetailViewController *detailViewController;

@end
