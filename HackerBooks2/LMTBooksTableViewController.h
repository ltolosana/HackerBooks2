//
//  LMTBooksTableViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 18/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#define BOOK_DID_CHANGE_NOTIFICATION_NAME @"bookDidChangeNotification"
#define BOOK_KEY @"bookKey"

@class LMTBook;

@class LMTBooksTableViewController;

#import "AGTCoreDataTableViewController.h"

@protocol LMTBooksTableViewControllerDelegate <NSObject>

@optional
-(void) booksTableViewController:(LMTBooksTableViewController *) booksVC didSelectbook:(LMTBook *) book;

@end


@interface LMTBooksTableViewController : AGTCoreDataTableViewController<LMTBooksTableViewControllerDelegate>


@property (weak, nonatomic) id<LMTBooksTableViewControllerDelegate> delegate;

@end
