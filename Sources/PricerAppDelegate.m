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
@property (nonatomic, weak) IBOutlet NSView *generalView;
@property (nonatomic, weak) IBOutlet NSView *progressView;
@property (nonatomic, weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (nonatomic, weak) IBOutlet NSButton *startButton;

- (IBAction)startAction:(id)aSender;

@end

@implementation PricerAppDelegate


#pragma mark -
#pragma mark Actions

- (IBAction)startAction:(id)aSender
{
	PRCProductManager *theProductManager = [PRCProductManager new];
	theProductManager.inputCSVFilePath = [self.inTextField stringValue];
	theProductManager.outputCSVFilePath = [self.outTextField stringValue];
	
	if ([theProductManager isInputCSVFileVerified])
	{
		[self startProgressAnimation];
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
		^{
			[theProductManager readCSVFile];
			[theProductManager retrievePrices];
			[theProductManager storePricesToCSVFile];
			dispatch_async(dispatch_get_main_queue(),
			^{
				[self stopProgressAnimation];
			});
		});
	}
}

#pragma mark -
#pragma mark Overrode methods

- (void)awakeFromNib
{
	[self.progressView setHidden:YES];
	[self.generalView setHidden:NO];
	[self updateUI];
	[[NSNotificationCenter defaultCenter] addObserver:self
				selector:@selector(textFieldDidChange:)
				name:NSControlTextDidChangeNotification object:self.inTextField];
	[[NSNotificationCenter defaultCenter] addObserver:self
				selector:@selector(textFieldDidChange:)
				name:NSControlTextDidChangeNotification object:self.outTextField];
}

#pragma mark -
#pragma mark NSApplicationDelegate methods

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark Private methods

- (void)updateUI
{
	[self updateStartButton];
}

- (void)updateStartButton
{
	if (0 == [[self.inTextField stringValue] length] ||
				0 == [[self.outTextField stringValue] length])
	{
		[self.startButton setEnabled:NO];
	}
	else
	{
		[self.startButton setEnabled:YES];
	}
}

- (void)startProgressAnimation
{
	[self.generalView setHidden:YES];
	[self.progressView setHidden:NO];
	[self.progressIndicator startAnimation:self];
}

- (void)stopProgressAnimation
{
	[self.generalView setHidden:NO];
	[self.progressView setHidden:YES];
	[self.progressIndicator stopAnimation:self];
}

- (void)textFieldDidChange:(NSNotification *)aNotification
{
	[self updateStartButton];
}

@end
