//
//  KUAddFoodViewController.h
//  KidsUpper
//
//  Created by Mac on 8/13/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUKidsObject.h"
#import "GAITrackedViewController.h"

@protocol KUAddFoodViewControllerDelegate <NSObject>


-(void)addKidsObject:(KUKidsObject *)kidsObject;

@end


@interface KUAddFoodViewController : GAITrackedViewController <UITextFieldDelegate>
@property (strong, nonatomic) id<KUAddFoodViewControllerDelegate>delegate;
- (IBAction)testAction:(UIButton *)sender;
- (IBAction)doneButton:(UIBarButtonItem *)sender;




@property (strong, nonatomic) IBOutlet UITextField *eatKindTextField;
@property (strong, nonatomic) IBOutlet UITextField *eatAmountTextField;


@end
