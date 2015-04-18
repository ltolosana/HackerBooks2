@import UIKit;

#import "_LMTPhoto.h"

@interface LMTPhoto : _LMTPhoto {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage *image;

+(instancetype) photoWithURL:(NSURL *) photoURL context:(NSManagedObjectContext *) context;

@end
