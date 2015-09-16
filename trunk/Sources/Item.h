//
//  Item.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 10/18/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "Grabber.h"

@interface Item : NSObject <GrabberDelegate>
{
	@private
		NSString *name;
		NSMutableDictionary *info;
}

@property (readonly) NSString *name;

+ (id)itemWithName:(NSString *)aName;
- (id)initWithName:(NSString *)aName;
- (NSNumber *)priceInShop:(NSString *)aShopName;

@end
