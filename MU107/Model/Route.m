//
//  Route.m
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "Route.h"

@implementation Route


+(Route *)initRouteWithDictionary:(NSDictionary *)attributes {
    Route* route = [[Route alloc] init];
    
    route.title = attributes[@"route_title"];
    route.price = attributes[@"route_price"] ;
    
    return route;
}
- (BOOL)isEqual:(id)anObject {
    
    if ([anObject isKindOfClass:[Route class]]) {
        Route* aRoute = (Route *)anObject;
        if (self.isFavorited == aRoute.isFavorited) {
            return YES;
        }
        
        return NO;
    }
    
    return NO;

}

@end
