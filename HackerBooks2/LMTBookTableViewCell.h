//
//  LMTBookTableViewCell.h
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 5/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMTBookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookIcon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *authors;

+(NSString *) cellId;
@end
