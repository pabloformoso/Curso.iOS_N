//
//  SWRecursosTableViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 14/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "SWWebResourceCell.h"
#import "SWImageResourceCell.h"
#import "SWRercurso.h"
#import "SWRecursosJsonService.h"
#import "SWRecursosTableViewController.h"

@interface SWRecursosTableViewController ()
@property (nonatomic, strong) NSArray *recursos;
@end

@implementation SWRecursosTableViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  SWRecursosJsonService *ws = [[SWRecursosJsonService alloc] init];
  [ws getRecursosForController:self];
}

- (void)updateView:(NSArray *)anArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _recursos = [[NSArray alloc] initWithArray:anArray];
  [self.tableView reloadData];
  
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_recursos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  SWRercurso *rec = [_recursos objectAtIndex:indexPath.row];
  
  if ([rec.link length] == 0) {
    
    static NSString *CellIdentifier = @"ImageCell";
    SWImageResourceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:rec.photo_url]];
    [cell.nombreLabel setText:rec.nombre];
    
    return cell;
    
  } else {
    static NSString *CellIdentifier = @"WebCell";
    SWWebResourceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.nameLabel setText:rec.nombre];
    [cell.linkLabel setText:rec.link];
    
    return cell;
  }

}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, segue.identifier);
#endif
  
  SWRercurso *tmp = [_recursos objectAtIndex:self.tableView.indexPathForSelectedRow.row];
  
  if ([segue.destinationViewController respondsToSelector:@selector(setRecurso:)]) {
    [segue.destinationViewController performSelector:@selector(setRecurso:) withObject:tmp];
  }
  
}

@end
