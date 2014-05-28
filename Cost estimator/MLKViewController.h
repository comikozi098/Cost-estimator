//
//  MLKViewController.h
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/21/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLKViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *roomLarge;
@property (weak, nonatomic) IBOutlet UITextField *roomMedium;
@property (weak, nonatomic) IBOutlet UITextField *roomSmall;
@property (weak, nonatomic) IBOutlet UITextField *employees;
@property (weak, nonatomic) IBOutlet UITextField *distence;
@property (weak, nonatomic) IBOutlet UITextField *daysNeeded;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
- (IBAction)estimatePrice:(id)sender;


@end
