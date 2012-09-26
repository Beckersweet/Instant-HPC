//
//  HPCmap.m
//  HPCNews_test
//
//  Created by Barbara Collignon on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HPCmap.h"

@implementation HPCmap

@synthesize map,distance,waitView,locMan,latitudelab,longitudelab;
@synthesize mylatitude,mylongitude,currentlocation; 

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion mapRegion;
    
    NSLog(@"userLocation = %f,%f", map.userLocation.coordinate.latitude, 
          map.userLocation.coordinate.longitude);
    
    mylatitude=map.userLocation.coordinate.latitude;
    mylongitude=map.userLocation.coordinate.longitude;
    
    
    latitudelab.text = [[NSString alloc] initWithFormat:@"%4.4f",mylatitude];
    longitudelab.text = [[NSString alloc] initWithFormat:@"%4.4f",mylongitude];
    
    mapRegion.center.latitude=mylatitude;
    mapRegion.center.longitude=mylongitude;
    
    mapRegion.span.latitudeDelta=0.2;
    mapRegion.span.longitudeDelta=0.2;
    
    [map setRegion:mapRegion animated:YES];
    
    //   if (zipAnnotation!=nil) {
    //       [map removeAnnotation:zipAnnotation];
    //   }
    
    //   zipAnnotation = [[MKPlacemark alloc] initWithCoordinate:mapRegion.center];
    //   [map addAnnotation:zipAnnotation];
    //   [zipAnnotation release];
    
    
    
    [locMan startUpdatingLocation];
    
}



//-(void)centerMap:(NSString*)ZipCode showAddress:(NSDictionary*)fullAddress{
//    NSString *queryURL;
//    NSString *queryResults;
//    NSArray *queryData;
//    double latitude;
//    double longitude;
//    MKCoordinateRegion mapRegion;

//    queryURL = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps/geo?output=csv&q=%@",ZipCode];

//    queryResults = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:queryURL]
//                                               encoding:NSUTF8StringEncoding error:nil];

//    queryData = [queryResults componentsSeparatedByString:@","];
//    
//    if ([queryData count] == 4) {
//        
//        latitude=[[queryData objectAtIndex:2] doubleValue];
//        longitude=[[queryData objectAtIndex:3] doubleValue];
//        
//        mapRegion.center.latitude=latitude;
//        mapRegion.center.longitude=longitude;
//        
//        mapRegion.span.latitudeDelta=0.2;
//        mapRegion.span.longitudeDelta=0.2;
//        
//        [map setRegion:mapRegion animated:YES];
//        
//        if (zipAnnotation!=nil) {
//            [map removeAnnotation:zipAnnotation];
//        }
//        
//        zipAnnotation = [[MKPlacemark alloc] initWithCoordinate:mapRegion.center addressDictionary:fullAddress];
//        [map addAnnotation:zipAnnotation];
//        [zipAnnotation release];
//        
//    }
//    
//    [queryURL release];
//    [queryResults release];
//    
//}


//-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {

//    NSString *friendname;
//    NSString *friendemail;
//    NSString *friendzip;

//    friendname=(NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    name.text = friendname ;
//    [friendname release];

//    ABMultiValueRef friendAddressSet;
//    NSDictionary *friendFirstAddress;
//    friendAddressSet = ABRecordCopyValue(person, kABPersonAddressProperty);

//    if(ABMultiValueGetCount(friendAddressSet)>0){

//        friendFirstAddress = (NSDictionary *) ABMultiValueCopyValueAtIndex(friendAddressSet, 0);
//        friendzip = [friendFirstAddress objectForKey:@"zip"];

//        [friendFirstAddress release];

//    }

// ABMultiValueRef friendEmailAddresses;
// friendEmailAddresses = ABRecordCopyValue(person, kABPersonEmailProperty);

//   if (ABMultiValueGetCount(friendEmailAddresses)>0) {
//        friendemail=(NSString*)ABMultiValueCopyValueAtIndex(friendEmailAddresses, 0);
//        email.text = friendemail;
//        [friendemail release];
//    }

//    if(ABPersonHasImageData(person)){

