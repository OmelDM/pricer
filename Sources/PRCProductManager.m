//
//  PRCProductManager.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/16/15.
//
//

#import "PRCProductManager.h"
#import "PRCProduct.h"

@implementation PRCProductManager

#pragma mark -
#pragma mark Public methods

- (BOOL)isInputCSVFileVerified
{
	BOOL theResult = NO;
	NSFileManager *theManager = [NSFileManager defaultManager];
	
	if ([theManager fileExistsAtPath:self.inputCSVFilePath])
	{
		if ([theManager isReadableFileAtPath:self.inputCSVFilePath])
		{
			theResult = YES;
		}
		else
		{
			NSLog(@"File is not readable (%@)", self.inputCSVFilePath);
			theResult = NO;
		}
	}
	else
	{
		NSLog(@"File does not exist (%@)", self.inputCSVFilePath);
	}
	
	return theResult;
}

- (void)readCSVFile
{
	CHCSVParser *theParser = [[CHCSVParser alloc]
				initWithContentsOfCSVURL:[NSURL
				URLWithString:self.inputCSVFilePath]];
	theParser.delegate = self;
	theParser.trimsWhitespace = YES;
	[theParser parse];

//	self.products = [NSMutableArray arrayWithObjects:[PRCProduct new], [PRCProduct new], [PRCProduct new], nil];
}

- (void)retrievePrices
{

}

- (void)storePricesToCSVFile
{
	CHCSVWriter *theWriter = [[CHCSVWriter alloc] initForWritingToCSVFile:@"/Users/omel/Documents/Projects/Pricer/Out.csv"];
	[theWriter writeField:@"ID"];
	[theWriter writeField:@"reima.in.ua"];
	[theWriter finishLine];
	
	for (PRCProduct *theProduct in self.products)
	{
		[theWriter writeField:theProduct.ID];
		[theWriter writeField:[theProduct priceOnSite:@"reima.in.ua"]];
		[theWriter finishLine];
	}
	
	
}

#pragma mark -
#pragma mark CHCSVParserDelegate methods

- (void)parserDidBeginDocument:(CHCSVParser *)aParser
{
	self.products = [NSMutableArray new];
}

- (void)parser:(CHCSVParser *)aParser didBeginLine:(NSUInteger)aRecordNumber
{
	// parse first line
}

- (void)parser:(CHCSVParser *)aParser didEndLine:(NSUInteger)aRecordNumber
{

}

- (void)parser:(CHCSVParser *)aParser didReadField:(NSString *)aField atIndex:(NSInteger)aFieldIndex
{

}

- (void)parser:(CHCSVParser *)aParser didFailWithError:(NSError *)anError
{
	NSLog(@"Parse error: %@", [anError localizedDescription]);
}


#pragma mark -
#pragma mark Private methods

@end
