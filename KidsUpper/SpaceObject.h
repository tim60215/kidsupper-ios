//
//  SpaceObject.h
//  Out of World
//
//  Created by Mac on 8/5/14.
//  Copyright (c) 2014 MTI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic)NSString *nickname;
@property (strong, nonatomic) NSURL *url;

@property (strong, nonatomic)UIImage *spaceImage;


-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
