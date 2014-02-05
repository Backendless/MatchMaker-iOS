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
-(IBAction)updateInfo:(id)sender;
@end
