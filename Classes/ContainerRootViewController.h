//
//  ContainerRootViewController.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 2/10/10.
//  Copyright Rackspace Hosting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RackspaceCloudSplitViewDelegate.h"

@class ASICloudFilesContainer, ASICloudFilesFolder;

@interface ContainerRootViewController : RackspaceCloudSplitViewDelegate <UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate, UISplitViewControllerDelegate, UIDocumentInteractionControllerDelegate> {
    
    UINavigationController *navigationController;
    
	ASICloudFilesContainer *container;
    ASICloudFilesFolder *rootFolder;
	IBOutlet UITableView *tableView;
		
	IBOutlet UIView *noFilesView;
	IBOutlet UIImageView *noFilesImage;
	IBOutlet UILabel *noFilesTitle;
	IBOutlet UILabel *noFilesMessage;
	
}

@property (nonatomic, retain) ASICloudFilesContainer *container;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, retain) IBOutlet UIView *noFilesView;
@property (nonatomic, retain) IBOutlet UIImageView *noFilesImage;
@property (nonatomic, retain) IBOutlet UILabel *noFilesTitle;
@property (nonatomic, retain) IBOutlet UILabel *noFilesMessage;

@property (nonatomic, retain) UINavigationController *navigationController;

-(id)initWithNoContainersView;

@end
