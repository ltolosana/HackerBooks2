//
//  LMTSimplePDFViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTSimplePDFViewController.h"
#import "LMTBook.h"
#import "LMTLibraryTableViewController.h"

@interface LMTSimplePDFViewController ()

@end

@implementation LMTSimplePDFViewController

#pragma mark - Init
-(id) initWithModel:(LMTBook *) model{
    
    if (self= [super initWithNibName:nil
                              bundle:nil]) {
        _model = model;
        self.title = model.title;
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Register notification
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatBookDidChange:)
               name:BOOK_DID_CHANGE_NOTIFICATION_NAME
             object:nil];
   
    // Delegates
    self.reader.delegate = self;
    
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];

    
    // Sync model & View
    
    [self syncModelAndView];

}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // Unregister notification
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
    
}


#pragma mark - Notifications
// BOOK_DID_CHANGE_NOTIFICATION_NAME
-(void)notifyThatBookDidChange:(NSNotification *) notification{
    
    // Obtain new book
    LMTBook *book = [notification.userInfo objectForKey:BOOK_KEY];
    
    // Update the model
    self.model = book;
    
    // Return to principal view
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}

#pragma mark - syncModelAndView
-(void) syncModelAndView{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *localpdfURL = [[fm URLsForDirectory:NSDocumentDirectory
                                     inDomains:NSUserDomainMask] lastObject];
    localpdfURL = [localpdfURL URLByAppendingPathComponent:[self.model.title stringByAppendingPathExtension:@"pdf"]];
    
    NSError *error;
    NSData *data = nil;
    
    // Try to load pdf locally
    data = [NSData dataWithContentsOfURL:localpdfURL
                                 options:NSDataReadingMappedIfSafe
                                   error:&error];
    if (data == nil) {
        // There is no local pdf, so load from internet
        
        data = [NSData dataWithContentsOfURL:self.model.pdfURL
                                     options:NSDataReadingMappedIfSafe
                                       error:&error];
        if (data != nil) {
            // save the pdf into local document directory
            BOOL rc = [data writeToURL:localpdfURL
                               options:NSDataWritingAtomic
                                 error:&error];
            if (rc == NO) {
                NSLog(@"Error al guardar el pdf en local: %@", error.localizedDescription);
            }
            
        }else{
            // Inform the user that there is no book available
            NSLog(@"Error, no existe el libro '%@' solicitado", self.model.title);
            [[[UIAlertView alloc] initWithTitle:@"Libro no encontrado"
                                        message:@"Sorry, no existe el libro solicitado."
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
            [self.navigationController popViewControllerAnimated:NO];
            
        }
    }
    
    // Show the book, no matter if local or remote
    [self.reader loadData:data
                 MIMEType:@"application/pdf"
         textEncodingName:@"UTF-8"
                  baseURL:nil];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
