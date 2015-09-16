//
//  ZimamaGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 11/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ZimamaGrabber.h"


@implementation ZimamaGrabber

+ (instancetype)sharedGrabber
{
	static ZimamaGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[ZimamaGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//h3[@id='our_price_display']";
}

@end
