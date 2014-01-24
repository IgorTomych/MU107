//
//  User.m
//  MU107
//
//  Created by Igor Tomych on 16/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "User.h"

@implementation User


+(User *)userWithName:(NSString *)name andPassword:(NSString *)password {
    User* user = [[User alloc] init]; // [User new];
    
    user.username = name;
    user.password = password;
    //default configuration
    
    return user;
}

- (void)login {
    NSLog(@"Try to login the user!");
}

-(void)dealloc {
    NSLog(@"dealloc!");
}
@end
