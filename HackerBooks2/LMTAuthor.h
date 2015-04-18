#import "_LMTAuthor.h"

@interface LMTAuthor : _LMTAuthor {}
// Custom logic goes here.

+(instancetype) authorWithName:(NSString *) name book:(LMTBook *) book context:(NSManagedObjectContext *) context;

@end
