//
//  Grabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "Grabber.h"

@interface Grabber ()

@property (strong) NSURL *link;

@end

@implementation Grabber

@synthesize delegate;

- (id)initWithLink:(NSURL *)aLink
{
	self = [super init];
	if (nil != self)
	{
		self.link = aLink;
	}
	return self;
}

- (NSDictionary *)info
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

- (void)grab
{
	if ([self.delegate respondsToSelector:@selector(grabber:didFinishGrabbingInfo:)])
	{
		[self.delegate grabber:self didFinishGrabbingInfo:[self info]];
	}
}

@end
