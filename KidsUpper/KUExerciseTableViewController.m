//
//  KUExerciseTableViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUExerciseTableViewController.h"
#import "KUKidsObject.h"
#import "GAIDictionaryBuilder.h"

@interface KUExerciseTableViewController ()
@property (strong, nonatomic) NSArray *exerciseKind;
@property (strong, nonatomic) PFObject *myExerciseKind;
@property (strong, nonatomic) NSArray *exerciseTime;
@property (strong, nonatomic) PFObject *myExerciseTime;
@end

@implementation KUExerciseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    PFQuery *query = [PFQuery queryWithClassName:KIDS_EXERCISE_KIND];
    PFQuery *queryTime = [PFQuery queryWithClassName:KIDS_EXERCISE_TIME];
    [query includeKey:kCCUserProfileKey];
    [queryTime includeKey:kCCUserProfileKey];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.exerciseKind = objects;
            NSLog(@"%@", self.exerciseKind);
            [self.tableView reloadData];
        }
        else NSLog(@"%@",error);
    }];
    [queryTime findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.exerciseTime = objects;
            NSLog(@"%@", self.exerciseTime);
            [self.tableView reloadData];
        }
        else NSLog(@"%@",error);
    }];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Exercise Table"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.exerciseKind count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    self.myExerciseKind = [self.exerciseKind objectAtIndex:indexPath.row];
    self.myExerciseTime = [self.exerciseTime objectAtIndex:indexPath.row];
    NSLog(@"%@",self.exerciseKind);
    cell.textLabel.text =[NSString stringWithFormat:@"從事 %@ ", [self.myExerciseKind objectForKey:@"exerciseKind"]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"長達 %@ 分鐘",[self.myExerciseTime objectForKey:@"exerciseTime"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    // Configure the cell...
     return cell;
}
-(void)addKidsObject:(KUKidsObject *)kidsObject;{
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
