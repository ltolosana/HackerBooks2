//
//  AppDelegate.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 13/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#define AUTO_SAVE NO
#define AUTO_SAVE_DELAY 5


#import "AppDelegate.h"
#import "LMTBookViewController.h"
//#import "LMTLibraryTableViewController.h"
//#import "LMTLibrary.h"
#import "AGTCoreDataStack.h"
#import "LMTBook.h"
#import "LMTTag.h"
#import "LMTAuthor.h"
#import "LMTBooksTableViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // creamos una instancia del stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];

    // Creamos datos chorras
    [self createDummyData];
    

    ////////// Pruebas
//    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTTag entityName]];
//    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LMTTagAttributes.name
//                                                         ascending:YES
//                                                          selector:@selector(compare:)]];
//    
//    req.fetchBatchSize = 20;
//    
//    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
//                                                                          managedObjectContext:self.stack.context
//                                                                            sectionNameKeyPath:LMTTagAttributes.name
//                                                                                    cacheName:nil];
//    
//    
//    LMTBooksTableViewController *booksVC = [[LMTBooksTableViewController alloc] initWithFetchedResultsController:fc
//                                                                                                           style:UITableViewStylePlain];
//    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:booksVC];
//    
//    self.window.rootViewController = navVC;
    
 
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTTag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LMTTagAttributes.name
                                                          ascending:YES
                                                           selector:@selector(compare:)]];
    
    req.fetchBatchSize = 20;
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.stack.context
                                                                           sectionNameKeyPath:LMTTagAttributes.name
                                                                                    cacheName:nil];
    
    
    
    // Detecting type of screen
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        // iPad type
        [self configureForPadWithFetchedResultsController:fc];
        
    }else{
        // iPhone type
        [self configureForPhoneWithFetchedResultsController:fc];
    }

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Arranco el autoSave
    [self autoSave];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) createDummyData{
    
    // Elimino datos anteriores
//    [self.stack zapAllData];
    
    
    // Creamos nuevos objetos
//    
//    NSURL *imageURL1 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg"];
//    NSURL *pdfURL1 = [NSURL URLWithString:@"https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf"];
//    
//    LMTBook *book1 = [LMTBook bookWithTitle:@"Pro Git"
//                                    authors:@[@"cott Chacon", @"Ben Straub"]
//                                       tags:@[@"version control", @"git"]
//                                 isFavorite:0
//                                   imageURL:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg"
//                                     pdfURL:@"https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf"
//                                    context:self.stack.context];
//    
//    
//    NSURL *imageURL2 = [NSURL URLWithString:@"http://hackershelf.com/media/cache/e5/27/e527064919530802af898a4798318ab9.jpg"];
//    NSURL *pdfURL2 = [NSURL URLWithString:@"http://eloquentjavascript.net/Eloquent_JavaScript.pdf"];
//    
//    
//    LMTBook *book2 = [LMTBook bookWithTitle:@"Eloquent JavaScript"
//                                    authors:@[@"Marijn Haverbeke"]
//                                       tags:@[@"javascript"]
//                                 isFavorite:0
//                                   imageURL:@"http://hackershelf.com/media/cache/e5/27/e527064919530802af898a4798318ab9.jpg"
//                                     pdfURL:@"http://eloquentjavascript.net/Eloquent_JavaScript.pdf"
//                                    context:self.stack.context];
//    
//    
//    NSLog(@"Un libro:%@", book1);
//    NSLog(@"Un libro:%@", book2);
    
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
    
    NSError *error;
    NSData *data = nil;
    
    // Check if it's the first time we run the App
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *str = [def objectForKey:JSON_LOCAL_URL];
    
    if (str == nil) {
        
        // It's the first time
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://keepcodigtest.blob.core.windows.net/containerblobstest/books_readable.json"]];
        NSURLResponse *response = [[NSURLResponse alloc] init];
        data = [NSURLConnection sendSynchronousRequest:request
                                     returningResponse:&response
                                                 error:&error];
        
        if (data != nil) {
            
//            // Save JSONData in local documents
//            NSFileManager *fm = [NSFileManager defaultManager];
//            NSURL *url = [[fm URLsForDirectory: NSDocumentDirectory
//                                     inDomains:NSUserDomainMask] lastObject];
//            
//            // Append the name
//            url = [url URLByAppendingPathComponent:JSON_NAME];
//            
//            // Save
//            BOOL rc = [data writeToURL:url
//                               options:NSDataWritingAtomic
//                                 error:&error];
//            
//            if (rc == NO) {
//                NSLog(@"Error al guardar el JSON en la carpeta de documentos: %@", error.localizedDescription);
//            }else{
            
            // Todo ha salido bien, cogemos el JSON y cargamos los datos 
            [self serializeJSONData:data];

                // Save to NSUSERDEFAULTS, so no more First Time
                [def setObject:JSON_NAME forKey:JSON_LOCAL_URL];
                [def synchronize];
                
//            }
        }else{
            // Failed to load JSON from internet
            NSLog(@"No se puede cargar el JSON: %@", error.localizedDescription);
            [[[UIAlertView alloc] initWithTitle:@"Error General"
                                        message:@"No se puede cargar el JSON."
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
            
            
        }
//    }else{
//        // Not the first time, so load JSON from local documents
//        NSFileManager *fm = [NSFileManager defaultManager];
//        
//        NSURL *url = [[fm URLsForDirectory: NSDocumentDirectory
//                                 inDomains:NSUserDomainMask] lastObject];
//        url = [url URLByAppendingPathComponent:JSON_NAME];
//        
//        data = [NSData dataWithContentsOfURL:url
//                                     options:NSDataReadingMappedIfSafe
//                                       error:&error];
//        if (data == nil) {
//            NSLog(@"Error al cargar el JSON de local, lo deberia cargar de la red");
//        }
//        
    }
    
    
    
    // Buscar
    
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTAuthor entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LMTAuthorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)]];
//    req.fetchBatchSize = 20;
    //    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", exs];
    
    NSArray *results = [self.stack executeFetchRequest:req
                                            errorBlock:^(NSError *error) {
                                                NSLog(@"error al buscar! %@", error);
                                            }];
    for (NSString *author in results) {
        NSLog(@"Author: %@", [author valueForKey:@"name"]);
    }
