//
//  MLKViewController.h
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/21/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLKJob;
@protocol MLKViewControllerDelegate
- (void)createJob:(NSString *)job withTotalLabel:(UILabel *)totalLabel;
- (void)updateJob:(NSString *)job withTotalLabel:(UILabel *)totalLabel atRow:(NSUInteger)row;
@end
@interface MLKViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *roomLarge;
@property (weak, nonatomic) IBOutlet UITextField *roomMedium;
@property (weak, nonatomic) IBOutlet UITextField *roomSmall;
@property (weak, nonatomic) IBOutlet UITextField *employees;
@property (weak, nonatomic) IBOutlet UITextField *distence;
@property (weak, nonatomic) IBOutlet UITextField *daysNeeded;
@property (weak, nonatomic) IBOutlet UITextField *projectTitle;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) id<MLKViewControllerDelegate>delegate;
@property (strong, nonatomic) MLKJob *job;
@property (assign, nonatomic) NSUInteger row;
- (instancetype)initWithMLKJob:(MLKJob *)job atRow:(NSUInteger)row;


- (IBAction)didTapCreateButton;
- (IBAction)estimatePrice:(id)sender;


@end
