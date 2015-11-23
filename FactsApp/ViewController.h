//
//  ViewController.h
//  FactsApp
//
//  Created by TechnoMac  6 on 23/11/15.
//  Copyright © 2015 TechnoMac  6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "CustomTableCell.h"

@interface ViewController : UITableViewController

{
    // mutable array for store url json parse data
    NSMutableArray *arrJsonList;
}

@end

