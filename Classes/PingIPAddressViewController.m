    //
//  PingIPAddressViewController.m
//  RackspaceCloud
//
//  Created by Michael Mayo on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PingIPAddressViewController.h"


@implementation PingIPAddressViewController

@synthesize webView;

- (void)loadPingSite {
    NSString *urlString = [NSString stringWithFormat:@"http://just-ping.com/index.php?vh=%@&s=ping", ipAddress];
    NSURL *url = [NSURL URLWithString:urlString];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)refreshButtonPressed:(id)sender {
    [self loadPingSite];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil ipAddress:(NSString *)anIPAddress {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
        ipAddress = anIPAddress;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPingSite];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [webView release];
    [super dealloc];
}


@end
