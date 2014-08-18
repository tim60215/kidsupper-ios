//
//  KUHeightTableViewController.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUHeightViewController.h"

@interface KUHeightTableViewController : UITableViewController <KUHeightViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) KUKidsObject *kids;
@property (strong, nonatomic) NSMutableArray *addkidsObject;

@end
