//
//  KUThirdViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"


@interface KUThirdViewController : GAITrackedViewController
@property (strong, nonatomic) IBOutlet UISwitch *manSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *womanSwitch;
@property (strong, nonatomic) IBOutlet UISlider *ageSlider;
- (IBAction)logoutButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;




@end
