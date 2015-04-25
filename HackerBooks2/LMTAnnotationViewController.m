//
//  LMTAnnotationViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTAnnotationViewController.h"

#import "LMTAnnotation.h"
#import "LMTPhoto.h"

@interface LMTAnnotationViewController ()

@property (nonatomic) CGRect textViewFrame;

@end

@implementation LMTAnnotationViewController

#pragma mark - Init
-(id) initWithModel:(LMTAnnotation *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Delegate
    self.annotationView.delegate = self;
    
    //Alta en notificaciones de teclado
    [self setupKeyboardNotifications];
    
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateView.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.annotationView.text = self.model.text;
    self.photoView.image = [UIImage imageWithData:self.model.image.photoData];
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //Baja en notificaciones de teclado
    [self tearDownKeyboardNotifications];
    
    self.model.text = self.annotationView.text;
    self.model.image.photoData = UIImageJPEGRepresentation(self.photoView.image, 1);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions
- (IBAction)takePhoto:(id)sender {
}

-(IBAction)hideKeyboard:(id)sender{
    
    [self.view endEditing:YES];
}

#pragma mark - UITextViewDelegate


-(void) textViewDidBeginEditing:(UITextView *)textView{
    
}

-(void) setupKeyboardNotifications{
    
    //Alta en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
}

-(void) tearDownKeyboardNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}


//UIKeyboardWillShowNotification
-(void) notifyThatKeyboardWillAppear:(NSNotification *) n{
    
    //Duracion de la animacion del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Sacar los bounds del teclado
    
    NSValue *wrappedFrame = [n.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame = [wrappedFrame CGRectValue];
    
    // Calcular nuevos bounds de textView(encogerlo)
    
    self.textViewFrame = self.annotationView.frame;
    CGRect newRect = CGRectMake(self.textViewFrame.origin.x,
                                self.textViewFrame.origin.y,
                                self.textViewFrame.size.width,
                                self.textViewFrame.size.height - keyboardFrame.size.height + self.bottomBar.frame.size.height);
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.annotationView.frame = newRect;
                     }];
    
    
}

//UIKeyboardWillHideNotification
-(void) notifyThatKeyboardWillDisappear:(NSNotification *) n{
    
    //Duracion de la animacion del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // DEvolver los bounds originales

    [UIView animateWithDuration:duration
                     animations:^{

                         self.annotationView.frame = CGRectMake(self.textViewFrame.origin.x,
                                                                self.textViewFrame.origin.y,
                                                                self.textViewFrame.size.width,
                                                                self.textViewFrame.size.height);
                     }];
    
}

@end
