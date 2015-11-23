//
//  ViewController.m
//  FactsApp
//
//  Created by TechnoMac  6 on 23/11/15.
//  Copyright © 2015 TechnoMac  6. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set title for ViewController
    self.title = @"Facts";
    
    arrJsonList = [[NSMutableArray alloc]init];
    
    //add MBProgress Hud Activity Indicator in View
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    //Get Json data method
    [self GetJsonData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Get Json Url Response method
-(void)GetJsonData
{
    // Create object for AFHTTPRequest operstion manager use for Parse Json Url
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://guarded-basin-2383.herokuapp.com/facts.json"] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        // Sucess Block
        
        //store all rows for arrJsonlist from responseobject for json response
        arrJsonList = responseObject[@"rows"];
        
        // reload TableView
        [self.tableView reloadData];
        
        // Hide Mbprogress Hud When Get Response
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        // Error Block
        
        // Mbprogress Hud Hide when Get error
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    }];
}

#pragma mark - Delegate and Datasource method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrJsonList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create Custom Cell Object with Reuse Identfier 'cell'
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // set Label text title and Discription
    NSString *strTitle = [NSString stringWithFormat:@"%@",arrJsonList[indexPath.row][@"title"]];
    if (![strTitle isEqual:@"<null>"]) {
        
        cell.lblTitle.text = strTitle;
    }
    
    NSString *strDesc = [NSString stringWithFormat:@"%@",arrJsonList[indexPath.row][@"description"]];
    if (![strDesc isEqual:@"<null>"]) {
        
        cell.lblDesc.text = strDesc;
    }
    
    // set Image lazy Load
    
    NSString *strurl = [NSString stringWithFormat:@"%@",arrJsonList[indexPath.row][@"imageHref"]];
    
    [cell.imgFacts setImageWithURL:[NSURL URLWithString:strurl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
