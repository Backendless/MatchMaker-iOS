//
//  RegistrateViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "RegistrateViewController.h"
#import "Backendless.h"

@interface RegistrateViewController ()
-(BOOL)checkRegistrationData;
@end

@implementation RegistrateViewController

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
    [[self navigationController] setNavigationBarHidden:NO];
	// Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)checkRegistrationData
{
    return YES;
}

-(void)registrate:(id)sender
{
    if (![self checkRegistrationData]) {
        return;
    }
    BackendlessUser *user = [[BackendlessUser alloc] init];
    user.email = _email.text;
    user.password = _password.text;
    user.name = _name.text;
//    [user setProperties:@{@"gender":@"", @"birthdate":@""}];
    [backendless.userService registering:user response:^(BackendlessUser *user) {
        
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
    }];
}
@end
