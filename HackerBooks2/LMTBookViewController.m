//
//  LMTBookViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBookViewController.h"
#import "LMTSimplePDFViewController.h"
#import "LMTBook.h"
#import "LMTAuthor.h"
#import "LMTPhoto.h"
#import "LMTTag.h"
#import "LMTPDF.h"


@interface LMTBookViewController ()

@end

@implementation LMTBookViewController

#pragma mark - Init
-(id) initWithModel:(LMTBook *) model{
    
    NSString *nibName=nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        nibName = @"LMTBookViewControlleriPhone";
    }
    
    
    if (self= [super initWithNibName:nibName
                              bundle:nil]) {
        _model = model;
        
    }
    
    return self;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Register Notification
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(syncFavoriteWithModel)
               name:FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
             object:nil];

    [nc addObserver:self
           selector:@selector(syncImageWithModel)
               name:IMAGE_DID_CHANGE_NOTIFICATION
             object:nil];

    // Asegurarse de que no se ocupa toda la pantalla cuando estas en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // Sincronize model and views
    [self syncViewWithModel];
    
    // Whether in SplitVC
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // Unregister notification
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)displayPDF:(id)sender{
    
    NSLog(@"Nos muestra el pdf:%@", self.model.pdf.pdfURL);
    
    // Create a pdfVC
    LMTSimplePDFViewController *pdfVC = [[LMTSimplePDFViewController alloc] initWithModel:self.model];
    
    // Push
    [self.navigationController pushViewController:pdfVC
                                         animated:YES];
    
}

-(IBAction)changeToFavorite:(id)sender{
//    self.model.isFavorite = !self.model.isFavorite;
    NSLog(@"%@", self.model.isFavorite);
    if ([self.model.isFavorite isEqual:@1]) {
        self.model.isFavorite = @0;
    }else if ([self.model.isFavorite isEqual:@0]){
        self.model.isFavorite = @1;
    }
//    self.model.isFavorite = [NSNumber numberWithInt:![self.model.isFavorite intValue]];
    NSLog(@"%@", self.model.isFavorite);
}

//-(IBAction)changeToFavorite:(id)sender{
//    
//    if ([sender isOn]) {
//        self.model.isFavorite = YES;
//        NSLog(@"%@: Favorite = YES", self.model.title);
//    }else{
//        self.model.isFavorite = NO;
//        NSLog(@"%@: Favorite = NO", self.model.title);
//    }
//    
//    ///////////////// Esto tiene que estar aqui, porque de la forma que esta implementado, si lo pongo en la notificacion
//    ///////////////// se recarga la tabla antes de que se actualicen el estado de favorito del libro en NSUSERDEFAULTS
//    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    NSArray *favs = [def objectForKey:FAVORITES];
//    if (!favs) {
//        favs = @[];
//    }
//    NSMutableArray *mut = [favs mutableCopy];
//    
////    LMTBook *b = [notification.userInfo objectForKey:MODEL_KEY];
//    // Check if book is favorite or not
//    
//    if (self.model.isFavorite == YES) {
//        
//        //Meto el titulo del libro como favorito en userdefaults
//        [mut addObject:self.model.title];
//        
//    }else{
//        
//        // Borro el titulo del array de favoritos
//        [mut removeObject:self.model.title];
//        
//    }
//    [def setObject:mut forKey:FAVORITES];
//    [def synchronize];
//    /////////////////////////
//    
//    // Send notification to inform book changed favorite state
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    
//    NSDictionary *dict = @{MODEL_KEY : self.model};
//    NSNotification *n = [NSNotification notificationWithName:FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
//                                                      object:self
//                                                    userInfo:dict];
//    [nc postNotification:n];
//}


#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    // Table is visible?
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // Table is Hidden behind the button
        // Show the button in the NavBar
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else{
        // Table is visible so hide the button
        self.navigationItem.leftBarButtonItem = nil;
        
    }
}


#pragma mark - LMTBooksTableViewControllerDelegate
-(void) booksTableViewController:(LMTBooksTableViewController *)uVC didSelectbook:(LMTBook *)book{
    
    // Update the model 
    self.model = book;
    
    // Sincronize model and views
    [self syncViewWithModel];
    
}

#pragma mark - Notifications
//FAVORITE_STATUS_DID_CHANGE_NOTIFICATION_NAME
-(void)notifyThatBookDidChangeFavorite:(NSNotification *) notification{
//    
//        if (self.model.isFavorite == [NSNumber numberWithBool:YES]) {
//    
//            //Meto el titulo del libro como favorito
//            [self.model addTagsObject:[LMTTag tagWithName:@"Favorites"
//                                                     book:self.model
//                                                  context:self.model.managedObjectContext]];
//
//    
//        }else{
//    
//            // Borro el titulo de favoritos
//            [self.model removeTagsObject:[LMTTag tagWithName:@"Favorites"
//                                                        book:self.model
//                                                     context:]];
        
//    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    NSArray *favs = [def objectForKey:FAVORITES];
//    if (!favs) {
//        favs = @[];
//    }
//    NSMutableArray *mut = [favs mutableCopy];
//    
//    LMTBook *b = [notification.userInfo objectForKey:MODEL_KEY];
//    // Check if book is favorite or not
//    
//    if (b.isFavorite == YES) {
//        
//        //Meto el titulo del libro como favorito en userdefaults
//        [mut addObject:b.title];
//        
//    }else{
//        
//        // Borro el titulo del array de favoritos
//        [mut removeObjectIdenticalTo:b.title];
//        
//    }
//    [def setObject:mut forKey:FAVORITES];
//    [def synchronize];
    
}


    
#pragma mark - Utils
-(void) syncViewWithModel{
    self.titleLabel.text = self.model.title;
    
    self.title = self.model.title;
    
    NSArray *arrAuthors = [[[self.model.authors allObjects] valueForKey:LMTAuthorAttributes.name] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    self.authorsLabel.text = [@"By: " stringByAppendingString:[arrAuthors componentsJoinedByString:@", "]];

//    NSArray *arrTags = [[[self.model.tags allObjects] valueForKey:LMTTagAttributes.name] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSArray *arrTags = [[[self.model.tags allObjects] valueForKey:LMTTagAttributes.name] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableArray *arrTagsCopy = [arrTags mutableCopy];
    [arrTagsCopy removeObject:FAVORITES];

    self.tagsLabel.text = [@"About: " stringByAppendingString:[arrTagsCopy componentsJoinedByString:@", "]];
    [self.isFavoriteSwitch setOn:[self.model.isFavorite boolValue]];

    
    
    ////    self.photoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.model.imageURL]];
    
    if (self.model.photo.photoData == nil){
        self.photoView.image = [UIImage imageNamed:@"book_icon"];
        NSLog(@"Portada vacia");
    }
    [self performSelector:@selector(syncImageWithModel)
               withObject:nil
               afterDelay:0.01];


}

-(void) syncImageWithModel{
    self.photoView.image = self.model.photo.image;
    
}

-(void) syncFavoriteWithModel{
    [self.isFavoriteSwitch setOn:[self.model.isFavorite boolValue]];
}

@end
