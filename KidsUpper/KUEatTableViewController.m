//
//  KUEatTableViewController.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUEatTableViewController.h"
#import "GAIDictionaryBuilder.h"

@interface KUEatTableViewController ()
@property (strong, nonatomic) NSArray *foodKind;
@property (strong, nonatomic) PFObject *myFoodKind;
@property (strong, nonatomic) NSArray *foodAmount;
@property (strong, nonatomic) PFObject *myFoodAmount;

@end

@implementation KUEatTableViewController

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
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    PFQuery *query = [PFQuery queryWithClassName:KIDS_FOOD_KIND];
    PFQuery *queryAmount = [PFQuery queryWithClassName:KIDS_FOOD_AMOUNT];
    [query includeKey:kCCUserProfileKey];
    [queryAmount includeKey:kCCUserProfileKey];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.foodKind = objects;
            NSLog(@"%@", self.foodKind);
            [self.tableView reloadData];
        }
        else NSLog(@"%@",error);
    }];
    [queryAmount findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.foodAmount = objects;
            NSLog(@"%@", self.foodAmount);
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
    [tracker set:kGAIScreenName value:@"Eat Table"];
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
    return [self.foodKind count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    self.myFoodKind = [self.foodKind objectAtIndex:indexPath.row];
    self.myFoodAmount = [self.foodAmount objectAtIndex:indexPath.row];
    NSLog(@"%@",self.foodKind);
    cell.textLabel.text = [NSString stringWithFormat:@"吃了 %@ ", [self.myFoodKind objectForKey:@"kidsFoodKind"]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%@ 份", [self.myFoodAmount objectForKey:@"kidsFoodAmount"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    // Configure the cell...
    return cell;
}

-(void)addKidsObject:(KUKidsObject *)kidsObject{
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
