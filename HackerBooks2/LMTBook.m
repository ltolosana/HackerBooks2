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

-(void) setIsFavorite:(NSNumber *)isFavorite{
    
    if ([isFavorite  isEqual: @1]) {
        [self insertFavoriteTag];
        
    }else if ([isFavorite  isEqual: @0]){
        [self removeFavoriteTag];
    }
    
}

-(NSNumber *) isFavorite{
    return [self hasFavoriteTag];
}

#pragma mark - Class methods
// Solo vamos a observar si cambia el estado favorito
+(NSArray *) observableKeys{
    return @[LMTBookAttributes.isFavorite];
}


+(instancetype) bookWithTitle:(NSString *) title
                      authors:(NSArray *) authors
                         tags:(NSArray *) tags
                   isFavorite:(NSNumber *) isFavorite
                     imageURL:(NSString *) imageURL
                       pdfURL:(NSString *) pdfURL
                      context:(NSManagedObjectContext *) context{
    
    LMTBook *book = [self insertInManagedObjectContext:context];
    
    
    book.title = title;
    book.isFavorite = isFavorite;
    
//    book.authors = [NSSet setWithArray:authors];
//    [book addAuthors:[NSSet setWithArray:authors]];
    for (id author in authors) {
        [LMTAuthor authorWithName:author
                             book:book
                          context:context];
    }
    
//    book.tags = [LMTTag insertInManagedObjectContext:context];
//    [book addTags:[NSSet setWithArray:tags]];
    for (id tag in tags) {
        [LMTTag tagWithName:tag
                       book:book
                    context:context];
    }
    
    book.photo = [LMTPhoto photoWithURL:imageURL
                                context:context];
    book.pdf = [LMTPDF pdfWithURL:pdfURL
                          context:context];
    
    return book;
    
}

+(instancetype) bookWithDictionary:(NSDictionary *) dict context:(NSManagedObjectContext *) context{
  
//    // Check in NSUSERDEFAULTS is book is favorite
//    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    NSArray *favs = [def objectForKey:FAVORITES];
//    
//    BOOL isFav = [favs containsObject:[dict objectForKey:@"title"]];

     LMTBook *book = [self insertInManagedObjectContext:context];
    
    book.title = [dict objectForKey:@"title"];
    book.isFavorite = [NSNumber numberWithInt:0];
    
    NSArray *authors = [[dict objectForKey:@"authors"] componentsSeparatedByString:@", "];
    for (NSString *author in authors) {
        [LMTAuthor authorWithName:author
                             book:book
                          context:context];
    }
    
    NSArray *tags = [[dict objectForKey:@"tags"] componentsSeparatedByString:@", "];
    for (NSString *tag in tags) {
        [LMTTag tagWithName:tag
                       book:book
                    context:context];
    }
    
    book.photo = [LMTPhoto photoWithURL:[dict objectForKey:@"image_url"]
                                context:context];
    book.pdf = [LMTPDF pdfWithURL:[dict objectForKey:@"pdf_url"]
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
-(NSNumber *) hasFavoriteTag{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", FAVORITES];
    return [NSNumber numberWithUnsignedInteger:[[self.tags filteredSetUsingPredicate:predicate] count]];
    
}

-(void) insertFavoriteTag{
    
    [self addTagsObject:[LMTTag tagWithName:FAVORITES
                                       book:self
                                    context:self.managedObjectContext]];
    [self notifyChanges];
}

-(void) removeFavoriteTag{
    
    [self removeTagsObject:[LMTTag tagWithName:FAVORITES
                                          book:self
                                       context:self.managedObjectContext]];
    [self notifyChanges];
}

-(void) notifyChanges{
    
    NSNotification *n = [NSNotification
                         notificationWithName:FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
                         object:self
                         userInfo:@{BOOK_KEY : self}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];

}


/*
 -(NSArray *) extractTagsFromJSONArray:(NSArray *) JSONArray{
    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary *dict in JSONArray) {
        [tags addObject:[dict objectForKey:@"tags"]];
    }
    return tags;
}
*/
/*
#pragma mark - Life Cycle
// Sobreescribimos estos dos metodos para las notificaciones
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    // Solo se produce una ve en la vida del objeto
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    // Se produce n veces a lo largo de la vida del objeto
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    // Se produce cuando el objeto se vacia convirtiendose en un fault.
    // Hay que dar de baja todas las notificaciones (KVO y no KVO)
    [self tearDownKVO];
}


#pragma mark - KVO
-(void) setupKVO{
    
    // Observamos las propiedades incluidas en observableKeys
    for (NSString *key in [[self class] observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
    
}

-(void) tearDownKVO{
    
    // Me doy de baja de todas las notificaciones
    for (NSString *key in [[self class] observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
    
}
*/

@end
