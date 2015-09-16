//
//  PRCCoolkidsGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PRCCoolkidsGrabber.h"

@implementation PRCCoolkidsGrabber

+ (instancetype)sharedGrabber
{
	static PRCCoolkidsGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[PRCCoolkidsGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//div[@class='product_price']";
}

@end
