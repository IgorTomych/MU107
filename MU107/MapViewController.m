//
//  MapViewController.m
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "MapViewController.h"
#import "LoginViewController.h"
#import "Route.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *routeTitle;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    UIViewController* loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    
    [self.navigationController presentViewController:loginController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPressAction:(id)sender {
    NSLog(@"long press");
}

-(void)selectRoute:(Route *)selectedRoute {
    self.routeTitle.text = selectedRoute.title;
}

@end
