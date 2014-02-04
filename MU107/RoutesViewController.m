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
@property (strong, nonatomic) NSMutableArray* favoriteRoutes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = MENU_BACKGROUND_COLOR;
    
    [[MarshrutkiApi sharedClient] getRoutes:^(NSArray *routes, NSError *error) {
        self.routes = routes;
        [self.tableView reloadData];
    } params:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(favoritiesChanged) name:NOTIFICATION_FAVS_CHANGED object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", cell.subviews);
    
    UIButton* disclosureButton = [[cell.subviews[0] subviews] firstObject];
    
    disclosureButton.frame = CGRectMake(200, disclosureButton.frame.origin.y, disclosureButton.frame.size.width, disclosureButton.frame.size.height);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route* route = (Route*)self.routes[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *FavCellIdentifier = @"FavCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:route.isFavorited?FavCellIdentifier:CellIdentifier forIndexPath:indexPath];

//    cell.textLabel.text = route.title;
//    cell.detailTextLabel.text = route.price;

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Route* route = (Route*)self.routes[indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectRoute:)]) {
        [self.delegate didSelectRoute:route];
    }
    
    JASidePanelController* sideController = self.sidePanelController;
    [sideController showCenterPanelAnimated:YES];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    view.backgroundColor = MENU_BACKGROUND_COLOR;
    
    return view;
}

-(void)favoritiesChanged {
    self.routes = [self.routes sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 isEqual:obj2];
    }];
    
    [self.tableView reloadData];
}


@end
