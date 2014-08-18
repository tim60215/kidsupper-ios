//
//  KUSignupViewController.h
//  KidsUpper
//
//  Created by Mac on 8/16/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface KUSignupViewController : GAITrackedViewController  <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameEntry;
@property (strong, nonatomic) IBOutlet UITextField *passwordEntry;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordEntry;
@property (strong, nonatomic) IBOutlet UITextField *emailEntry;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)signupButton:(UIButton *)sender;

@end
