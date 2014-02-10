//
//  EditInfoViewController.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/6/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditInfoViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *name;
@property (nonatomic, weak) IBOutlet UITextField *date;
@property (nonatomic, weak) IBOutlet UIButton *mButton;
@property (nonatomic, weak) IBOutlet UIButton *fButton;
-(IBAction)selectSex:(id)sender;
-(IBAction)updateInfo:(id)sender;
@end
