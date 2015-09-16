//
//  GrabberFactory.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

@class Grabber;

@interface GrabberFactory : NSObject
{

}

+ (Grabber *)grabberForLink:(NSURL *)aLink;

@end
