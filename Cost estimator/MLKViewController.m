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
@synthesize roomLarge, roomSmall, roomMedium, employees, distence, totalLabel, daysNeeded,projectTitle,projectLabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeNumberPad)];
    [self.view addGestureRecognizer:tap];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)didTapCreateButton {
    if (self.job) {
        [self.delegate updateJob:self.projectTitle.text withTotalLabel:self.totalLabel atRow:self.row];
    } else {
        [self.delegate createJob:self.projectTitle.text withTotalLabel:self.totalLabel];
    }
    NSLog(@"create is tapped");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)estimatePrice:(id)sender {
    
    MLKJob *job = [[MLKJob alloc] init];
    job.roomLarge = [roomLarge.text intValue ];
    job.roomMedium = [roomMedium.text intValue];
    job.roomSmall = [roomSmall.text intValue];
    job.employees = [employees.text intValue];
    job.distence = [distence.text intValue];
    job.daysNeeded = [daysNeeded.text intValue];
    
    float total = [job total];
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
- (instancetype)initWithMLKJob:(MLKJob *)job atRow:(NSUInteger)row;{
    if (self = [super init]) {
        self.job = job;
        self.row = row;
    }
    return self;
}
@end
