//
//  NorthPole.m
//  FavoritePlaces
//
//  Created by Student on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NorthPole.h"

@implementation NorthPole

-(id) init{
    self = [super init];
    
    if(self) {
        //initialization code here
    }
    
    return self;
}

-(CLLocationCoordinate2D) coordinate{
    //the status bar converts the north pole, so we will cheat slightly
    
    return CLLocationCoordinate2DMake(80, 0);
}

- (NSString *) title{
    return @"The north Pole";
}

- (NSString *) subtitle{
        return @"Santa's workshop";
}

@end
