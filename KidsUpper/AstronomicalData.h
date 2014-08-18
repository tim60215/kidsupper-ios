//
//  AstronomicalData.h
//  Out Of This World
//
//  Created by Teddy Wyly on 9/16/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PLANET_NAME @"blogTitle"
#define PLANET_NICKNAME @"blogPostDate"
#define PLANET_URL @"blogUrl"
#define PLANET_IMAGE @"Image of the Planet"

@interface AstronomicalData : NSObject

+ (NSArray *)allKnownPlanets; // Returns an array of NSDictionaries
//+ (NSArray *)otherAstronomicalBodies; // Returns an array of NSDictionaries


@end
