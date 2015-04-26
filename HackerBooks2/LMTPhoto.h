@import UIKit;

#import "_LMTPhoto.h"

#define IMAGE_DID_CHANGE_NOTIFICATION @"LMTPhotoImageDidChange"
#define IMAGE_KEY @"newImageKey"

@interface LMTPhoto : _LMTPhoto {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage *image;

+(instancetype) photoWithURL:(NSString *) photoURL context:(NSManagedObjectContext *) context;
+(instancetype) photoWithImage:(UIImage *) photo annotation:(LMTAnnotation *) annotation context:(NSManagedObjectContext *) context;

@end
