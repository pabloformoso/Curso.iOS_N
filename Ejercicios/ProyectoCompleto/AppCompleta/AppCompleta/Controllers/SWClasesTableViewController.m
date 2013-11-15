//
//  SWClasesTableViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 13/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SQLiteAccess+PSADB.h"
#import "SWClase.h"
#import "SWClaseCell.h"
#import "SWClasesTableViewController.h"
#import "SWClasesXMLService.h"
#import "SWClasesJsonService.h"

@interface SWClasesTableViewController ()
@property (nonatomic, strong) NSArray *clases;
@end

@implementation SWClasesTableViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
    [self loadData];
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewWillAppear:animated];
  
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidAppear:animated];
  
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidDisappear:animated];

}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super didReceiveMemoryWarning];
}

- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    // Objectos recuperados de NSUserDefault
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //_clases = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"clases_array"]];
  
    //_clases = [SQLiteAccess getClasesFromDB];
  
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [HUD setLabelText:@"cargando..."];
  
    SWClasesXMLService *ws = [[SWClasesXMLService alloc] init];
    [ws getClasesForController:self];
  
    SWClasesJsonService *ws2 = [[SWClasesJsonService alloc] init];
    [ws2 getClasesForController:self];
}

#pragma mark - Protocolo informal para los servicios
- (void)updateView:(NSArray *)anArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
  
  _clases = [[NSArray alloc] initWithArray:anArray];
  [self.tableView reloadData];
}

- (void)updateViewFailed {
  [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
#ifndef NDEBUG
  NSLog(@"%s (line:%d) Error en el servicio", __PRETTY_FUNCTION__, __LINE__);
#endif
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_clases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SWClaseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SWClase *claseTmp = [_clases objectAtIndex:indexPath.row];
  
    [cell.nombreLabel setText:claseTmp.nombre];
  
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd-MM-yyyy"];
    [formater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es"]];
  
    [cell.fechaInicioLabel setText:[formater stringFromDate:claseTmp.fecha_inicio]];
    [cell.fechaFinLabel setText:[formater stringFromDate:claseTmp.fecha_fin]];
  
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  SWClase *tmp = [_clases objectAtIndex:self.tableView.indexPathForSelectedRow.row];
  
  if ([segue.destinationViewController respondsToSelector:@selector(setClase:)]) {
    [segue.destinationViewController performSelector:@selector(setClase:) withObject:tmp];
  }
  
}


@end
