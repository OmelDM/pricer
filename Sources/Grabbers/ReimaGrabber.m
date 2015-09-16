//
//  ReimaGrabber.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ReimaGrabber.h"
#import "NSStringExtensions.h"

@implementation ReimaGrabber

+ (instancetype)sharedGrabber
{
	static ReimaGrabber *sSharedGrabber = nil;
    static dispatch_once_t sOnceToken;
	
    dispatch_once(&sOnceToken,
	^{
        sSharedGrabber = [[ReimaGrabber alloc] init];
    });
	
	return sSharedGrabber;
}

- (NSString *)XPathToPrice
{
	return @"//span[@class='jsTotal total']";
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
	
	if (nil == thePriceString && nil == *anError)
	{
		thePriceString = [[[thePage
					nodesForXPath:@"//span[@class='jsTotal total discount-less']"
					error:anError] lastObject] objectValue];
	}
	
	return [thePriceString numberValue];
}

@end
