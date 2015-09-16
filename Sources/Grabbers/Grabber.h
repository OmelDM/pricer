//
//  Grabber.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

@interface Grabber : NSObject

+ (instancetype)sharedGrabber;

@property (nonatomic, readonly) NSString *XPathToPrice;

- (NSNumber *)priceFromURL:(NSURL *)anURL error:(NSError **)anError;

@end
