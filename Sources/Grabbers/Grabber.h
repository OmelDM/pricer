//
//  Grabber.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/6/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

@class Grabber;

@protocol GrabberDelegate <NSObject>

- (void)grabber:(Grabber *)aGrabber didFinishGrabbingInfo:(NSDictionary *)anInfo;

@end

@interface Grabber : NSObject
{
	@private
//		NSURL *link;
//		id delegate;
}

@property (nonatomic, assign) id delegate;
@property (strong, readonly) NSURL *link;

- (id)initWithLink:(NSURL *)aLink;

- (NSDictionary *)info;
- (void)grab;

@end
