//
//  KUWeightViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUKidsObject.h"
#import "GAITrackedViewController.h"

@protocol KUWeightViewControllerDelegate <NSObject>

-(void)addKidsWeightObject:(KUKidsObject *)kidsObject;

@end

@interface KUWeightViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) id<KUWeightViewControllerDelegate>delegate;
@property (strong, nonatomic) IBOutlet UITextField *weightTextField;
- (IBAction)doneButton:(UIButton *)sender;


@end
