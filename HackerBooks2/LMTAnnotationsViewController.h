//
//  LMTAnnotationsViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"

@class LMTBook;

@interface LMTAnnotationsViewController : AGTCoreDataTableViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle book:(LMTBook *) book;

@end
