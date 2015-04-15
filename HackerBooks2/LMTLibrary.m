//
//  LMTLibrary.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTLibrary.h"
#import "LMTBook.h"

@interface LMTLibrary ()

@property (nonatomic, strong) NSMutableArray *books;

@end

@implementation LMTLibrary

-(NSUInteger) booksCount{
    return [self.books count];
}


#pragma mark - Init
-(id) initWithArray:(NSArray *) array{
    
    if (self = [super init]) {
        
        // Creating the model
/*        NSURL *imageURL1 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg"];
        NSURL *pdfURL1 = [NSURL URLWithString:@"https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf"];
        
        LMTBook *book1 = [LMTBook bookWithTitle:@"Pro Git"
                                       authors:@[@"cott Chacon", @"Ben Straub"]
                                          tags:@[@"version control", @"git"]
                                    isFavorite:NO
                                      imageURL:imageURL1
                                        pdfURL:pdfURL1];


        NSURL *imageURL2 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/e5/27/e527064919530802af898a4798318ab9.jpg"];
        NSURL *pdfURL2 = [NSURL URLWithString:@"http://eloquentjavascript.net/Eloquent_JavaScript.pdf"];
       
        
        LMTBook *book2 = [LMTBook bookWithTitle:@"Eloquent JavaScript"
                                       authors:@[@"Marijn Haverbeke"]
                                          tags:@[@"javascript"]
                                    isFavorite:NO
                                      imageURL:imageURL2
                                        pdfURL:pdfURL2];


        NSURL *imageURL3 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/97/bf/97bfce708365236e0a5f3f9e26b4a796.jpg"];
        NSURL *pdfURL3 = [NSURL URLWithString:@"http://greenteapress.com/compmod/thinkcomplexity.pdf"];
        
        LMTBook *book3 = [LMTBook bookWithTitle:@"Think Complexityt"
                                       authors:@[@"Allen B. Downey"]
                                          tags:@[@"programming", @"python", @"data structures"]
                                    isFavorite:NO
                                      imageURL:imageURL3
                                        pdfURL:pdfURL3];


        NSURL *imageURL4 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/46/61/46613d24474140c53ea6b51386f888ff.jpg"];
        NSURL *pdfURL4 = [NSURL URLWithString:@"http://greenteapress.com/thinkstats/thinkstats.pdf"];
        
        LMTBook *book4 = [LMTBook bookWithTitle:@"Think Stats"
                                       authors:@[@"Allen B. Downey"]
                                          tags:@[@"python", @"programming", @"statistics"]
                                    isFavorite:NO
                                      imageURL:imageURL4
                                        pdfURL:pdfURL4];

        self.books = @[book1, book2, book3, book4];
*/
        //////////////////////////////
/*
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://keepcodigtest.blob.core.windows.net/containerblobstest/books_readable.json"]];
        NSURLResponse *response = [[NSURLResponse alloc] init];
        NSError *error;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        
        if (data != nil) {
            
            // Save JSONData in local documents
            NSFileManager *fm = [NSFileManager defaultManager];
            NSURL *url = [[fm URLsForDirectory: NSDocumentDirectory
                                     inDomains:NSUserDomainMask] lastObject];
            
            // Append the name
            url = [url URLByAppendingPathComponent:@"books_readable.json"];
            
            // Save
            BOOL rc = [data writeToURL:url
                               options:NSDataWritingAtomic
                                 error:&error];
            
            if (rc == NO) {
                NSLog(@"Error al guardar el JSON en la carpeta de documentos: %@", error.localizedDescription);
            }
*/            
  /////////////////////////////
        
            
            for (NSDictionary *dict in array) {
                LMTBook *book = [[LMTBook alloc] initWithDictionary:dict];
                
                if (!self.books) {
                    self.books = [NSMutableArray arrayWithObject:book];
                }else{
                    [self.books addObject:book];
                }
                
            }
        //        }else{
        //            NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);
        //        }
        
        
        //List of every unique tag sorted, begining with Favorites
        _tags = [@[@"Favorites"] arrayByAddingObjectsFromArray:[[self.books valueForKeyPath:@"@distinctUnionOfArrays.tags"] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
        NSLog(@"%@", _tags);
    }
    
    return self;
}



-(NSUInteger) bookCountForTag:(NSString*) tag{
    
    return [[self booksForTag:tag] count];
    
}


-(NSArray *) booksForTag: (NSString *) tag{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY tags like %@",tag];
    NSArray *newarray = @[];
    
    // sort the books
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                           ascending:YES];
    [self.books sortUsingDescriptors:@[sort]];

    if ([tag isEqual: @"Favorites"]) {
        
        // If tag is Favorites search in NSUSERDEFAULTS
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        NSArray *favs = [[def objectForKey:FAVORITES] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
//        newarray = [favs filteredArrayUsingPredicate:predicate];
        for (NSString *favTitle in favs) {
            newarray = [newarray arrayByAddingObject:[self bookForTitle:favTitle]];
        }
        return newarray;
        
    }else{
        //Return a new array with the books with the tag indicated
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY tags like %@",tag];
        newarray = [self.books filteredArrayUsingPredicate:predicate];
//        newarray = [[self.books filteredArrayUsingPredicate:predicate] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
    }
    
    if ([newarray count] == 0) {
        return nil;
    }else{
        return newarray;
    }
    
}


-(LMTBook *) bookForTag:(NSString*) tag atIndex:(NSUInteger) index{
    
    return [[self booksForTag:tag] objectAtIndex:index];
}


-(LMTBook *) bookForTitle:(NSString *) title{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title like %@",title];
    NSArray *arr =[self.books filteredArrayUsingPredicate:predicate];
    return [arr lastObject];
}


@end
