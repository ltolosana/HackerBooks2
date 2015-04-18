#import "LMTTag.h"

@interface LMTTag ()

// Private interface goes here.

@end

@implementation LMTTag

// Custom logic goes here.

+(instancetype) tagWithName:(NSString *) name context:(NSManagedObjectContext *) context{
    
    LMTTag *tag = [self insertInManagedObjectContext:context];
    
    tag.name = name;
    
    return tag;
}

@end
