//
//  MapViewController.h
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutesViewController.h"

@class Route;

@interface MapViewController : UIViewController <RoutesMenuProtocol>
- (void)selectRoute:(Route *)selectedRoute;
@end
