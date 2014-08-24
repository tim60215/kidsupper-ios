//
//  KUAddFoodViewController.m
//  KidsUpper
//
//  Created by Mac on 8/13/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUAddFoodViewController.h"
#import "VSDropdown.h"
#import "KUKidsObject.h"
@interface KUAddFoodViewController () <VSDropdownDelegate>{
    VSDropdown *_dropdown;
}


@end

@implementation KUAddFoodViewController

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
    self.screenName = @"Type Food";
    _dropdown = [[VSDropdown alloc]initWithDelegate:self];
    [_dropdown setAdoptParentTheme:YES];
    [_dropdown setShouldSortItems:YES];
    
    self.eatKindTextField.delegate = self;
    self.eatAmountTextField.delegate = self;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
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

-(KUKidsObject *)returnNewKUKidsObject{
    KUKidsObject *addKidsObject = [[KUKidsObject alloc] init];
    addKidsObject.foodKind= self.eatKindTextField.text;
    addKidsObject.foodAmount = self.eatAmountTextField.text;
    
    return addKidsObject;
    
}


- (IBAction)testAction:(UIButton *)sender {
    [self showDropDownForButton:sender adContents:@[@"晚餐",@"早餐",@"點心",@"宵夜",@"午餐", @"水果"]];
    
}

- (IBAction)doneButton:(UIBarButtonItem *)sender {
    KUKidsObject *newKidsObject = [self returnNewKUKidsObject];
    if (self.eatKindTextField.text.length!=0 && self.eatAmountTextField.text.length!=0) {
        PFObject *kidsFoodKind = [PFObject objectWithClassName:KIDS_FOOD_KIND];
        PFObject *kidsFoodAmount = [PFObject objectWithClassName:KIDS_FOOD_AMOUNT];
        [kidsFoodKind setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        [kidsFoodAmount setObject:[PFUser currentUser] forKey:kCCUserProfileKey];
        kidsFoodKind[@"kidsFoodKind"] = newKidsObject.foodKind;
        kidsFoodAmount[@"kidsFoodAmount"] = newKidsObject.foodAmount;
        
        [kidsFoodKind saveInBackground];
        [kidsFoodAmount saveInBackground];
        
        
        [self.delegate addKidsObject:newKidsObject];
        
        
    }
    else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You haven't enter new records." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
    [self.delegate addKidsObject:[self returnNewKUKidsObject]];
}








-(void)showDropDownForButton:(UIButton *)sender adContents:(NSArray *)contents
{
    [_dropdown setDrodownAnimation:rand()%2];
    
    [_dropdown setupDropdownForView:sender];
    
    [_dropdown reloadDropdownWithContents:contents andSelectedString:sender.titleLabel.text];
    
    
}


- (void)dropdown:(VSDropdown *)dropDown didSelectValue:(NSString *)str atIndex:(NSUInteger)index
{
    if ([dropDown.dropDownView isKindOfClass:[UIButton class]])
    {
        UIButton *btn = (UIButton *)dropDown.dropDownView;
        [btn setTitle:str forState:UIControlStateNormal];
        
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
