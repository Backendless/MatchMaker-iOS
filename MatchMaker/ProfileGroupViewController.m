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
    cell.textLabel.text = _data[indexPath.row];
    if ([_geoPoint.metadata valueForKey:_data[indexPath.row]])
    {
        NSLog(@"%@", _data[indexPath.row]);
    }
    return cell;
}

@end
