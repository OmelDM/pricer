//
//  GrabberFactory.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "GrabberFactory.h"

#import "Grabber.h"
#import "RozetkaGrabber.h"
#import "ReimaGrabber.h"
#import "CoolkidsGrabber.h"
#import "ZimamaGrabber.h"

@implementation GrabberFactory

+ (Grabber *)grabberForURL:(NSURL *)aURL
{
	NSString *theHost = [aURL host];
	Grabber *theResult = nil;
	
	if ([theHost isEqualToString:@"rozetka.ua"] || [theHost
				isEqualToString:@"rozetka.com.ua"])
	{
		theResult = [RozetkaGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"reima.in.ua"])
	{
		theResult = [ReimaGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"coolkids.com.ua"])
	{
		theResult = [CoolkidsGrabber sharedGrabber];
	}
	else if ([theHost isEqualToString:@"zimama.com.ua"])
	{
		theResult = [ZimamaGrabber sharedGrabber];
	}
	
	return theResult;
}

@end
