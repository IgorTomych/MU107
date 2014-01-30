//
//  MySidePanelControllerViewController.m
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "MySidePanelControllerViewController.h"
#import "MapViewController.h"
#import "RoutesViewController.h"

@interface MySidePanelControllerViewController ()

@end

@implementation MySidePanelControllerViewController


-(void) awakeFromNib
{
    UINavigationController* navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    
    MapViewController* mapViewController = (MapViewController*)[navigationController topViewController];
    RoutesViewController* routesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    routesViewController.delegate = mapViewController;
    
    [self setLeftPanel:routesViewController];
    [self setCenterPanel:navigationController];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
