//
//  LMTLibrary.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import Foundation;
@class LMTBook;

@interface LMTLibrary : NSObject

@property (nonatomic, strong) NSArray *tags;

@property (nonatomic, readonly) NSUInteger booksCount;

-(id) initWithArray:(NSArray *) array;

-(NSUInteger) bookCountForTag:(NSString*) tag;
-(NSArray *) booksForTag: (NSString *) tag;
-(LMTBook *) bookForTag:(NSString*) tag atIndex:(NSUInteger) index;

@end
