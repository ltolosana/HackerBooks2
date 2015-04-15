//
//  LMTSimplePDFViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import UIKit;
@import Foundation;

@class LMTBook;

@interface LMTSimplePDFViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) LMTBook *model;

@property (weak, nonatomic) IBOutlet UIWebView *reader;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel:(LMTBook *) model;

@end
