#import "_LMTPDF.h"

@interface LMTPDF : _LMTPDF {}
// Custom logic goes here.

+(instancetype) pdfWithURL:(NSURL *) pdfURL context:(NSManagedObjectContext *) context;

@end
