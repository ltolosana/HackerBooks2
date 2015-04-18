#import "_LMTTag.h"

@interface LMTTag : _LMTTag {}
// Custom logic goes here.

+(instancetype) tagWithName:(NSString *) name book:(LMTBook *) book context:(NSManagedObjectContext *) context;

@end
