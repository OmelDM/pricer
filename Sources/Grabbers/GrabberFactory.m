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

//+ (Grabber *)grabberForLink:(NSURL *)aLink
//{
//	NSString *theHost = [aLink host];
//	Grabber *theResult = nil;
//	if ([theHost isEqualToString:@"rozetka.ua"] || [theHost
//				isEqualToString:@"rozetka.com.ua"])
//	{
//		theResult = [[RozetkaGrabber alloc] initWithLink:aLink];
//	}
//	else if ([theHost isEqualToString:@"reima.in.ua"])
//	{
//		theResult = [[ReimaGrabber alloc] initWithLink:aLink];
//	}
//	else if ([theHost isEqualToString:@"coolkids.com.ua"])
//	{
//		theResult = [[CoolkidsGrabber alloc] initWithLink:aLink];
//	}
//	else if ([theHost isEqualToString:@"zimama.com.ua"])
//	{
//		theResult = [[ZimamaGrabber alloc] initWithLink:aLink];
//	}
//	
//	return [theResult autorelease];
//}

@end
