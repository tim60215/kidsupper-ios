//
//  KUThirdViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUThirdViewController.h"

@interface KUThirdViewController ()
@end

@implementation KUThirdViewController

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
    self.screenName = @"setting";
    self.navigationItem.hidesBackButton = YES;
    self.ageSlider.value = [[NSUserDefaults standardUserDefaults] integerForKey:kCCAgeMaxEnabledKey];
    self.manSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:kCCManEnabledKey];
    self.womanSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:kCCWomanEnabledKey];
    
    [self.ageSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.manSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.womanSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.ageLabel.text = [NSString stringWithFormat:@"%i", (int)self.ageSlider.value];
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

#pragma mark - helper
-(void)valueChanged:(id)sender{
    if (sender == self.ageSlider) {
        [[NSUserDefaults standardUserDefaults] setInteger:(int)self.ageSlider.value forKey:kCCAgeMaxEnabledKey];
        self.ageLabel.text = [NSString stringWithFormat:@"%i", (int)self.ageSlider.value];
    }
    else if (sender == self.manSwitch){
        [[NSUserDefaults standardUserDefaults] setBool:self.manSwitch.isOn forKey:kCCManEnabledKey];
    }
    else if (sender == self.womanSwitch){
        [[NSUserDefaults standardUserDefaults] setBool:self.womanSwitch.isOn forKey:kCCWomanEnabledKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)logoutButton:(UIButton *)sender {
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"setting"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"logout button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

}



@end
