//
//  EditInfoViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/6/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "EditInfoViewController.h"
#import "Backendless.h"

@interface EditInfoViewController ()<UITextFieldDelegate>
-(BOOL)checkUserData;
@end

@implementation EditInfoViewController

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
    _name.text = backendless.userService.currentUser.name;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)checkUserData
{
    return YES;
}
-(void)updateInfo:(id)sender
{
    if (![self checkUserData]) {
        return;
    }
    BackendlessUser *user = backendless.userService.currentUser;
    user.name = _name.text;

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [backendless.userService update:user response:^(BackendlessUser *user) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.navigationController popViewControllerAnimated:YES];
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
