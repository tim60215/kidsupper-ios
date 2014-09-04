//
//  KUHeightViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUHeightViewController.h"

@interface KUHeightViewController ()

@end

@implementation KUHeightViewController

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
    self.screenName = @"Type Height";
    self.heightTextField.delegate = self;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
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

-(KUKidsObject *)returnNewKUKidsObject{
    KUKidsObject *addKidsObject = [[KUKidsObject alloc] init];
    addKidsObject.height = [self.heightTextField.text floatValue];
    
    return addKidsObject;

}

- (IBAction)doneButton:(UIButton *)sender {
    KUKidsObject *newKidsObject = [self returnNewKUKidsObject];
    if (self.heightTextField.text.length!=0) {
        PFObject *kidsHeight = [PFObject objectWithClassName:KIDS_HEIGHT];
        [kidsHeight setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        kidsHeight[@"height"] = @(newKidsObject.height);
        [kidsHeight saveInBackground];
        
//        [[NSUserDefaults standardUserDefaults] setObject:self.heightTextField.text forKey:KIDS_HEIGHT];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.delegate addKidsObject:newKidsObject];
        
    }
    else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You haven't enter new records." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
     [self.delegate addKidsObject:[self returnNewKUKidsObject]];
    
}

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.heightTextField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [self.heightTextField resignFirstResponder];
        return NO;
    }
    return YES;
    
}
@end
