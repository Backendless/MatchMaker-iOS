//
//  ViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "LoginViewController.h"
#import "Backendless.h"

@interface LoginViewController ()<UIAlertViewDelegate, UITextFieldDelegate>
{
    UITextField *_field;
}
-(BOOL)checkLoginData;
-(void)getUserGeoPoint:(BackendlessUser *)user;
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
-(void)getUserGeoPoint:(BackendlessUser *)user
{
    BackendlessGeoQuery *query = [BackendlessGeoQuery queryWithCategories:@[@"default"]];
    query.metadata = (NSMutableDictionary *)@{@"email":user.email};
    [backendless.geoService getPoints:query response:^(BackendlessCollection *collection) {
        NSLog(@"%@", collection.data);
    } error:^(Fault *error) {
        NSLog(@"%@", error.detail);
    }];
    
//    [self dismissViewControllerAnimated:YES completion:^{
//    }];
}
-(void)login:(id)sender
{
    if (![self checkLoginData]) {
        return;
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [backendless.userService login:_loginField.text password:_passwordField.text response:^(BackendlessUser *user) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self getUserGeoPoint:user];
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
