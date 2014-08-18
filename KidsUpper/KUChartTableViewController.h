//
//  KUChartTableViewController.h
//  KidsUpper
//
//  Created by Mac on 8/18/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"
#import "KUHeightViewController.h"

@interface KUChartTableViewController : UITableViewController <PNChartDelegate,KUHeightViewControllerDelegate>

@property (nonatomic) PNBarChart * barChart;


@end
