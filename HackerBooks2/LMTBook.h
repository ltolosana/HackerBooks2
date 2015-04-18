//
//  LMTBook.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#define FAVORITES @"Favorites"

@import Foundation;
@import UIKit;

#import "_LMTBook.h"

@interface LMTBook: _LMTBook {}

//@property (copy, nonatomic) NSString *title;
//@property (strong, nonatomic) NSArray *authors;
//@property (strong, nonatomic) NSArray *tags;
//@property (nonatomic) BOOL isFavorite;
//@property (strong, nonatomic) NSURL *imageURL;
//@property (strong, nonatomic, readonly) UIImage *image;
//@property (strong, nonatomic) NSURL *pdfURL;

// Class methods
+(instancetype) bookWithTitle:(NSString *) title
                      authors:(NSArray *) authors
                         tags:(NSArray *) tags
                   isFavorite:(NSNumber *) isFavorite
                     imageURL:(NSString *) imageURL
                       pdfURL:(NSString *) pdfURL
                      context:(NSManagedObjectContext *) context;

+(instancetype) bookWithDictionary:(NSDictionary *) dict
                           context:(NSManagedObjectContext *) context;

//// Designated
//-(id) initWithTitle:(NSString *) title
//            authors:(NSArray *) authors
//               tags:(NSArray *) tags
//         isFavorite:(BOOL) isFavorite
//           imageURL:(NSURL *) imageURL
//             pdfURL:(NSURL *) pdfURL;

// Init from JSON
//-(id) initWithDictionary:(NSDictionary *) dict;

@end
