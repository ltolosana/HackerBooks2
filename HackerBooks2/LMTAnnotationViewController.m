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
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateView.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.annotationView.text = self.model.text;
    self.photoView.image = [UIImage imageWithData:self.model.image.photoData];
    
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
@end
