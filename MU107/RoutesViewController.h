//
//  RoutesViewController.h
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JASidePanelController.h>
#import <UIViewController+JASidePanel.h>


@class MapViewController;

@interface RoutesViewController : UITableViewController

@property (strong, nonatomic) MapViewController* mapController;
@end
