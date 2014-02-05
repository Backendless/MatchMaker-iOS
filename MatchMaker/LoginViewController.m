//
//  ViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "LoginViewController.h"
#import "Backendless.h"

@interface LoginViewController ()<UIAlertViewDelegate>
{
    UITextField *_field;
}
-(BOOL)checkLoginData;
@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)checkLoginData
{
    if (_loginField.text.length == 0) {
        _field = _loginField;
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Empty Login" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        return NO;
    }
    else if (_passwordField.text.length == 0) {
        _field = _passwordField;
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Empty Password" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        return NO;
    }
    return YES;
}

-(void)login:(id)sender
{
    if (![self checkLoginData]) {
        return;
    }
    [backendless.userService login:_loginField.text password:_passwordField.text response:^(BackendlessUser *user) {
        NSLog(@"logined");
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
    }];
}
-(void)loginWithFacebook:(id)sender
{
    
}
-(void)loginWithTwitter:(id)sender
{
    
}
//aler
-(void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"cancel");
}
@end
