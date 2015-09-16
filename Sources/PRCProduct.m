//
//  PRCProduct.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/15/15.
//
//

#import "PRCProduct.h"

@interface PRCProduct ()

@property (nonatomic, strong) NSMutableDictionary *URLs;
@property (nonatomic, strong) NSMutableDictionary *prices;

@end

@implementation PRCProduct

- (instancetype)init
{
	self = [super init];
	
	if (nil != self)
	{
		self.URLs = [NSMutableDictionary new];
		self.prices = [NSMutableDictionary new];
	}
	
	return self;
}

- (NSURL *)URLOnSite:(NSString *)aSite
{
	return [self.URLs objectForKey:aSite];
}

- (NSNumber *)priceOnSite:(NSString *)aSite
{
	return [self.prices objectForKey:aSite];
}

- (void)setURL:(NSURL *)anURL forSite:(NSString *)aSite
{
	[self.URLs setObject:anURL forKey:aSite];
}

- (void)setPrice:(NSNumber *)aPrice forSite:(NSString *)aSite
{
	[self.prices setObject:aPrice forKey:aSite];
}

@end
