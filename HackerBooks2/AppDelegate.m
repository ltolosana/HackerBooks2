//
//  AppDelegate.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 13/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "AppDelegate.h"
#import "LMTBookViewController.h"
#import "LMTLibraryTableViewController.h"
#import "LMTLibrary.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
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
            
            // Save JSONData in local documents
            NSFileManager *fm = [NSFileManager defaultManager];
            NSURL *url = [[fm URLsForDirectory: NSDocumentDirectory
                                     inDomains:NSUserDomainMask] lastObject];
            
            // Append the name
            url = [url URLByAppendingPathComponent:JSON_NAME];
            
            // Save
            BOOL rc = [data writeToURL:url
                               options:NSDataWritingAtomic
                                 error:&error];
            
            if (rc == NO) {
                NSLog(@"Error al guardar el JSON en la carpeta de documentos: %@", error.localizedDescription);
            }else{
                
                // Save to NSUSERDEFAULTS, so no more First Time
                [def setObject:JSON_NAME forKey:JSON_LOCAL_URL];
                [def synchronize];
                
            }
        }else{
            // Failed to load JSON from internet
            NSLog(@"No se puede cargar el JSON: %@", error.localizedDescription);
            [[[UIAlertView alloc] initWithTitle:@"Error General"
                                        message:@"No se puede cargar el JSON."
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
            
            
        }
    }else{
        // Not the first time, so load JSON from local documents
        NSFileManager *fm = [NSFileManager defaultManager];
        
        NSURL *url = [[fm URLsForDirectory: NSDocumentDirectory
                                 inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:JSON_NAME];
        
        data = [NSData dataWithContentsOfURL:url
                                     options:NSDataReadingMappedIfSafe
                                       error:&error];
        if (data == nil) {
            NSLog(@"Error al cargar el JSON de local, lo deberia cargar de la red");
        }
        
    }
    
    NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions
                                                             error:&error];
    
    if (JSONObjects != nil) {
        
        // Creating the model
        LMTLibrary *library = [[LMTLibrary alloc] initWithArray:JSONObjects];
        
        // Detecting type of screen
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            
            // iPad type
            [self configureForPadWithModel:library];
            
        }else{
            // iPhone type
            [self configureForPhoneWithModel:library];
        }
        
        
        
        
    }else{
        NSLog(@"Error al procesar JSON: %@", error.localizedDescription);
    }
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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


#pragma mark - Utils
-(void) configureForPadWithModel:(LMTLibrary *) library {
    
    // Creating the controllers
    LMTLibraryTableViewController *libraryVC = [[LMTLibraryTableViewController alloc] initWithModel:library
                                                                                              style:UITableViewStylePlain];
    
    LMTBookViewController *bookVC = [[LMTBookViewController alloc] initWithModel:[library bookForTag:[library.tags objectAtIndex:1] atIndex:0]];
    
    // Creating the Navigation Controllers
    UINavigationController *libraryNav = [[UINavigationController alloc] initWithRootViewController:libraryVC];
    
    UINavigationController *bookNav = [[UINavigationController alloc] initWithRootViewController:bookVC];
    
    
    // Creating de combinator
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[libraryNav, bookNav];
    
    
    // Delegates
    splitVC.delegate = bookVC;
    libraryVC.delegate = bookVC;
    
    
    // Making rootVC
    self.window.rootViewController = splitVC;
    
}

-(void) configureForPhoneWithModel:(LMTLibrary *) library{
    
    // Creating the controller
    LMTLibraryTableViewController *libraryVC = [[LMTLibraryTableViewController alloc] initWithModel:library
                                                                                              style:UITableViewStylePlain];
    
    // Creating de combinator
    UINavigationController *libraryNav = [[UINavigationController alloc] initWithRootViewController:libraryVC];
    
    
    // Delegate
    libraryVC.delegate = libraryVC;
    
    
    // Making rootVC
    self.window.rootViewController = libraryNav;
}

@end
