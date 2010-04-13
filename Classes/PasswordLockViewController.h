//
//  PasswordLockViewController.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface PasswordLockViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    SEL callback;
    MasterViewController *masterViewController;
    UITextField *textField;
}

@property (nonatomic) SEL callback;
@property (nonatomic, retain) MasterViewController *masterViewController;

-(void)cancelButtonPressed:(id)sender;
-(void)loginButtonPressed:(id)sender;

@end