//    NSLog(@"Tags: %@", results);

    
/*
 
    // Borrar
    [self.stack.context deleteObject:vega];
*/
 
    // Guardar
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar! %@", error);
    }];
    





}

-(void) serializeJSONData: (NSData *) data{
    
    NSError *error;
    
    id JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                     options:kNilOptions
                                                       error:&error];
    //    if (JSONObjects == nil) {
    //        // There was an error
    //        NSLog(@"Error while parsing json data.\n%@", error);
    //        //    self = nil;
    //    }else if ([JSONObjects isKindOfClass:[NSArray class]]){
    //        [self processJSONArray: JSONObjects];
    //        //    [self setupNotifications];
    //
    //
    //    }else{
    //        // Should have been an NSArray
    //        //    self = nil;
    //
    //    }
    
    
    if (JSONObjects == nil) {
        
        NSLog(@"Error al procesar JSON: %@", error.localizedDescription);
        
    }else if ([JSONObjects isKindOfClass:[NSArray class]]){
        
        // Creating the model
        [self processJSONArray: JSONObjects];

        
    }else{
        // Should have been an NSArray
        //    self = nil;
        
    }
    
    
}

-(void) processJSONArray:(NSArray *) array{
    
    for (NSDictionary *dict in array) {
        
        [LMTBook bookWithDictionary:dict
                            context:self.stack.context];
    }
}





#pragma mark - Utils
-(void) configureForPadWithFetchedResultsController:(NSFetchedResultsController *) fc {
 
    // Creating the controllers
    LMTBooksTableViewController *booksVC = [[LMTBooksTableViewController alloc] initWithFetchedResultsController:fc
                                                                                                           style:UITableViewStylePlain];
    
// Esto lo tengo que cambiar para que arranque con el utimo leido o si no por uno por defecto
    
    LMTTag *tag = [fc.fetchedObjects objectAtIndex:1];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                           ascending:YES];
    LMTBook *book = [[tag.books sortedArrayUsingDescriptors:@[sort]] objectAtIndex:0];
    
    LMTBookViewController *bookVC = [[LMTBookViewController alloc] initWithModel:book];

    // Creating the Navigation Controllers
    UINavigationController *booksNav = [[UINavigationController alloc] initWithRootViewController:booksVC];
    
    UINavigationController *bookNav = [[UINavigationController alloc] initWithRootViewController:bookVC];
    
    
    // Creating de combinator
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[booksNav, bookNav];
    
    
    // Delegates
    splitVC.delegate = bookVC;
    booksVC.delegate = bookVC;
    
    
    // Making rootVC
    self.window.rootViewController = splitVC;
    
}

-(void) configureForPhoneWithFetchedResultsController:(NSFetchedResultsController *) fc{
    
    // Creating the controller
    LMTBooksTableViewController *booksVC = [[LMTBooksTableViewController alloc] initWithFetchedResultsController:fc
                                                                                                           style:UITableViewStylePlain];
    
    // Creating de combinator
    UINavigationController *booksNav = [[UINavigationController alloc] initWithRootViewController:booksVC];
    
    
    // Delegate
    booksVC.delegate = booksVC;
    
    
    // Making rootVC
    self.window.rootViewController = booksNav;
}

-(void) autoSave{
    
    if (AUTO_SAVE) {
        
        NSLog(@"Autoguardando");
        [self.stack saveWithErrorBlock:^(NSError *error) {
            NSLog(@"Error al autoguardar!");
        }];
        
        // Pongo el mi "agenda" una nueva llamada a autoSave
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY];
        
    }
}

@end
