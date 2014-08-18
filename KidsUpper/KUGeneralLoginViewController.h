//
//  KUGeneralLoginViewController.h
//  KidsUpper
//
//  Created by Mac on 8/16/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface KUGeneralLoginViewController : GAITrackedViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)loginButton:(UIButton *)sender;

@end
