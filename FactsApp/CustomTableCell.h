//
//  CustomTableCell.h
//  FactsApp
//
//  Created by TechnoMac  6 on 23/11/15.
//  Copyright © 2015 TechnoMac  6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    
}

// Label for Title in TableView cell
@property (nonatomic ,retain) IBOutlet UILabel *lblTitle;

// Label for Description in tableview cell
@property (nonatomic ,retain) IBOutlet UILabel *lblDesc;

// ImageView for Facts Image in tableview cell
@property (nonatomic ,retain) IBOutlet UIImageView *imgFacts;

@end
