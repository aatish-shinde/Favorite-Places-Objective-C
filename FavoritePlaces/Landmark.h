//
//  Landmark.h
//  FavoritePlaces
//
//  Created by tonyj on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Landmark : NSObject<MKAnnotation>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *state;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
-(NSString*)title;
-(NSString*)subtitle;
- (id)initWithName:(NSString *)lName state:(NSString *)lState coordinate:(CLLocationCoordinate2D)lCoordinate;
@end
