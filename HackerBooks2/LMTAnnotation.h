#import "_LMTAnnotation.h"

@interface LMTAnnotation : _LMTAnnotation {}
// Custom logic goes here.

+(instancetype) annotationWithText:(NSString *) text book:(LMTBook *) book image:(LMTPhoto *) image context:(NSManagedObjectContext *) context;


@end
