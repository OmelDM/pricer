//
//  RozetkaGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "RozetkaGrabber.h"

@interface RozetkaGrabber ()


@end

@implementation RozetkaGrabber

+ (instancetype)sharedGrabber
{
	static RozetkaGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[RozetkaGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//span[@itemprop='price']";
}

@end
