//
//  MapVC.m
//  FavoritePlaces
//
//  Created by tonyj on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapVC.h"
#import "Landmark.h"
#import "NorthPole.h"

@implementation MapVC

@synthesize mapView,landmarks;

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

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    id<MKAnnotation> annotation = view.annotation;
    
    NSLog(@"The title of the tapped annotation is %@",annotation.title);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);

    [super viewDidLoad];
    
    NorthPole *northPole = [[NorthPole alloc] init];
    
    NSLog(@"landmarks=%@",landmarks);
    
    // Do any additional setup after loading the view from its nib. e.g add the landmark annotations
    for (id<MKAnnotation> landmark in self.landmarks) {
        [self.mapView addAnnotation:landmark];
        
        [self.mapView addAnnotation:northPole];
    }
    
    
}

- (void)viewDidUnload
{
    NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
	NSLog(@"didUpdateUserLocation userLocation=%@",userLocation.location);
}

// This delegate method is called once for every annotation that is created.
// If no view is returned by this method, then only the default pin is seen by the user
- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id <MKAnnotation>)annotation{
	MKAnnotationView *view = nil;
	if(annotation != mv.userLocation) {
		// if it's NOT the user's current location pin, create the annotation
        Landmark *restaurantAnnotation = (Landmark*)annotation;
		// Look for an existing view to reuse
		view = [mv dequeueReusableAnnotationViewWithIdentifier:@"landmarkAnnotation"];
		// If an existing view is not found, create a new one
		if(view == nil) {
			view = [[MKPinAnnotationView alloc] initWithAnnotation:restaurantAnnotation
                                                   reuseIdentifier:@"landmarkAnnotation"];
		}
		
		// Now we have a view for the annotation, so let's set some properties
		[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorRed];
		[(MKPinAnnotationView *)view setAnimatesDrop:YES];
		[view setCanShowCallout:YES];
		
		// Now create buttons for the annotation view
		// The 'tag' properties are set so that we can identify which button was tapped later
		UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
		leftButton.tag = 0;
		UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		rightButton.tag = 1;
		
		// Add buttons to annotation view
		[view setLeftCalloutAccessoryView:leftButton];
		[view setRightCalloutAccessoryView:rightButton];
	}
	
	// send this annotation view back to MKMapView so it can add it to the pin 
	return view;
}


// This method is called when one of the two buttons added to the annotation view is tapped
- (void)mapView:(MKMapView *)mv annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"Control tapped control = %@, tag number = %d", control, control.tag);
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"inside didDeselectAnnotationView");
}

- (void)viewDidAppear:(BOOL)animated{
     NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);
}

- (void)viewDidDisappear:(BOOL)animated{
     NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);
}

- (void)viewWillAppear:(BOOL)animated{
     NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);
}

- (void)viewWillDisappear:(BOOL)animated{
     NSLog(@"%@ method called in class %@ on line #%d",NSStringFromSelector(_cmd),[self class],__LINE__);
}

#pragma mark -

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark MKMapViewDelegate protocol

@end
