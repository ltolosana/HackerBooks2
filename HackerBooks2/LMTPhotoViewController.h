//
//  LMTPhotoViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 26/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import UIKit;

@class LMTPhoto;

@interface LMTPhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) LMTPhoto *model;

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(id) initWithModel:(LMTPhoto *) model;

- (IBAction)takePhoto:(id)sender;

@end
