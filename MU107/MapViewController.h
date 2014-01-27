//
//  MapViewController.h
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Route;

@interface MapViewController : UIViewController
- (void)selectRoute:(Route *)selectedRoute;
@end
