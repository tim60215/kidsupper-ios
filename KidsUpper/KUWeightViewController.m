//
//  KUWeightViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUWeightViewController.h"
#import "KUKidsObject.h"

@interface KUWeightViewController ()

@end

@implementation KUWeightViewController

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
//    self.screenName = @"TypeWeight";
    self.weightTextField.delegate = self;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(KUKidsObject *)returnNewKUKidsObject{
    KUKidsObject *addKidsWeightObject = [[KUKidsObject alloc] init];
    addKidsWeightObject.weight = [self.weightTextField.text floatValue];
    
    return addKidsWeightObject;
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [self.weightTextField resignFirstResponder];
        return NO;
    }
    return YES;
    
}



- (IBAction)doneButton:(UIButton *)sender {
    KUKidsObject *newKidsObject = [self returnNewKUKidsObject];
    if (self.weightTextField.text.length!=0) {
        PFObject *kidsWeight = [PFObject objectWithClassName:KIDS_WEIGHT];
        [kidsWeight setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        kidsWeight[@"myKidsWeight"] = @(newKidsObject.weight);
        [kidsWeight saveInBackground];
        NSLog(@"%@", kidsWeight[@"myKidsWeight"]);
        
//        [[NSUserDefaults standardUserDefaults] setObject:self.weightTextField.text forKey:KIDS_HEIGHT];
//        [[NSUserDefaults standardUserDefaults] synchronize];
    [self.delegate addKidsWeightObject:newKidsObject];
        
    }
    else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You haven't enter new records." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
    
    [self.delegate addKidsWeightObject:[self returnNewKUKidsObject]];
    
}

@end
