//
//  Grabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "Grabber.h"
#import "NSStringExtensions.h"

@interface Grabber ()

@end

@implementation Grabber

+ (instancetype)sharedGrabber
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

- (NSString *)XPathToPrice
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

- (NSNumber *)priceFromURL:(NSURL *)anURL error:(NSError **)anError
{
	NSXMLDocument *thePage = [[NSXMLDocument alloc] initWithContentsOfURL:anURL
				options:NSXMLDocumentTidyHTML error:anError];
	
	if (nil == thePage)
	{
		NSLog(@"HTML parse error: %@, [%@]", [*anError localizedDescription],
					anURL);
	}
	
	NSString *thePriceString = [[[thePage nodesForXPath:self.XPathToPrice
				error:anError] lastObject] objectValue];
	
	return [thePriceString numberValue];
}

@end
