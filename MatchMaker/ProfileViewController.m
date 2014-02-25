//
//  ProfileViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/5/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "ProfileViewController.h"
#import "Backendless.h"
#import "ProfileObject.h"
#import "ProfileGroupViewController.h"

@interface ProfileViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    ProfileObject *_profile;
}
-(void)showLoginViewController:(BOOL)anim;

@end

@implementation ProfileViewController

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
    _profile = [ProfileObject new];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    _name.text = backendless.userService.currentUser.name;
}
-(void)viewDidAppear:(BOOL)animated
{
    if (!backendless.userService.currentUser) {
        [self showLoginViewController:NO];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showLoginViewController:(BOOL)anim
{
    UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthBranch"];
    [self presentViewController:VC animated:anim completion:^{
    }];
}
-(void)logout:(id)sender
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [backendless.userService logout:^(id result) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self showLoginViewController:YES];
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell" forIndexPath:indexPath];
    cell.textLabel.text = [_profile getGroupNameForIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ProfileGroup"]) {
        NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
        ProfileGroupViewController *VC = (ProfileGroupViewController *)segue.destinationViewController;
        VC.groupName = [_profile getGroupNameForIndex:indexPath.row];
        VC.data = [_profile getGroupValuesForIndex:indexPath.row];
    }
}
@end
