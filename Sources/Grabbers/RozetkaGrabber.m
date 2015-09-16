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

- (id)initWithLink:(NSURL *)aLink
{
	self = [super initWithLink:aLink];
	if (nil != self)
	{
		info = [NSMutableDictionary new];
	}
	return self;
}

- (void)dealloc
{
//	[info release];
//	[super dealloc];
}

- (NSDictionary *)info
{
//	NSError *theError = nil;
//	NSXMLDocument *thePage = [[[NSXMLDocument alloc] initWithContentsOfURL:[self link]
//				options:NSXMLDocumentTidyHTML error:&theError] autorelease];
//	theError = nil;
//	NSNumber *thePrice = [[[thePage nodesForXPath:@"//span[@itemprop='price']"
//				error:&theError] lastObject] objectValue];			
//	
//	return [NSDictionary dictionaryWithObjectsAndKeys:[NSDictionary
//				dictionaryWithObject:thePrice forKey:@"price"], @"rozetkaColumn", nil];
}

@end
