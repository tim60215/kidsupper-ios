//
//  KUExerciseViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUExerciseViewController.h"
#import "KUKidsObject.h"

@interface KUExerciseViewController ()

@end

@implementation KUExerciseViewController

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
    self.screenName = @"Type Exercise";
    self.exerciseNameTextField.delegate = self;
    self.exerciserTimeTextField.delegate = self;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(KUKidsObject *)returnNewKUKidsObject{
    KUKidsObject *addKidsObject = [[KUKidsObject alloc] init];
    addKidsObject.exerciseKind = self.exerciseNameTextField.text;
    addKidsObject.exerciseTime = self.exerciserTimeTextField.text;
    
    return addKidsObject;
    
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


- (IBAction)doneButton:(UIButton *)sender {
    KUKidsObject *newKidsObject = [self returnNewKUKidsObject];
    if (self.exerciseNameTextField.text.length!=0 && self.exerciserTimeTextField.text.length!=0) {
        PFObject *exerciseKind = [PFObject objectWithClassName:KIDS_EXERCISE_KIND];
        PFObject *exerciseTime = [PFObject objectWithClassName:KIDS_EXERCISE_TIME];
        [exerciseKind setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        [exerciseTime setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        exerciseKind[@"exerciseKind"] = newKidsObject.exerciseKind;
        exerciseTime[@"exerciseTime"] = newKidsObject.exerciseTime;
        
        [exerciseKind saveInBackground];
        [exerciseTime saveInBackground];
        
        
        [self.delegate addKidsObject:newKidsObject];
        
        
    }
    else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You haven't enter new records." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
    [self.delegate addKidsObject:[self returnNewKUKidsObject]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
