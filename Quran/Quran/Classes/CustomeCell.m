//
//  CustomeCell.m
//  Quran
//
//  Created by rashid_iMac on 30/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import "CustomeCell.h"

@implementation CustomeCell
@synthesize contentTextView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
