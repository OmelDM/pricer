//
//  CoolkidsGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "CoolkidsGrabber.h"

@implementation CoolkidsGrabber

+ (instancetype)sharedGrabber
{
	static CoolkidsGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[CoolkidsGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//div[@class='product_price']";
}

@end
