//
//  KUSleepViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUKidsObject.h"
#import "GAITrackedViewController.h"


@protocol KUSleepViewControllerDelegate <NSObject>

-(void)addKidsObject:(KUKidsObject *)kidsObject;

@end

@interface KUSleepViewController : GAITrackedViewController

@property (weak, nonatomic) id<KUSleepViewControllerDelegate>delegate;
- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)startSleepTimeButton:(UIButton *)sender;
- (IBAction)endSleepTime:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *startSleepTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endSleepTimeLabel;



@end
