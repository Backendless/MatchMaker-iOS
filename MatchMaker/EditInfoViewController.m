//
//  EditInfoViewController.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/6/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "EditInfoViewController.h"
#import "Backendless.h"
#import "NSString+Date.h"

@interface EditInfoViewController ()<UITextFieldDelegate>
{
    NSString *gender;
    NSDate *birth;
}
-(BOOL)checkUserData;
-(void)changeDate:(UIDatePicker *)sender;
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
    birth = [NSDate date];
    gender = @"male";
    _mButton.selected = YES;
    _name.text = backendless.userService.currentUser.name;
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [_date setInputView:datePicker];
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
-(void)changeDate:(UIDatePicker *)sender
{
    birth = sender.date;
    _date.text = [NSString stringWithDateFormat:@"dd.MM.yyyy" date:birth];
    [_date resignFirstResponder];
}
-(void)updateInfo:(id)sender
{
    if (![self checkUserData]) {
        return;
    }
    BackendlessUser *user = backendless.userService.currentUser;
    user.name = _name.text;
    [user setProperties:@{@"gender":gender, @"birthdate":birth}];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [backendless.userService update:user response:^(BackendlessUser *user) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.navigationController popViewControllerAnimated:YES];
    } error:^(Fault *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.detail delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
