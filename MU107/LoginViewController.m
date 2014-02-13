//
//  ViewController.m
//  MU107
//
//  Created by Igor Tomych on 16/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import <FacebookSDK.h>
#import <Social/Social.h>
#import <TWAPIManager.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) TWAPIManager *twAPIManager;


@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(facebookLoginCompleted) name:@"FACEBOOKTOKEN" object:nil];
}

-(void)dealloc {
    NSLog(@"login view controller deallocated!");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)facebookLoginAction:(UIButton *)sender {

    [FBSession renewSystemCredentials:^(ACAccountCredentialRenewResult result, NSError *error) {
        
        [[FBSession activeSession] closeAndClearTokenInformation];
        
        [FBSession openActiveSessionWithPermissions:@[@"email"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            if (session.accessTokenData.accessToken) {
                NSLog(@"%@", session.accessTokenData.accessToken);
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)actionLogin:(UIButton *)sender {
    self.accountStore = [[ACAccountStore alloc] init];
    self.twAPIManager = [[TWAPIManager alloc] init];
    
    ACAccountType *twitterType = [_accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    ACAccountStoreRequestAccessCompletionHandler hander = ^(BOOL granted, NSError *error) {
      
        if (granted) {
            NSLog(@"%@", [self.accountStore accountsWithAccountType:twitterType]);
        }
    };
    
    [self.accountStore requestAccessToAccountsWithType:twitterType options:nil completion:hander];
    
    /*
    NSLog(@"login action!");
        
    User* user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    
    [user login];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
     */
}

- (void)facebookLoginCompleted {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
