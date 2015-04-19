//
//  LMTBookViewController.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//



@import UIKit;

@class LMTBook;
#import "LMTBooksTableViewController.h"


@interface LMTBookViewController : UIViewController<UISplitViewControllerDelegate, LMTBooksTableViewControllerDelegate>

@property (strong, nonatomic) LMTBook *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *isFavoriteSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(id) initWithModel:(LMTBook *) model;

-(IBAction)displayPDF:(id)sender;
-(IBAction)changeToFavorite:(id)sender;

@end
