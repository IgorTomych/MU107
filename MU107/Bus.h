//
//  Bus.h
//  MU107
//
//  Created by Igor Tomych on 03/02/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Route;

@interface Bus : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * logtitute;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Route *route;

@end
