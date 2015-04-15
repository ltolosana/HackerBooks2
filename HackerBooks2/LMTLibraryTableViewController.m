//
//  LMTLibraryTableViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTLibraryTableViewController.h"
#import "LMTLibrary.h"
#import "LMTBookViewController.h"
#import "LMTBook.h"
#import "LMTBookTableViewCell.h"

@interface LMTLibraryTableViewController ()

@end

@implementation LMTLibraryTableViewController

#pragma mark - Init
-(id) initWithModel:(LMTLibrary *) model style:(UITableViewStyle) style{
    
    if (self = [super initWithStyle:style]) {
        
        _model = model;
        self.title = @"HackerBooks";
    }
    
    return self;
}


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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void) dealloc{
    
    // Unregister notification
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [self.model.tags count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.model bookCountForTag:[self.model.tags objectAtIndex:section]];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Which book
    LMTBook *book = nil;
    
    book = [self.model bookForTag:[self.model.tags objectAtIndex:indexPath.section]
                          atIndex:indexPath.row];
    
    
    // Create the cell
//    static NSString *cellId = @"BookCell";
    LMTBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LMTBookTableViewCell cellId]
                                                            forIndexPath:indexPath];
    
    
    // Configurarla
    // Es decir, sincronizar modelo (personaje --> vista (celda)
    cell.bookIcon.image = [UIImage imageNamed:@"book_icon.png"];
    cell.title.text = book.title;
    cell.authors.text = [@"By: " stringByAppendingString:[book.authors componentsJoinedByString:@","]];
    

    return cell;
}



-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        //Favorites Books
        return @"Favoritos";
    }else{
        return [self.model.tags objectAtIndex:section];
    }
    
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMTBook *book = nil;
    book = [self.model bookForTag:[self.model.tags objectAtIndex:indexPath.section]
                          atIndex:indexPath.row];
    
    // Say to delegate
    if ([self.delegate respondsToSelector:@selector(libraryTableViewController:didSelectbook:)]) {
        
        [self.delegate libraryTableViewController:self
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


#pragma mark - LMTLibraryTableViewControllerDelegate
-(void) libraryTableViewController:(LMTLibraryTableViewController *)libraryVC didSelectbook:(LMTBook *)book{

    LMTBookViewController *bookVC = [[LMTBookViewController alloc] initWithModel:book];
    
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}


#pragma mark - Notifications
//FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
-(void)notifyThatBookDidChangeFavorite:(NSNotification *) notification{
    
    
    //Update Table
    [self.tableView reloadData];
}
    
    
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
