//
//  PRCProductManager.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/16/15.
//
//

#import "PRCProductManager.h"
#import "PRCProduct.h"
#import "Grabber.h"
#import "GrabberFactory.h"

@interface PRCProductManager ()

@property (nonatomic, strong) NSMutableArray *orderedShops;
@property (nonatomic, assign) BOOL firstLineParsed;
@property (nonatomic, strong) PRCProduct *currentProduct;

@end

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
				fileURLWithPath:self.inputCSVFilePath isDirectory:NO]];
	
	if (nil == theParser)
	{
		NSLog(@"Fatal error: could not create csv parser");
		return;
	}
	
	theParser.delegate = self;
	theParser.trimsWhitespace = YES;
	[theParser parse];
}

- (void)retrievePrices
{
	for (PRCProduct *theProduct in self.products)
	{
		for (NSString *theShop in self.orderedShops)
		{
			NSURL *theURL = [theProduct URLOnSite:theShop];
			Grabber *theGrabber = [GrabberFactory grabberForURL:theURL];
			NSError *theError = nil;
			NSNumber *thePrice = [theGrabber priceFromURL:theURL
						error:&theError];
			
			if (nil == thePrice)
			{
				NSLog(@"Error: could not grab price from '%@', error: %@",
							theURL, [theError localizedDescription]);
			}
			else
			{
				[theProduct setPrice:thePrice forSite:theShop];
			}
		}
	}
}

- (void)storePricesToCSVFile
{
	CHCSVWriter *theWriter = [[CHCSVWriter alloc]
				initForWritingToCSVFile:self.outputCSVFilePath];
	
	if (nil == theWriter)
	{
		NSLog(@"Fatal error: could not create csv writer");
		return;
	}
	
	[theWriter writeField:@"ID"];
	for (NSString *theShop in self.orderedShops)
	{
		[theWriter writeField:theShop];
	}
	[theWriter finishLine];
	
	for (PRCProduct *theProduct in self.products)
	{
		[theWriter writeField:theProduct.ID];
		for (NSString *theShop in self.orderedShops)
		{
			[theWriter writeField:[theProduct priceOnSite:theShop]];
		}
		[theWriter finishLine];
	}
	
	
}

#pragma mark -
#pragma mark CHCSVParserDelegate methods

- (void)parserDidBeginDocument:(CHCSVParser *)aParser
{
	self.products = [NSMutableArray new];
}

- (void)parserDidEndDocument:(CHCSVParser *)aParser
{
	self.currentProduct = nil;
}

- (void)parser:(CHCSVParser *)aParser didBeginLine:(NSUInteger)aRecordNumber
{
	if (1 == aRecordNumber)
	{
		self.firstLineParsed = NO;
		self.orderedShops = [NSMutableArray new];
	}
	else
	{
		self.currentProduct = [PRCProduct new];
	}
}

- (void)parser:(CHCSVParser *)aParser didEndLine:(NSUInteger)aRecordNumber
{
	if (1 == aRecordNumber)
	{
		self.firstLineParsed = YES;
	}
	else
	{
		if (nil == self.currentProduct)
		{
			NSLog(@"Parse error: product on line %ld is absent", aRecordNumber);
		}
		else
		{
			[self.products addObject:self.currentProduct];
		}
	}
}

- (void)parser:(CHCSVParser *)aParser didReadField:(NSString *)aField
			atIndex:(NSInteger)aFieldIndex
{
	if (!self.firstLineParsed)
	{
		if (0 == aFieldIndex)
		{
			// just skip 'ID' field
			return;
		}
		
		[self.orderedShops addObject:aField];
	}
	else if (0 == aFieldIndex)
	{
		self.currentProduct.ID = aField;
	}
	else
	{
		// since we do not use 'ID' field, we should decrease index to get
		// correct index for orderedShops
		// |   ID   |   0   |   1   |   2   |  ...  |   n   |
		aFieldIndex--;
		
		if (self.orderedShops.count <= aFieldIndex)
		{
			NSLog(@"Parse error: feild '%@' [%ld] is beyond of the array of shops",
						aField, (long)aFieldIndex);
			return;
		}
		
		NSString *theShop = [self.orderedShops objectAtIndex:aFieldIndex];
		NSURL *theURL = [NSURL URLWithString:aField];
		
		if (nil == theURL)
		{
			NSLog(@"Parse error: empty URL for shop %@ [%ld]", theShop,
						(long)aFieldIndex);
		}
		else
		{
			[self.currentProduct setURL:theURL forSite:theShop];
		}
	}
}

- (void)parser:(CHCSVParser *)aParser didFailWithError:(NSError *)anError
{
	NSLog(@"Parse fail with error: %@", [anError localizedDescription]);
}


#pragma mark -
#pragma mark Private methods

@end
