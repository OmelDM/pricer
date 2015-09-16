//
//  PricerAppDelegate.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/30/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PricerAppDelegate.h"
#import "PRCProductManager.h"

#import <dispatch/dispatch.h>

NSString *const kNameColumnIdentifier = @"nameColumn";
NSString *const kRozetksColumnIdentifier = @"rozetkaColumn";
NSString *const kCoolkidsColumnIdentifier = @"coolkidsColumn";
NSString *const kReimaColumnIdentifier = @"reimaColumn";
NSString *const kZimamaColumnIdentifier = @"zimamaColumn";

@interface PricerAppDelegate()

@property (nonatomic, weak) IBOutlet NSWindow *window;
@property (nonatomic, weak) IBOutlet NSTextField *inTextField;
@property (nonatomic, weak) IBOutlet NSTextField *outTextField;

- (IBAction)startAction:(id)aSender;

@end

@implementation PricerAppDelegate


#pragma mark -
#pragma mark Actions

- (IBAction)startAction:(id)aSender
{
	NSLog(@"startAction");

	PRCProductManager *theProductManager = [PRCProductManager new];
	theProductManager.inputCSVFilePath = [self.inTextField stringValue];
	
	if ([theProductManager isInputCSVFileVerified])
	{
		[theProductManager readCSVFile];
		[theProductManager retrievePrices];
		[theProductManager storePricesToCSVFile];
	}
}

@end
