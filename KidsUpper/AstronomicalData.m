//
//  AstronomicalData.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/16/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "AstronomicalData.h"

@implementation AstronomicalData


+ (NSArray *)allKnownPlanets
{
    NSMutableArray *planetInformation = [@[] mutableCopy];
    
    NSDictionary *nullDictionary = @{PLANET_NAME : @"", PLANET_NICKNAME : @"", PLANET_URL : @"http://cart4-kidsupper.rhcloud.com/blog/"};
    [planetInformation addObject:nullDictionary];
    

    NSDictionary *mercuryDictionary = @{PLANET_NAME : @"正確的使用生長曲線圖", PLANET_NICKNAME : @"1 month, 3 weeks ago", PLANET_URL : @"http://cart4-kidsupper.rhcloud.com/blog/growthchart/"};
    [planetInformation addObject:mercuryDictionary];
    
    NSDictionary *venusDictionary = @{PLANET_NAME : @"你知道你的孩子最高能長多高嗎?", PLANET_NICKNAME : @"Posted by: timwang 1 month, 3 weeks ago", PLANET_URL : @"http://cart4-kidsupper.rhcloud.com/blog/how_tall/"};
    [planetInformation addObject:venusDictionary];
    
    NSDictionary *earthDictionary = @{PLANET_NAME : @"什麼是骨齡？", PLANET_NICKNAME : @"Posted by: timwang 1 month, 3 weeks ago", PLANET_URL : @"http://cart4-kidsupper.rhcloud.com/blog/what_is_bone_age/"};
    [planetInformation addObject:earthDictionary];
    
    return [planetInformation copy];
}

//+ (NSArray *)otherAstronomicalBodies
//{
//    NSMutableArray *astronomicalBodyInformation = [@[] mutableCopy];
//    
//    NSDictionary *sunDictionary = @{PLANET_NAME : @"Sun", PLANET_GRAVITY : @274, PLANET_DIAMETER : @1391000, PLANET_TEMPERATURE : @5505, PLANET_NICKNAME : @"Helios"};
//    [astronomicalBodyInformation addObject:sunDictionary];
//    
//    NSDictionary *moonDictionary = @{PLANET_NAME : @"Moon", PLANET_GRAVITY : @1.6, PLANET_DIAMETER : @3475, PLANET_YEAR_LENGTH : @27.3, PLANET_TEMPERATURE : @-20, PLANET_NUMBER_OF_MOONS : @0, PLANET_NICKNAME : @"Selene"};
//    [astronomicalBodyInformation addObject:moonDictionary];
//    
//    NSDictionary *internationalSpaceStation = @{PLANET_NAME : @"International Space Station", PLANET_NICKNAME : @"No Nickname"};
//    [astronomicalBodyInformation addObject:internationalSpaceStation];
//    
//    
//    return astronomicalBodyInformation;
//}

@end
