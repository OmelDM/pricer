//
//  ReimaGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ReimaGrabber.h"


@implementation ReimaGrabber

- (id)initWithLink:(NSURL *)aLink
{
	self = [super initWithLink:aLink];
	if (nil != self)
	{
		info = [NSMutableDictionary new];
	}
	return self;
}

//- (void)dealloc
//{
//	[info release];
//	[super dealloc];
//}

//- (NSDictionary *)info
//{
//	NSError *theError = nil;
//	NSXMLDocument *thePage = [[[NSXMLDocument alloc] initWithContentsOfURL:[self link]
//				options:NSXMLDocumentTidyHTML error:&theError] autorelease];
//	theError = nil;
//	NSNumber *thePrice = [[[thePage nodesForXPath:@"//span[@class='jsTotal total']"
//				error:&theError] lastObject] objectValue];			
//	
//	return [NSDictionary dictionaryWithObjectsAndKeys:[NSDictionary
//				dictionaryWithObject:thePrice forKey:@"price"], @"reimaColumn", nil];
//}

@end
