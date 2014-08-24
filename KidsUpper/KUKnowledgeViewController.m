//
//  KUKnowledgeViewController.m
//  KidsUpper
//
//  Created by Mac on 8/20/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUKnowledgeViewController.h"

@interface KUKnowledgeViewController ()

@end

@implementation KUKnowledgeViewController

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
    self.screenName = @"knowledge";
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

- (IBAction)growthButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"height knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * app =  [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/height/"]];

}

- (IBAction)eatButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"eat knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * eatapp =  [UIApplication sharedApplication];
    [eatapp openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/eat/"]];
}

- (IBAction)exerciseButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"exercise knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * exerciseapp =  [UIApplication sharedApplication];
    [exerciseapp openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/exercise/"]];
}

- (IBAction)sleepButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"sleep knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * sleepapp =  [UIApplication sharedApplication];
    [sleepapp openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/sleep/"]];
}

- (IBAction)parentsButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"parents knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * parentapp =  [UIApplication sharedApplication];
    [parentapp openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/parents/"]];
}

- (IBAction)eduButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"knowledge"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"education knowledge button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

    UIApplication * eduapp =  [UIApplication sharedApplication];
    [eduapp openURL:[NSURL URLWithString:@"http://tim60215.wix.com/kidsupper#!home/cp8y/Tag/education/"]];
}
@end
