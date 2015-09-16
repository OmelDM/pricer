//
//  PRCGrabberFactory.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PRCGrabberFactory.h"

#import "PRCGrabber.h"
#import "PRCRozetkaGrabber.h"
#import "PRCReimaGrabber.h"
#import "PRCCoolkidsGrabber.h"
#import "PRCZimamaGrabber.h"

@implementation PRCGrabberFactory

+ (PRCGrabber *)grabberForURL:(NSURL *)aURL
{
	NSString *theHost = [aURL host];
	PRCGrabber *theResult = nil;
	
	if ([theHost isEqualToString:@"rozetka.ua"] || [theHost
				isEqualToString:@"rozetka.com.ua"])
	{
		theResult = [PRCRozetkaGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"reima.in.ua"])
	{
		theResult = [PRCReimaGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"coolkids.com.ua"])
	{
		theResult = [PRCCoolkidsGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"zimama.com.ua"])
	{
		theResult = [PRCZimamaGrabber sharedGrabber];
	}
	
	return theResult;
}

@end
