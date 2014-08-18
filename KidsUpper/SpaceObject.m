//
//  SpaceObject.m
//  Out of World
//
//  Created by Mac on 8/5/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import "SpaceObject.h"
#import "AstronomicalData.h"

@implementation SpaceObject

-(id)init{
    self = [self initWithData:nil andImage:nil];
    return self;

}

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gForce = [data[PLANET_GRAVITY] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interstfacts = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    return self;

}


@end
