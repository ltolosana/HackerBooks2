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
#import "LMTBookViewController.h"


@interface LMTBooksTableViewController ()

@end

@implementation LMTBooksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"LMTBookTableViewCell"
                                bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[LMTBookTableViewCell cellId]];
    
    //Register Notification
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatBookDidChangeFavorite:)
               name:FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
             object:nil];
    
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor lightGrayColor]];
    
    self.title = @"Hackerbooks2";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) dealloc{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
    
}


     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    LMTTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:section];
    
    return [[tag.books allObjects] count];

}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // Which book
    LMTTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.section];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                           ascending:YES];
    LMTBook *book = [[tag.books sortedArrayUsingDescriptors:@[sort]] objectAtIndex:indexPath.row];
    
    
    // Create the cell
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

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    // Which book
    LMTTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.section];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                           ascending:YES];
    LMTBook *book = [[tag.books sortedArrayUsingDescriptors:@[sort]] objectAtIndex:indexPath.row];

    
    
    // Say to delegate
    if ([self.delegate respondsToSelector:@selector(booksTableViewController:didSelectbook:)]) {
        
        [self.delegate booksTableViewController:self
                                    didSelectbook:book];
    }
    
    // Notify everyone interested
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dict = @{BOOK_KEY : book};
    NSNotification *n = [NSNotification notificationWithName:BOOK_DID_CHANGE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:dict];
    
    [nc postNotification:n];
   
    
}


//-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    
//    
////    if (section == 0) {
////        //Favorites Books
////        return @"Favoritos";
////    }else{
////        return [self.model.tags objectAtIndex:section];
////    }
//
//    return [[self.fetchedResultsController.fetchedObjects objectAtIndex:section] name];
//    
//}

#pragma mark - LMTBooksTableViewControllerDelegate
-(void) booksTableViewController:(LMTBooksTableViewController *)booksVC didSelectbook:(LMTBook *)book{
    
    LMTBookViewController *bookVC = [[LMTBookViewController alloc] initWithModel:book];
    
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}


#pragma mark - Notifications
//FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
-(void) notifyThatBookDidChangeFavorite:(NSNotification *) notification{
    

    [self performFetch];
    [self.tableView reloadData];
    
}

@end
