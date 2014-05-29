//
//  MLKJob.h
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/28/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLKJob : NSObject
@property (assign, nonatomic) int roomLarge;
@property (assign, nonatomic) int roomMedium;
@property (assign, nonatomic) int roomSmall;
@property (assign, nonatomic) int employees;
@property (assign, nonatomic) int distence;
@property (assign, nonatomic) int daysNeeded;
@property (strong, nonatomic) NSString *projectTitle;
-(float)total;

@end


