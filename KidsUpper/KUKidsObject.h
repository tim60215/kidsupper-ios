//
//  KUKidsObject.h
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KIDS_NAME @"Kids Name"
#define KIDS_GENDER @"Gender"
#define KIDS_AGE @"Age"
#define KIDS_HEIGHT @"Height"
#define KIDS_WEIGHT @"myKidsWeight"
#define KIDS_START_SLEEP_TIME @"startSleepTime"
#define KIDS_END_SLEEP_TIME @"endSleepTime"
#define KIDS_EXERCISE_KIND @"exerciseKind"
#define KIDS_EXERCISE_TIME @"exerciseTime"
#define KIDS_FOOD_KIND @"kidsFoodKind"
#define KIDS_FOOD_AMOUNT @"kidsFoodAmount"
#define KIDS_BREAKFAST_KIND @"BreakfastKind"
#define KIDS_BREAKFAST_AMOUNT @"BreakfastAmount"
#define KIDS_LUNCH_KIND @"LunchKind"
#define KIDS_LUNCH_AMOUNT @"LunchAmount"
#define KIDS_DINNER_KIND @"DinnerKind"
#define KIDS_DINNER_AMOUNT @"DinnerAmount"
#define KIDS_SNACK_KIND @"SnackKind"
#define KIDS_SNACK_AMOUNT @"SnackAmount"

@interface KUKidsObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (nonatomic) int age;
@property (nonatomic) float height;
@property (nonatomic) float weight;
@property (strong, nonatomic) NSString *startSleepTime;
@property (strong, nonatomic) NSString *endSleepTime;
@property (strong, nonatomic) NSString *exerciseKind;
@property (strong, nonatomic) NSString *exerciseTime;
@property (strong, nonatomic) NSString *foodKind;
@property (strong, nonatomic) NSString *foodAmount;
@property (strong, nonatomic) NSString *breakfastKind;
@property (strong, nonatomic) NSString *breakfastAmount;
@property (strong, nonatomic) NSString *lunchKind;
@property (strong, nonatomic) NSString *lunchAmount;
@property (strong, nonatomic) NSString *dinnerKind;
@property (strong, nonatomic) NSString *dinnerAmount;
@property (strong, nonatomic) NSString *snackKind;
@property (strong, nonatomic) NSString *snackAmount;

-(id)initWithData:(NSDictionary *)data;
@end
