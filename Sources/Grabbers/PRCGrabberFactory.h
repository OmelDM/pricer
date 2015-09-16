//
//  PRCGrabberFactory.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

@class PRCGrabber;

@interface PRCGrabberFactory : NSObject

+ (PRCGrabber *)grabberForURL:(NSURL *)aURL;

@end
