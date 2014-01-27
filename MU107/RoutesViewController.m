//
//  RoutesViewController.m
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "RoutesViewController.h"
#import "Route.h"

#import <MBProgressHUD.h>
#import "MapViewController.h"
#import "MarshrutkiApi.h"


@interface RoutesViewController ()

@property (strong, nonatomic) NSArray* routes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[MarshrutkiApi sharedClient] getRoutes:^(NSArray *routes, NSError *error) {
        self.routes = routes;
        [self.tableView reloadData];
    } params:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route* route = (Route*)self.routes[indexPath.row];
    cell.textLabel.text = route.title;

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Route* route = (Route*)self.routes[indexPath.row];
    
    [self.mapController selectRoute:route];
    JASidePanelController* sideController = self.sidePanelController;
    
    [sideController showCenterPanelAnimated:YES];
}



@end
