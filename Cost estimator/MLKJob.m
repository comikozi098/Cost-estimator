//
//  MLKJob.m
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/28/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import "MLKJob.h" 
#import "MLKViewController.h"

@implementation MLKJob

-(float)total {
    
    int rooms = (self.roomLarge*2) + (self.roomMedium *1.5) + self.roomSmall;
    return (rooms + ((15*self.employees*8)*self.daysNeeded) + (((self.distence*2*self.daysNeeded)/18)*3.50));
    
}

-(id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if(!self) {
        return nil;
    }
    self.projectTitle = [decoder decodeObjectForKey:@"projectTitle"];
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.projectTitle forKey:@"projectTitle"];
}
@end