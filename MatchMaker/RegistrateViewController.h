//
//  RegistrateViewController.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrateViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *name;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *password2;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UIButton *birthButton;
@property (nonatomic, weak) IBOutlet UIButton *mButton;
@property (nonatomic, weak) IBOutlet UIButton *fButton;
-(IBAction)registrate:(id)sender;
-(IBAction)selectSex:(id)sender;
@end
