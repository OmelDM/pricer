//
//  Item.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/18/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import <dispatch/dispatch.h>

@implementation Item

@synthesize name;

//+ (id)itemWithName:(NSString *)aName
//{
//	return [[[Item alloc] initWithName:aName] autorelease];
//}
//
//- (id)initWithName:(NSString *)aName
//{
//	self = [super init];
//	if (nil != self)
//	{
//		name = [aName retain];
//		info = [NSMutableDictionary new];
//	}
//	return self;
//}
//
//- (void)dealloc
//{
//	[name release];
//	[info release];
//	[super dealloc];
//}
//
//- (NSNumber *)priceInShop:(NSString *)aShopName
//{
//	return [[info objectForKey:aShopName] objectForKey:@"price"];
//}
//
//- (void)grabber:(Grabber *)aGrabber didFinishGrabbingInfo:(NSDictionary *)anInfo
//{
//	dispatch_async(dispatch_get_main_queue(), ^(void)
//	{
//		[info addEntriesFromDictionary:anInfo];
//		[[NSNotificationCenter defaultCenter] postNotificationName:@"com.update" object:self];
//	});
//}

@end
