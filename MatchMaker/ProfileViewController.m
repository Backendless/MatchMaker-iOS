//
//  ProfileViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/5/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "ProfileViewController.h"
#import "Backendless.h"

@interface ProfileViewController ()
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
@end
