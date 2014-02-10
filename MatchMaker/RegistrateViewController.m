//
//  RegistrateViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "RegistrateViewController.h"
#import "Backendless.h"
#import "AppDelegate.h"
#import "NSString+Date.h"

@interface RegistrateViewController ()<UITextFieldDelegate>
{
    NSString *gender;
    NSDate *birth;
}
-(void)changeDate:(UIDatePicker *)sender;
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
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [[self navigationController] setNavigationBarHidden:NO];
    [_date setInputView:datePicker];
    birth = [NSDate date];
    gender = @"male";
    _mButton.selected = YES;
    [_birthButton.layer setCornerRadius:5];
    [_birthButton.layer setBorderColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.6].CGColor];
    [_birthButton.layer setBorderWidth:0.5];
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
-(void)changeDate:(UIDatePicker *)sender
{
    birth = sender.date;
    _date.text = [NSString stringWithDateFormat:@"dd.MM.yyyy" date:birth];
    [_date resignFirstResponder];
}
-(void)selectSex:(UIButton *)sender
{
    sender.selected = YES;
    if (sender == _mButton) {
        gender = @"male";
        _fButton.selected = NO;
    }
    else
    {
        gender = @"female";
        _mButton.selected = NO;
    }
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
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [user setProperties:@{@"gender":gender, @"birthdate":birth}];
    [backendless.userService registering:user response:^(BackendlessUser *user) {
        NSLog(@"registr");
        [self.navigationController popViewControllerAnimated:YES];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}
//textfield
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
