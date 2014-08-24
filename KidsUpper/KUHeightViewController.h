//
//  KUHeightViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUKidsObject.h"
#import "GAITrackedViewController.h"

@protocol KUHeightViewControllerDelegate <NSObject>

-(void)addKidsObject:(KUKidsObject *)kidsObject;

@end

@interface KUHeightViewController : GAITrackedViewController <UITextFieldDelegate>

@property (weak, nonatomic) id<KUHeightViewControllerDelegate>delegate;
- (IBAction)doneButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *heightTextField;

@end
