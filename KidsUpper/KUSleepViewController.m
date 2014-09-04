//
//  KUSleepViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUSleepViewController.h"
#import "KUKidsObject.h"

@interface KUSleepViewController ()

@end

@implementation KUSleepViewController

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
    self.screenName = @"Type Sleep";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - datepickker helper

/*
 * Is called when the date is changed by the user.
 */
- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
    NSDate *date = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm-dd hh:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:date];
    self.startSleepTimeLabel.text = stringFromDate;
}

- (void)changeendDate:(UIDatePicker *)endsender {
    NSLog(@"New Date: %@", endsender.date);
    NSDate *date = endsender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm-dd hh:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:date];
    self.endSleepTimeLabel.text = stringFromDate;
}


/*
 * Releases the background, datepicker and toolbar.
 */
- (void)removeViews:(id)object {
    
    /*
     *  Releases the background view.
     */
    [[self.view viewWithTag:9] removeFromSuperview];
    /*
     *  Releases the datepicker.
     */
    [[self.view viewWithTag:10] removeFromSuperview];
    /*
     *  Releases the toolbar.
     */
    [[self.view viewWithTag:11] removeFromSuperview];
}


/*
 * Hides the datapicker.
 */
- (void)dismissDatePicker:(id)sender {
    
    /*
     * Create a variable with the target position and size for hiding the toolbar.
     */
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    /*
     * Create a variable with the target position and size for hiding the datepicker.
     */
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height + 44, 320, 216);
    
    
    /*
     * Send start animation message to UIView.
     */
    [UIView beginAnimations:@"MoveOut" context:nil];
    /*
     * Set the transparency for hiding the background view.
     */
    [self.view viewWithTag:9].alpha = 0;
    /*
     * Set the target position for hiding the datepicker.
     */
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    /*
     * Set the target position for hiding the toolbar.
     */
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    /*
     * The method setAnimationDelegate enables knowledge on start and end of the animation.
     */
    [UIView setAnimationDelegate:self];
    /*
     * Calls the removeViews method at the end of the animation.
     */
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    /*
     * Commits the animation thread for execution.
     */
    [UIView commitAnimations];
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
    addKidsObject.startSleepTime = self.startSleepTimeLabel.text;
    addKidsObject.endSleepTime = self.endSleepTimeLabel.text;
    
    return addKidsObject;
    
}

- (IBAction)doneButton:(UIButton *)sender {
    KUKidsObject *newKidsObject = [self returnNewKUKidsObject];
    if (self.startSleepTimeLabel.text.length!=0 && self.endSleepTimeLabel.text.length!=0) {
        PFObject *kidsStartSleepTime = [PFObject objectWithClassName:KIDS_START_SLEEP_TIME];
        PFObject *kidsEndSleepTime = [PFObject objectWithClassName:KIDS_END_SLEEP_TIME];
        [kidsStartSleepTime setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        [kidsEndSleepTime setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        kidsStartSleepTime[@"startSleepTime"] = newKidsObject.startSleepTime;
        kidsEndSleepTime[@"endSleepTime"] = newKidsObject.endSleepTime;
        
        [kidsStartSleepTime saveInBackground];
        [kidsEndSleepTime saveInBackground];
        
        //        [[NSUserDefaults standardUserDefaults] setObject:self.weightTextField.text forKey:KIDS_WEIGHT];
        //        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.delegate addKidsObject:newKidsObject];
        
    }
    else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You haven't enter new records." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
     [self.delegate addKidsObject:[self returnNewKUKidsObject]];
    
}

- (IBAction)startSleepTimeButton:(id)sender {
    /*
     * If view with tag exists ignore the rest of the code and exit.
     */
    if([self.view viewWithTag:9]) {
        return;
    }
    
    
    /*
     * Create a variable with the target position and size for showing the toolbar.
     */
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height - 216 - 44, 320, 44);
    /*
     * Create a variable with the target position and size for showing the datepicker.
     */
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height - 216, 320, 216);
    
    
    /*
     * Instantiate a UIView with the frame size of the existing view.
     */
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    /*
     * Set the transparency.
     */
    darkView.alpha = 0;
    /*
     * Set the background color.
     */
    darkView.backgroundColor = [UIColor blackColor];
    /*
     * Set a tag for the UIView instance to reference it by tag.
     */
    darkView.tag = 9;
    /*
     * Setup a tap gesture listener that calls the dismissDatePicker method on tap.
     */
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    /*
     * Add the tap gesture listener to the UIView.
     */
    [darkView addGestureRecognizer:tapGesture];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:darkView];
    
    
    /*
     * Instantiate a UIDatePicker and set the initial frame with the datepicker outside of the view.
     */
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    /*
     * Set a tag for the UIDatePicker instance to reference it by tag.
     */
    datePicker.tag = 10;
    /*
     * Add a listener that listens for changing values in the datepicker which then calls the change date method.
     */
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:datePicker];
    
    
    /*
     * Instantiate a UIToolbar and set the initial frame with the toolbar outside of the view.
     */
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    /*
     * Set a tag for the UIToolbar instance to reference it by tag.
     */
    toolBar.tag = 11;
    /*
     * Set a style for the UIToolbar.
     */
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    /*
     * Instantiate a spacer UIBarButtonItem.
     */
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    /*
     * Instantiate a done UIBarButtonItem on click this will call the dismissDatePicker method.
     */
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    /*
     * Set the created UIBarButtonItems to the toolbar.
     */
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:toolBar];
    
    
    /*
     * Start animation.
     */
    [UIView beginAnimations:@"MoveIn" context:nil];
    /*
     * Set the target position for showing the toolbar.
     */
    toolBar.frame = toolbarTargetFrame;
    /*
     * Set the target position for showing the datepicker.
     */
    datePicker.frame = datePickerTargetFrame;
    /*
     * Set the transparency for showing background view.
     */
    darkView.alpha = 0.5;
    /*
     * Commits the animation thread for execution.
     */
    [UIView commitAnimations];
}

