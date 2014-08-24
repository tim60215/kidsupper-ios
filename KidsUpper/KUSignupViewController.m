//
//  KUSignupViewController.m
//  KidsUpper
//
//  Created by Mac on 8/16/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUSignupViewController.h"

@interface KUSignupViewController ()

@end

@implementation KUSignupViewController

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
    self.screenName = @"signUp";
    self.activityIndicator.hidden = YES;
    self.usernameEntry.delegate = self;
    self.passwordEntry.delegate = self;
    self.confirmPasswordEntry.delegate = self;
    self.emailEntry.delegate = self;

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

- (IBAction)signupButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"signUp"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"sign up button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    //1
    PFUser *user = [PFUser user];
    //2
    user.username = self.usernameEntry.text;
    user.password = self.passwordEntry.text;
    user.email = self.emailEntry.text;
    //3
    if ([self.passwordEntry.text isEqualToString:self.confirmPasswordEntry.text]){
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //The registration was successful, go to the wall
            [self performSegueWithIdentifier:@"signUptoTabBarSegue" sender:self];
            
        }
        else {
            //Something bad has occurred
            
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"輸入錯誤" message:@"密碼必須和確認密碼一致！" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    }
    else {
        //Something bad has occurred
        
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"輸入錯誤" message:@"密碼必須和確認密碼一致！" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
    }
    
    }

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.usernameEntry resignFirstResponder];
    [self.passwordEntry resignFirstResponder];
    [self.emailEntry resignFirstResponder];
    [self.confirmPasswordEntry resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.usernameEntry resignFirstResponder];
    [self.passwordEntry resignFirstResponder];
    [self.emailEntry resignFirstResponder];
    [self.confirmPasswordEntry resignFirstResponder];
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [self.usernameEntry resignFirstResponder];
        [self.passwordEntry resignFirstResponder];
        [self.emailEntry resignFirstResponder];
        [self.confirmPasswordEntry resignFirstResponder];
        return NO;
    }
    return YES;
    
}


@end
