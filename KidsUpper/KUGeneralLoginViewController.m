//
//  KUGeneralLoginViewController.m
//  KidsUpper
//
//  Created by Mac on 8/16/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUGeneralLoginViewController.h"

@interface KUGeneralLoginViewController ()

@end

@implementation KUGeneralLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"generalLogin";
    self.activityIndicator.hidden = YES;
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"generalLogin"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"general login button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user &&!error) {
            //Open the wall
            [self performSegueWithIdentifier:@"generalLoginToTabBar" sender:self];
        }
        else {
            //Something bad has ocurred
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"輸入錯誤" message:@"帳號和密碼不相符" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
