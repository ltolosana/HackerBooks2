#import "_LMTPDF.h"

@interface LMTPDF : _LMTPDF {}
// Custom logic goes here.

+(instancetype) pdfWithURL:(NSString *) pdfURL context:(NSManagedObjectContext *) context;

@end
