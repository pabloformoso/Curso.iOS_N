//
//  SWMapViewController.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estadra. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import "SWLocationManager.h"
#import "SWMapPin.h"
#import "SWMapViewController.h"

@interface SWMapViewController ()
  @property (nonatomic, strong) CLLocation *lastcoordinate;
  @property (nonatomic, strong) SWLocationManager *locationManager;
@end

@implementation SWMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPins];
  
    _locationManager = [[SWLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager.locationManager startUpdatingLocation];
}

- (void)loadPins {
  SWMapPin *p1 = [[SWMapPin alloc] initWithTitle:@"pin1"
                                                      subtitle:@"sub pin1"
                                                andCoordinates:CLLocationCoordinate2DMake(43.3222746, -8.403070)];
  
  SWMapPin *p2 = [[SWMapPin alloc] initWithTitle:@"pin2"
                                                      subtitle:@"sub pin2"
                                                andCoordinates:CLLocationCoordinate2DMake(43.3213746, -8.411070)];
  
  SWMapPin *p3 = [[SWMapPin alloc] initWithTitle:@"pin3"
                                                      subtitle:@"sub pin3"
                                                andCoordinates:CLLocationCoordinate2DMake(43.3212546, -8.414570)];
  
  [_mapView addAnnotations:@[p1, p2, p3]];
  
}

- (void) drawRoute {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  NSInteger numberOfPoints = 3;
  
  CLLocationCoordinate2D coordinates[numberOfPoints];
  
  CLLocation *location1 = [[CLLocation alloc] initWithLatitude:43.3212546
                                                     longitude:-8.414570];
  CLLocationCoordinate2D coordinate1 = location1.coordinate;
  coordinates[0] = coordinate1;
  
  CLLocation *location2 = [[CLLocation alloc] initWithLatitude:43.3213746
                                                     longitude:-8.411070];
  CLLocationCoordinate2D coordinate2 = location2.coordinate;
  coordinates[1] = coordinate2;
  
  CLLocation *location3 = [[CLLocation alloc] initWithLatitude:43.3222746
                                                     longitude:-8.403070];
  CLLocationCoordinate2D coordinate3 = location3.coordinate;
  coordinates[2] = coordinate3;
  
  
  MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:coordinates
                                                       count:numberOfPoints];
  
  [_mapView addOverlay:polyLine];
}

#pragma mark - MapViewDelegate
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
  polylineView.strokeColor = [UIColor blueColor];
  polylineView.lineWidth = 4.0;
  
  return polylineView;
}

- (void)locationUpdate:(CLLocation *)location {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  _lastcoordinate = location;
  
  MKCoordinateRegion region;
  MKCoordinateSpan span;
  
  span.latitudeDelta = 0.050;
  span.longitudeDelta = 0.050;
  
  region.span = span;
  region.center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
  
  [_mapView setRegion:region animated:YES];
  
  [self drawRoute];
}

-(void)viewDidDisappear:(BOOL)animated {
  [_locationManager.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
