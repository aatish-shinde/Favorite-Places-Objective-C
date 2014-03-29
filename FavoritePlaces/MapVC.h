//
//  MapVC.h
//  FavoritePlaces
//
//  Created by tonyj on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

@interface MapVC : UIViewController<MKMapViewDelegate>

@property(nonatomic,strong)IBOutlet MKMapView *mapView;
@property(nonatomic,strong)NSMutableArray *landmarks;



@end
