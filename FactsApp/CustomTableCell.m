//
//  CustomTableCell.m
//  FactsApp
//
//  Created by TechnoMac  6 on 23/11/15.
//  Copyright © 2015 TechnoMac  6. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

@synthesize lblTitle,lblDesc;

@synthesize imgFacts;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
