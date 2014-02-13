//
//  SocialTestViewController.m
//  MU107
//
//  Created by Igor Tomych on 06/02/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "SocialTestViewController.h"
#import <Social/Social.h>

@interface SocialTestViewController ()

@end

@implementation SocialTestViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    SLComposeViewController* fbController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewControllerCompletionHandler __block completionHander= ^ (SLComposeViewControllerResult result) {
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
        };
        
        [fbController setCompletionHandler:completionHander];
        [fbController setInitialText:@"Master Up is a nice course!"];
        
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
