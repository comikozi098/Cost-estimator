//
//  MLKViewController.m
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/21/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import "MLKViewController.h"

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
    
    
    int rooms = 0;
    int workers = 0;
    int dist = 0;
    int days = 0;
    int total = 0;
    
    rooms = ([roomLarge.text intValue ]*2) + ([roomMedium.text intValue]*1.5) + [roomSmall.text intValue];
    workers = [employees.text intValue ];
    dist = [distence.text intValue];
    days = [daysNeeded.text intValue];
    total = (rooms + ((15*workers*8)*days) + (((dist*2*days)/18)*3.50));
    
    totalLabel.text = [NSString stringWithFormat:@"%d to meet Baseline price",total];
    
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
