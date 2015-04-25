//
//  LMTAnnotationViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMTAnnotation;
@class LMTPhoto;

@interface LMTAnnotationViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creationDateView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *annotationView;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomBar;

@property (nonatomic, strong) LMTAnnotation *model;

-(id) initWithModel:(LMTAnnotation *) model;

- (IBAction)takePhoto:(id)sender;
-(IBAction)hideKeyboard:(id)sender;


@end
