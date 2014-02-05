//
//  ViewController.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *loginField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
-(IBAction)login:(id)sender;
-(IBAction)loginWithTwitter:(id)sender;
-(IBAction)loginWithFacebook:(id)sender;
@end
