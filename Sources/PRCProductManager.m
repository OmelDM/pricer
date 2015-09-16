//
//  PRCProductManager.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/16/15.
//
//

#import "PRCProductManager.h"
#import "PRCProduct.h"

@interface PRCProductManager ()

@property (nonatomic, strong) NSMutableDictionary *shopsOrder;
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

- (void)parserDidEndDocument:(CHCSVParser *)aParser
{

}

- (void)parser:(CHCSVParser *)aParser didBeginLine:(NSUInteger)aRecordNumber
{
	if (1 == aRecordNumber)
	{
		self.firstLineParsed = NO;
		self.shopsOrder = [NSMutableDictionary new];
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
		[self.products addObject:self.currentProduct];
	}
}

- (void)parser:(CHCSVParser *)aParser didReadField:(NSString *)aField atIndex:(NSInteger)aFieldIndex
{
	if (!self.firstLineParsed)
	{
		[self.shopsOrder setObject:aField forKey:[NSNumber numberWithInteger:aFieldIndex]];
	}
	else if (0 == aFieldIndex)
	{
		self.currentProduct.ID = aField;
	}
	else
	{
		NSString *theShop = [self.shopsOrder objectForKey:[NSNumber numberWithInteger:aFieldIndex]];
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
