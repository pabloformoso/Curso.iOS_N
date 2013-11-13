//
//  SWClaseCell.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWClaseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *fechaInicioLabel;
@property (weak, nonatomic) IBOutlet UILabel *fechaFinLabel;

@end
