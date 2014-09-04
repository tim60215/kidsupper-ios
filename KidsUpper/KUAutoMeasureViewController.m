//
//  KUAutoMeasureViewController.m
//  KidsUpper
//
//  Created by Mac on 8/29/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUAutoMeasureViewController.h"

@interface KUAutoMeasureViewController ()

@end

@implementation KUAutoMeasureViewController

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

- (IBAction)finishButton:(UIButton *)sender {
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (IBAction)startButton:(UIButton *)sender {
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:0.125];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    NSLog(@"%f, %f, %f, %f", acceleration.x, acceleration.y, acceleration.z, acceleration.timestamp);
}
@end
