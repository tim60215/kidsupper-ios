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
    self.nickname = data[PLANET_NICKNAME];
    self.url = data[PLANET_URL];
    
    self.spaceImage = image;
    return self;

}


@end
