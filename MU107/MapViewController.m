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
@property (nonatomic, strong) UIBarButtonItem* favoriteBarButton;
@property (strong, nonatomic) Route* currentRoute;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.favoriteBarButton = [[UIBarButtonItem alloc] initWithTitle:@"★" style:UIBarButtonItemStyleBordered target:self action:@selector(favAction)];
    
    self.navigationItem.rightBarButtonItem = self.favoriteBarButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPressAction:(id)sender {
    NSLog(@"long press");
}


#pragma mark - RouteMenuProtocol

-(void)didSelectRoute:(Route *)route {
    self.title = route.title;
    
    self.currentRoute = route;
    
    self.favoriteBarButton.title = route.isFavorited? @"☆" : @"★";
}


- (void)favAction {
    self.currentRoute.isFavorited = !self.currentRoute.isFavorited;
    self.favoriteBarButton.title = self.currentRoute.isFavorited? @"☆" : @"★";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_FAVS_CHANGED object:nil];
    
}
@end
