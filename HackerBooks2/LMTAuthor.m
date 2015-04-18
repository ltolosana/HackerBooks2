#import "LMTAuthor.h"

@interface LMTAuthor ()

// Private interface goes here.

@end

@implementation LMTAuthor

// Custom logic goes here.

+(instancetype) authorWithName:(NSString *) name book:(LMTBook *) book context:(NSManagedObjectContext *) context{
 
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTAuthor entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    NSError *err;
    NSArray *results = [context executeFetchRequest:req
                                              error:&err];
    LMTAuthor *author;
    if ([results count] == 0) {
        author = [self insertInManagedObjectContext:context];
        author.name = name;
    }else{
        author = [results lastObject];
    }

    [author addBooksObject:book];
    
    return author;
}

@end