- (IBAction)endSleepTime:(UIButton *)endsender {
    /*
     * If view with tag exists ignore the rest of the code and exit.
     */
    if([self.view viewWithTag:9]) {
        return;
    }
    
    
    /*
     * Create a variable with the target position and size for showing the toolbar.
     */
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height - 216 - 44, 320, 44);
    /*
     * Create a variable with the target position and size for showing the datepicker.
     */
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height - 216, 320, 216);
    
    
    /*
     * Instantiate a UIView with the frame size of the existing view.
     */
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    /*
     * Set the transparency.
     */
    darkView.alpha = 0;
    /*
     * Set the background color.
     */
    darkView.backgroundColor = [UIColor blackColor];
    /*
     * Set a tag for the UIView instance to reference it by tag.
     */
    darkView.tag = 9;
    /*
     * Setup a tap gesture listener that calls the dismissDatePicker method on tap.
     */
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    /*
     * Add the tap gesture listener to the UIView.
     */
    [darkView addGestureRecognizer:tapGesture];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:darkView];
    
    
    /*
     * Instantiate a UIDatePicker and set the initial frame with the datepicker outside of the view.
     */
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    /*
     * Set a tag for the UIDatePicker instance to reference it by tag.
     */
    datePicker.tag = 10;
    /*
     * Add a listener that listens for changing values in the datepicker which then calls the change date method.
     */
    [datePicker addTarget:self action:@selector(changeendDate:) forControlEvents:UIControlEventValueChanged];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:datePicker];
    
    
    /*
     * Instantiate a UIToolbar and set the initial frame with the toolbar outside of the view.
     */
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    /*
     * Set a tag for the UIToolbar instance to reference it by tag.
     */
    toolBar.tag = 11;
    /*
     * Set a style for the UIToolbar.
     */
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    /*
     * Instantiate a spacer UIBarButtonItem.
     */
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    /*
     * Instantiate a done UIBarButtonItem on click this will call the dismissDatePicker method.
     */
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    /*
     * Set the created UIBarButtonItems to the toolbar.
     */
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    /*
     * Adds the subview on top of all the other subviews.
     */
    [self.view addSubview:toolBar];
    
    
    /*
     * Start animation.
     */
    [UIView beginAnimations:@"MoveIn" context:nil];
    /*
     * Set the target position for showing the toolbar.
     */
    toolBar.frame = toolbarTargetFrame;
    /*
     * Set the target position for showing the datepicker.
     */
    datePicker.frame = datePickerTargetFrame;
    /*
     * Set the transparency for showing background view.
     */
    darkView.alpha = 0.5;
    /*
     * Commits the animation thread for execution.
     */
    [UIView commitAnimations];

}

@end
