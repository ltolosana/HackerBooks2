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
#import "LMTPDF.h"
#import "LMTAnnotationsViewController.h"
#import "LMTAnnotation.h"

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

#pragma mark - Actions

- (IBAction)viewAnnotations:(id)sender {
    
    //Averiguamos el libro
    LMTBook *book = self.model;
    
   //Creamos el controlador de anotaciones
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[LMTAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LMTAnnotationAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"book = %@", book];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.model.managedObjectContext
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    

   
    LMTAnnotationsViewController *annotationsVC = [[LMTAnnotationsViewController alloc] initWithFetchedResultsController:fc
                                                                                                                   style:UITableViewStylePlain book:book];
    
    
     //Hacemos push
    
    [self.navigationController pushViewController:annotationsVC
                                         animated:YES];
    
    
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
    
    if (self.model.pdf.pdfData != nil) {
        // El fichero existe, asi que lo cargamos
        [self.reader loadData:self.model.pdf.pdfData
                     MIMEType:@"application/pdf"
             textEncodingName:@"UTF-8"
                      baseURL:nil];
        
    }else{
        // There is no local pdf, so load from internet
        [self downloadPDF];
        
    }    
}

#pragma mark - Utils
-(void) downloadPDF{
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0),
                   ^{
                       self.model.pdf.pdfData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.pdf.pdfURL]];
                       
                       dispatch_async(dispatch_get_main_queue(), ^{
                           // Lo hago en primer plano para asegurarme de
                           // todas las ntificaciones van en la ocla
                           // principal
                           [self.reader loadData:self.model.pdf.pdfData
                                        MIMEType:@"application/pdf"
                                textEncodingName:@"UTF-8"
                                         baseURL:nil];

                       });
                   });

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
