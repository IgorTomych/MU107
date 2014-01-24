//
//  User.h
//  MU107
//
//  Created by Igor Tomych on 16/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString* username;
@property (strong, nonatomic) NSString* password;


+ (User *)userWithName:(NSString*)name andPassword:(NSString*)password;
- (void)login;
@end
