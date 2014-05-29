//
//  MLKViewController.m
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/21/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import "MLKViewController.h"
#import "MLKJob.h"

@interface MLKViewController ()

@end

@implementation MLKViewController
@synthesize roomLarge, roomSmall, roomMedium, employees, distence, totalLabel, daysNeeded;
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeNumberPad)];
    [self.view addGestureRecognizer:tap];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)estimatePrice:(id)sender {
    
    MLKJob *newJob = [[MLKJob alloc] init];
    newJob.roomLarge = [roomLarge.text intValue ];
    newJob.roomMedium = [roomMedium.text intValue];
    newJob.roomSmall = [roomSmall.text intValue];
    newJob.employees = [employees.text intValue];
    newJob.distence = [distence.text intValue];
    newJob.daysNeeded = [daysNeeded.text intValue];
    
    float total = [newJob total];
    totalLabel.text = [NSString stringWithFormat:@"$ %.2f to meet Baseline price",total];
    
}

- (void)removeNumberPad{
    [roomLarge resignFirstResponder];
    [roomSmall resignFirstResponder];
    [roomMedium resignFirstResponder];
    [employees resignFirstResponder];
    [distence resignFirstResponder];
    [daysNeeded resignFirstResponder];
}
@end
