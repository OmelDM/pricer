//
//  PRCProduct.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/15/15.
//
//

@interface PRCProduct : NSObject

@property (nonatomic, strong) NSString *ID;

- (NSURL *)URLOnSite:(NSString *)aSite;
- (NSNumber *)priceOnSite:(NSString *)aSite;

- (void)setURL:(NSURL *)anURL forSite:(NSString *)aSite;
- (void)setPrice:(NSNumber *)aPrice forSite:(NSString *)aSite;

@end
