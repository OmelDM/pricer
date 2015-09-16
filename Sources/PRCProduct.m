//
//  PRCProduct.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/15/15.
//
//

#import "PRCProduct.h"

@implementation PRCProduct

- (instancetype)init
{
	self = [super init];
	
	if (nil != self)
	{
		_ID = @"528324";
	}
	
	return self;
}

- (NSURL *)URLOnSite:(NSString *)aSite
{

	return [NSURL URLWithString:@"http://reima.in.ua/katalog/item/shapka-shlem-rejma-starrie-528324-6510"];
}

- (NSString *)priceOnSite:(NSString *)aSite
{
	return @"864";
}

@end
