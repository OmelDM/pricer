//
//  NSStringExtensions.m
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/16/15.
//
//

#import "NSStringExtensions.h"

@implementation NSString (Random)

- (NSNumber *)numberValue
{
	return  [NSNumber numberWithInteger:[[self
				stringByReplacingOccurrencesOfString:@" " withString:@""]
				integerValue]];
}

@end
