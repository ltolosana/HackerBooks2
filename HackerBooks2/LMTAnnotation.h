#import "_LMTAnnotation.h"
@import UIKit;

@interface LMTAnnotation : _LMTAnnotation {}
// Custom logic goes here.

+(instancetype) annotationWithText:(NSString *) text book:(LMTBook *) book image:(UIImage *) image context:(NSManagedObjectContext *) context;


@end
