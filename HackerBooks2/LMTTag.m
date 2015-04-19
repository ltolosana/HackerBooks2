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

#pragma mark - Comparison
- (NSComparisonResult)compare:(LMTTag *)other{
    
    /* favorite always comes first */
    static NSString *fav = @"Favorite";
    
    if ([self.name isEqualToString:other.name]) {
        return NSOrderedSame;
    }else if ([self.name isEqualToString:fav]){
        return NSOrderedAscending;
    }else if ([other.name isEqualToString:fav]){
        return NSOrderedDescending;
    }else{
        return [self.name compare:other.name];
    }
}

@end
