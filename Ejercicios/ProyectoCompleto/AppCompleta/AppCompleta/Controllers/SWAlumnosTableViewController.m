//
//  SWAlumnosTableViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWAlumnosJsonService.h"
#import "UIImageView+AFNetworking.h"
#import "SWAlumno.h"
#import "SWAlumnoCell.h"
#import "SWAlumnosTableViewController.h"

@interface SWAlumnosTableViewController ()

@property (nonatomic, strong) NSArray *alumnos;

@end

@implementation SWAlumnosTableViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
    [self loadData];
    
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  SWAlumnosJsonService *ws = [[SWAlumnosJsonService alloc] init];
  [ws getAlumnosForController:self];
}


#pragma mark - informal protocol
- (void)updateView:(NSMutableArray *)anArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _alumnos = [[NSArray alloc] initWithArray:anArray];
  [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_alumnos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AlumnoCell";
    SWAlumnoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                         forIndexPath:indexPath];
  
    SWAlumno *tmp = [_alumnos objectAtIndex:indexPath.row];
  
    [cell.avatarImageView setImageWithURL:[NSURL URLWithString:tmp.avatarPath]];
    [cell.nameLabel setText:tmp.nombre];
    [cell.emailLabel setText:tmp.email];
  
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}



@end
