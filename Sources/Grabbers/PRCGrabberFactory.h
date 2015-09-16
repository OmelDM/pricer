//
//  GrabberFactory.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

@class Grabber;

@interface PRCGrabberFactory : NSObject

+ (Grabber *)grabberForURL:(NSURL *)aURL;

@end
