//
//  KUFirstViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUFirstViewController.h"

@interface KUFirstViewController () 

@end

@implementation KUFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"first";
//    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.navigationItem.hidesBackButton = YES;
    


	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}
- (IBAction)heightRecordButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"first"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"type height button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];

}
- (IBAction)weightRecordButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"first"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"type weight button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];


}
- (IBAction)sleepRecorButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"first"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"type sleep button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];


}
- (IBAction)exerciseRecordButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"first"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"type exercise button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];


}
- (IBAction)eatRecordButton:(UIButton *)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"first"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"type eat button"          // Event label
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];


}

#pragma mark - slideBar Menu
-(void)loadView{
    [super loadView];
    
}




@end
