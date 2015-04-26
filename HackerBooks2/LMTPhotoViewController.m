//
//  LMTPhotoViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 26/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTPhotoViewController.h"
#import "LMTPhoto.h"

@interface LMTPhotoViewController ()

@end

@implementation LMTPhotoViewController

#pragma mark - Init
-(id) initWithModel:(LMTPhoto *)model{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Sync model --> view
    self.photoView.image = self.model.image;
    
    
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //Sync view --> model
    self.model.image = self.photoView.image;
    
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
    
    // Creamos el picker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.delegate = self;
    
    //Lo mostramos de forma modal
    
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         
                     }];
}

#pragma mark - UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.model.image = img;
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
    
}



@end
