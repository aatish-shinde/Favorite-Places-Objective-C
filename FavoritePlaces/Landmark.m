//
//  Landmark.m
//  FavoritePlaces
//
//  Created by tonyj on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Landmark.h"

@implementation Landmark
@synthesize name,state, coordinate;

- (id)initWithName:(NSString *)lName state:(NSString *)lState coordinate:(CLLocationCoordinate2D)lCoordinate{
    self = [super init];
    self.name = lName;
    self.state = lState;
    coordinate = lCoordinate;
    return self;
}

- (CLLocationCoordinate2D) coordinate{
    NSLog(@"coordinate called for %@", name);
    
    
    return coordinate;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSString*)title{
    return name;
}

- (NSString *)subtitle{
    return state;
}
 

@end
