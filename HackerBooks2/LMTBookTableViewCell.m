//
//  LMTBookTableViewCell.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 5/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBookTableViewCell.h"

@implementation LMTBookTableViewCell

+(NSString *) cellId{
    return NSStringFromClass (self);
}

- (void)awakeFromNib {
    // Initialization code
}

-(void)prepareForReuse{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
