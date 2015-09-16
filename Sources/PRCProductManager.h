//
//  PRCProductManager.h
//  Pricer
//
//  Created by Dmytro Omelchuk on 9/16/15.
//
//

#import "CHCSVParser.h"

@interface PRCProductManager : NSObject <CHCSVParserDelegate>

@property (nonatomic, copy) NSString *inputCSVFilePath;
@property (nonatomic, copy) NSString *outputCSVFilePath;
@property (nonatomic, strong) NSMutableArray *products;

- (BOOL)isInputCSVFileVerified;
- (void)readCSVFile;
- (void)retrievePrices;
- (void)storePricesToCSVFile;

@end
