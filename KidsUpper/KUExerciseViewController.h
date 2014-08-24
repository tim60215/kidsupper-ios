//
//  KUExerciseViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUKidsObject.h"
#import "GAITrackedViewController.h"

@protocol KUExerciseViewControllerDelegate <NSObject>

-(void)addKidsObject:(KUKidsObject *)kidsObject;

@end

@interface KUExerciseViewController : GAITrackedViewController <UITextFieldDelegate>
@property (weak, nonatomic) id<KUExerciseViewControllerDelegate>delegate;
@property (strong, nonatomic) IBOutlet UITextField *exerciseNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *exerciserTimeTextField;
- (IBAction)doneButton:(UIButton *)sender;


@end
