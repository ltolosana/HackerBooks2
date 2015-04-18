#import "LMTTag.h"

@interface LMTTag ()

// Private interface goes here.

@end

@implementation LMTTag

// Custom logic goes here.

+(instancetype) tagWithName:(NSString *) name book:(LMTBook *) book context:(NSManagedObjectContext *) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTTag entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    NSError *err;
    NSArray *results = [context executeFetchRequest:req
                                              error:&err];
    LMTTag *tag;
    if ([results count] == 0) {
        tag = [self insertInManagedObjectContext:context];
        tag.name = name;
    }else{
        tag = [results lastObject];
    }
    
    
    [tag addBooksObject:book];
    
    return tag;
}

@end
