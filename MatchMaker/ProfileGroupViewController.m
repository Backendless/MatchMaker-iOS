//
//  ProfileGroupViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/25/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "ProfileGroupViewController.h"
#import "Backendless.h"
#import "AppDelegate.h"

@interface ProfileGroupViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    GeoPoint *_geoPoint;
}
@end

@implementation ProfileGroupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.groupName;
    _geoPoint = [(AppDelegate *)[UIApplication sharedApplication].delegate userGeoPoint];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [(AppDelegate *)[UIApplication sharedApplication].delegate updateGeopoint];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileGroupCell" forIndexPath:indexPath];
    [(UILabel *)[cell viewWithTag:2] setText:_data[indexPath.row]];
    if ([_geoPoint.metadata valueForKey:_data[indexPath.row]])
    {
        [(UIImageView *)[cell viewWithTag:1] setHighlighted:YES];
    }
    else
    {
        [(UIImageView *)[cell viewWithTag:1] setHighlighted:NO];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *data = _data[indexPath.row];
    if ([_geoPoint.metadata valueForKey:data])
    {
        [_geoPoint.metadata removeObjectForKey:data];
    }
    else
    {
        [_geoPoint.metadata setValue:_groupName forKey:data];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

@end
