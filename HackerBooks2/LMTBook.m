//
//  LMTBook.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBook.h"
#import "LMTAuthor.h"
#import "LMTTag.h"
#import "LMTPDF.h"
#import "LMTPhoto.h"


@implementation LMTBook

//@synthesize  image = _image;

#pragma mark - Properties
//-(UIImage *) image{
//    
//    if (_image == nil) {
//        // Set the name to the local image file based on the Title
//        NSFileManager *fm = [NSFileManager defaultManager];
//        NSURL *localImageURL = [[fm URLsForDirectory:NSCachesDirectory
//                                           inDomains:NSUserDomainMask] lastObject];
//        localImageURL = [localImageURL URLByAppendingPathComponent:[self.title stringByAppendingPathExtension:@"jpg"]];
//        
//        NSError *error;
//        NSData *data = nil;
//        
//        // Try to load image locally
//        data = [NSData dataWithContentsOfURL:localImageURL
//                                     options:NSDataReadingMappedIfSafe
//                                       error:&error];
//        if (data == nil) {
//            // There is no local image, so load from internet
//            
//            data = [NSData dataWithContentsOfURL:self.imageURL
//                                         options:NSDataReadingMappedIfSafe
//                                           error:&error];
//            if (data != nil) {
//                // save the image into local cache directory
//                BOOL rc = [data writeToURL:localImageURL
//                                   options:NSDataWritingAtomic
//                                     error:&error];
//                if (rc == NO) {
//                    NSLog(@"Error al guardar la imagen en local: %@", error.localizedDescription);
//                }
//                
//            }
//            
//        }
//        // No matter local or remote, return image
//        _image = [UIImage imageWithData:data];
//        
//    }
//    return _image;
//}



#pragma mark - Class methods
+(instancetype) bookWithTitle:(NSString *) title
                      authors:(NSArray *) authors
                         tags:(NSArray *) tags
                   isFavorite:(NSNumber *) isFavorite
                     imageURL:(NSURL *) imageURL
                       pdfURL:(NSURL *) pdfURL
                      context:(NSManagedObjectContext *) context{
    
    LMTBook *book = [self insertInManagedObjectContext:context];
    
    
    book.title = title;
    book.isFavorite = isFavorite;
    [book addAuthors:[NSSet setWithArray:authors]];
    [book addTags:[NSSet setWithArray:tags]];
    book.photo = [LMTPhoto photoWithURL:imageURL
                                context:context];
    book.pdf = [LMTPDF pdfWithURL:pdfURL
                          context:context];
    
    return book;
    
}

#pragma mark - Init
//-(id) initWithTitle:(NSString *) title
//            authors:(NSArray *) authors
//               tags:(NSArray *) tags
//         isFavorite:(BOOL) isFavorite
//           imageURL:(NSURL *) imageURL
//             pdfURL:(NSURL *) pdfURL{
//    
//    if (self = [super init]) {
//        _title = title;
//        _authors = authors;
//        _tags = tags;
//        _isFavorite = isFavorite;
//        _imageURL = imageURL;
//        _pdfURL = pdfURL;
//        
//    }
//    
//    return self;
//}

/*
-(id) initWithDictionary:(NSDictionary *) dict{
    // Check in NSUSERDEFAULTS is book is favorite
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSArray *favs = [def objectForKey:FAVORITES];

    BOOL isFav = [favs containsObject:[dict objectForKey:@"title"]];
//    NSUInteger ind = [favs indexOfObject:[dict objectForKey:@"title"]];
//    [favs ]
//    if (ind == NSNotFound) {
//        isFav = NO;
//    }else{
//        isFav=YES;
//    }
    
    return [self initWithTitle:[dict objectForKey:@"title"]
                       authors:[[dict objectForKey:@"authors"] componentsSeparatedByString:@", "]
                          tags:[[dict objectForKey:@"tags"] componentsSeparatedByString:@", "]
                    isFavorite:isFav
                      imageURL:[NSURL URLWithString:[dict objectForKey:@"image_url"]]
                        pdfURL:[NSURL URLWithString:[dict objectForKey:@"pdf_url"]]];
            
    
}
*/

#pragma mark - Utils
/*
 -(NSArray *) extractTagsFromJSONArray:(NSArray *) JSONArray{
    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary *dict in JSONArray) {
        [tags addObject:[dict objectForKey:@"tags"]];
    }
    return tags;
}
*/

@end
