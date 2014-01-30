//
//  Route.h
//  MU107
//
//  Created by Igor Tomych on 23/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* price;
@property (nonatomic) BOOL isFavorited;

+(Route *)initRouteWithDictionary:(NSDictionary *)attributes;

@end
