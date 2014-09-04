//
//  KUIntroBarViewController.m
//  KidsUpper
//
//  Created by Mac on 8/26/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUIntroBarViewController.h"
#import "MYCustomPanel.h"


@interface KUIntroBarViewController ()

@end

@implementation KUIntroBarViewController

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
-(void)viewDidAppear:(BOOL)animated{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"hasSeenTutorial"])
    {
        [self buildIntro];
    }

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
-(void)buildIntro{
    //Create Stock Panel with header
    UIView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TestHeader" owner:nil options:nil][0];
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"歡迎使用 KidsUpper" description:@"天天記錄孩子的生活習慣，了解影響身高的因素" image:[UIImage imageNamed:@"recordintro.png"] header:headerView];
    
    //Create Stock Panel With Image
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"\n\n\n你知道自己的孩子能長多高嗎？" description:@"男生：（爸爸的身高＋媽媽的身高＋11）/2 ±7.5\n女生：（爸爸的身高＋媽媽的身高＋11）/2 ±6.5\n\n保持良好的生活習慣，讓孩子能到應得的身高!\n每天追蹤統計數據，健康長高沒煩惱！" image:[UIImage imageNamed:@"changeintro.png"]];
    
    //Create Panel From Nib
    MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"TestPanel3"];
    
    //Create custom panel with events
    MYCustomPanel *panel4 = [[MYCustomPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"MYCustomPanel"];
    
    //Add panels to an array
    NSArray *panels = @[panel1, panel2, panel3, panel4];
    
    //Create the introduction view and set its delegate
    MYBlurIntroductionView *introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
    introductionView.BackgroundImageView.image = [UIImage imageNamed:@"happy kids.jpg"];
    [introductionView setBackgroundColor:[UIColor colorWithRed:90.0f/255.0f green:175.0f/255.0f blue:113.0f/255.0f alpha:0.65]];
    //introductionView.LanguageDirection = MYLanguageDirectionRightToLeft;
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
}

#pragma mark - MYIntroduction Delegate

-(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex{
//    NSLog(@"Introduction did change to panel %d", panelIndex);
    
    //You can edit introduction view properties right from the delegate method!
    //If it is the first panel, change the color to green!
    if (panelIndex == 0) {
        [introductionView setBackgroundColor:[UIColor colorWithRed:90.0f/255.0f green:175.0f/255.0f blue:113.0f/255.0f alpha:0.65]];
    }
    //If it is the second panel, change the color to blue!
    else if (panelIndex == 1){
        [introductionView setBackgroundColor:[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:0.65]];
    }
}

-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType {
    NSLog(@"Introduction did finish");
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSeenTutorial"];
}


@end
