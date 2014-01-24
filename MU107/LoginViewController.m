//
//  ViewController.m
//  MU107
//
//  Created by Igor Tomych on 16/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()
- (void)privateMethod;

@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)actionLogin:(UIButton *)sender {
    NSLog(@"login action!");
        
    User* user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    
    [user login];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
