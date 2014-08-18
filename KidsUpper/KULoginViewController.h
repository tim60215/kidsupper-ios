//
//  KULoginViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"


@interface KULoginViewController : GAITrackedViewController <NSURLConnectionDataDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *logoImageView;
- (IBAction)signupButton:(UIButton *)sender;
- (IBAction)loginButton:(UIButton *)sender;
- (IBAction)loginWithFBButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