//        chosenphoto.image = [UIImage imageWithData:(NSData*) ABPersonCopyImageData(person)];

//    }

//    [self presentModalViewController:peoplePicker animated:YES];


//[friendzip=friendFirstAddress objectForKey:@"ZIP"];

//    [self centerMap:friendzip showAddress:friendFirstAddress];
//    friendzip = [friendFirstAddress objectForKey:@"ZIP"];
//    return NO;

//}


- (MKAnnotationView *) mapView: (MKMapView*) mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    pinDrop=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"citycenter"];
    //    [pinDrop release];
    
    pinDrop.animatesDrop=NO;
    
    pinDrop.canShowCallout=YES;
    pinDrop.pinColor=MKPinAnnotationColorPurple;
    
    //  [pinDrop release];
    //  return pinDrop;
    // [pinDrop release];
    //  pinDrop=nil;
    
    /*  
     if (annotation == mapView.userLocation) {
     [pinDrop release];
     pinDrop=nil;
     return nil;
     }
     
     
     [pinDrop release]; 
     return pinDrop;
     pinDrop = nil;
     
     */
    return pinDrop;
    
    //  pinDrop=nil;
    //    [pinDrop release];
    
}

//- (IBAction)newBFF:(id)sender {

//   ABPeoplePickerNavigationController *picker;

//   picker = [[ABPeoplePickerNavigationController alloc] init];
//   picker.peoplePickerDelegate=self;

//   [self presentModalViewController:picker animated:YES];
//   [picker release];

//} 

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    NSString *coordinateDesc = @"Not Available";
    NSString *altitudeDesc = @"Not Available";
    
    if (newLocation.horizontalAccuracy <=0) {
        coordinateDesc = [NSString stringWithFormat:@"%f,%f +/- %f meters",
                          newLocation.coordinate.latitude,
                          newLocation.coordinate.longitude,
                          newLocation.horizontalAccuracy];
        
    }
    
    if (newLocation.verticalAccuracy >=0) {
        altitudeDesc = [NSString stringWithFormat:@"%f +/- %f meters",
                        newLocation.altitude, newLocation.verticalAccuracy];
    }
    
    NSLog(@"Latitude/Longitude: %@ Altitude: %@", coordinateDesc,altitudeDesc);
    
    //  waitView.hidden =  YES;
    //  distance.hidden = NO;
    
    //    mylatitude=newLocation.coordinate.latitude;
    //    mylongitude=newLocation.coordinate.longitude;
    
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    if (error.code == kCLErrorLocationUnknown) {
        NSLog(@"currently unable to retrieve location");
    } else if (error.code == kCLErrorNetwork) {
        NSLog(@"Network used to retrieve location is unavailable");
    } else if (error.code == kCLErrorDenied) {
        NSLog(@"Permission to receive location is denied");
        [locMan stopUpdatingLocation];
        [locMan release];
        locMan = nil ;
    }
    
    //   waitView.hidden = YES;
    //   distance.hidden = NO;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //   MKCoordinateRegion region;
    //   region.center.latitude=[eventVenue.latitue 
    
    
    // currentlocation=[[CLLocation alloc] init];
    
    if(locMan == nil) {
        locMan = [[CLLocationManager alloc] init];
    }
    locMan.delegate = self;
    locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    locMan.distanceFilter = 500; // a mile
    //  [locMan startUpdatingLocation];
    
    //   [self centerMap2];
    
    if(map ==nil){
        //  map = [[MKMapView alloc]initWithFrame:self.view.bounds];
        map = [[MKMapView alloc] init ];
    }
    
    map.delegate=self;
    map.showsUserLocation=YES;
    map.zoomEnabled=YES;
    map.mapType=MKMapTypeStandard;
    
    /*Region and Zoom*/
    
    MKUserLocation *userLocation = map.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 5000, 5000);
    [map setRegion:region animated:NO];
    
    [locMan startUpdatingLocation];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)dealloc {
  
    [map release];
 
    [locMan release];
    [distance release];
    [waitView release];
    [latitudelab release];
    [longitudelab release];
    [currentlocation release];
    [super dealloc];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
