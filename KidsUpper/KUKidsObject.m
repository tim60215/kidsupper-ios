//
//  KUKidsObject.m
//  KidsUpper
//
//  Created by Mac on 8/12/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "KUKidsObject.h"

@implementation KUKidsObject

-(id)init{
    self = [self initWithData:nil];
    return self;
    
}



-(id)initWithData:(NSDictionary *)data{
    self = [super init];
    
    self.name = data[KIDS_NAME];
    self.gender = data[KIDS_GENDER];
    self.age = [data[KIDS_AGE] intValue];
    self.height = [data[KIDS_HEIGHT] floatValue];
    self.weight = [data[KIDS_WEIGHT] floatValue];
    self.startSleepTime = data[KIDS_START_SLEEP_TIME];
    self.endSleepTime =data[KIDS_END_SLEEP_TIME];
    self.exerciseKind = data[KIDS_EXERCISE_KIND];
    self.exerciseTime = data[KIDS_EXERCISE_TIME];
    self.foodKind = data[KIDS_FOOD_KIND];
    self.foodAmount = data[KIDS_FOOD_AMOUNT];
    self.breakfastKind = data[KIDS_BREAKFAST_KIND];
    self.breakfastAmount = data[KIDS_BREAKFAST_AMOUNT];
    self.lunchKind = data[KIDS_LUNCH_KIND];
    self.lunchAmount = data[KIDS_LUNCH_AMOUNT];
    self.dinnerKind = data[KIDS_DINNER_KIND];
    self.dinnerAmount = data[KIDS_DINNER_AMOUNT];
    self.snackKind= data[KIDS_SNACK_KIND];
    self.snackAmount = data[KIDS_SNACK_AMOUNT];
    return self;
}
@end
