//
//  PingIPAddressViewController.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CloudServersActionViewController.h"


@interface PingIPAddressViewController : CloudServersActionViewController {
    IBOutlet UIWebView *webView;
    NSString *ipAddress;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil ipAddress:(NSString *)anIPAddress;
- (void)refreshButtonPressed:(id)sender;

@end
