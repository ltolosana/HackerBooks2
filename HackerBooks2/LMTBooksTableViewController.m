//
//  LMTBooksTableViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 18/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBooksTableViewController.h"
#import "LMTBook.h"
#import "LMTBookTableViewCell.h"
#import "LMTAuthor.h"
#import "LMTTag.h"

@interface LMTBooksTableViewController ()

@end

@implementation LMTBooksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"LMTBookTableViewCell"
                                bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[LMTBookTableViewCell cellId]];
    
//    //Register Notification
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc addObserver:self
//           selector:@selector(notifyThatBookDidChangeFavorite:)
//               name:FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
//             object:nil];
    
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor lightGrayColor]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
 //   return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
    LMTTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:section];
    
    return [[tag.books allObjects] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //Which book
    LMTTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.section];
    
    LMTBook *book = [[tag.books allObjects] objectAtIndex:indexPath.row];
    
//    LMTBook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    // Create the cell
    //    static NSString *cellId = @"BookCell";
    LMTBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LMTBookTableViewCell cellId]
                                                                 forIndexPath:indexPath];
    
    
    // Configurarla
    // Es decir, sincronizar modelo (libro --> vista (celda))
    cell.bookIcon.image = [UIImage imageNamed:@"book_icon.png"];
    cell.title.text = book.title;
    
    NSArray *arr = [[[book.authors allObjects] valueForKey:LMTAuthorAttributes.name] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    cell.authors.text = [@"By: " stringByAppendingString:[arr componentsJoinedByString:@", "]];
    
//    cell.title.text = @"Title";

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}


@end
