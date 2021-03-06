//
//  ManageBackupSchedulesViewController.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 2/9/10.
//  Copyright Rackspace Hosting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ServerDetailViewController;

@interface ManageBackupSchedulesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	ServerDetailViewController *serverDetailViewController;
	NSDictionary *hours;
	NSDictionary *days;
	NSArray *hourKeys;
	NSArray *hourValues;
	NSArray *dayKeys;
	NSArray *dayValues;
	
	IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) ServerDetailViewController *serverDetailViewController;
@property (nonatomic, retain) IBOutlet UITableView *tableView;


-(void)cancelButtonPressed:(id)sender;
-(void)saveButtonPressed:(id)sender;

@end
