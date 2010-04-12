//
//  SetPasswordLockViewController.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingsViewController;

@interface SetPasswordLockViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSUserDefaults *defaults;
    NSString *initialLockPassword;
    
    UITextField *oldPasswordTextField;
    UITextField *newPasswordTextField;
    UITextField *confirmPasswordTextField;
    
    SettingsViewController *settingsViewController;
}

@property (nonatomic, retain) UITextField *oldPasswordTextField;
@property (nonatomic, retain) UITextField *newPasswordTextField;
@property (nonatomic, retain) UITextField *confirmPasswordTextField;
@property (nonatomic, retain) SettingsViewController *settingsViewController;

-(void)cancelButtonPressed:(id)sender;
-(void)saveButtonPressed:(id)sender;

@end
