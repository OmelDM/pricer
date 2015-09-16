//
//  PRCProduct.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/15/15.
//
//

@interface PRCProduct : NSObject

@property (readonly) NSString *ID;

- (NSURL *)URLOnSite:(NSString *)aSite;
- (NSString *)priceOnSite:(NSString *)aSite;

@end
