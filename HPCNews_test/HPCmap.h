//
//  HPCmap.h
//  HPCNews_test
//
//  Created by Barbara Collignon on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface HPCmap : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate, UINavigationControllerDelegate> {

MKMapView *map;
MKPlacemark *zipAnnotation;

CLLocationManager *locMan;
CLLocation *currentlocation;
UILabel *distance;
UILabel *waitView;
UILabel *longitudelab;
UILabel *latitudelab;
double mylatitude;
double mylongitude;
MKPinAnnotationView *pinDrop;
    
}


@property (nonatomic, retain) IBOutlet UILabel *distance;
@property (nonatomic, retain) IBOutlet UILabel *waitView;
@property (nonatomic, retain) IBOutlet UILabel *latitudelab;
@property (nonatomic, retain) IBOutlet UILabel *longitudelab;
@property double mylatitude;
@property double mylongitude;

@property (nonatomic, retain) IBOutlet MKMapView *map;

@property (assign, nonatomic) IBOutlet CLLocationManager *locMan;
@property (assign, nonatomic) IBOutlet CLLocation *currentlocation;

@end
