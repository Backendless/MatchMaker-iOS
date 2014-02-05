//
//  ProfileViewController.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/5/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *name;
-(IBAction)logout:(id)sender;
@end
