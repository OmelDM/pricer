//
//  PRCRozetkaGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PRCRozetkaGrabber.h"

@interface PRCRozetkaGrabber ()


@end

@implementation PRCRozetkaGrabber

+ (instancetype)sharedGrabber
{
	static PRCRozetkaGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[PRCRozetkaGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//span[@itemprop='price']";
}

@end
