#import "LMTAnnotation.h"
#import "LMTPhoto.h"

@interface LMTAnnotation ()

// Private interface goes here.

@end

@implementation LMTAnnotation

// Custom logic goes here.

+(instancetype) annotationWithText:(NSString *) text book:(LMTBook *) book image:(UIImage *) image context:(NSManagedObjectContext *) context{
    
    LMTAnnotation *annotation = [self insertInManagedObjectContext:context];
    
    annotation.text = text;
    annotation.creationDate = [NSDate date];
    annotation.modificationDate = [NSDate date];
    annotation.book = book;
    annotation.image = [LMTPhoto photoWithImage:image context:context];
    
    return annotation;
}

@end
