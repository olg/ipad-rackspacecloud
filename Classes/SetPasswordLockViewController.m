//
//  SetPasswordLockViewController.m
//  RackspaceCloud
//
//  Created by Michael Mayo on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SetPasswordLockViewController.h"
#import "TextFieldCell.h"
#import "UIViewController+SpinnerView.h"
#import "SettingsViewController.h"


@implementation SetPasswordLockViewController

@synthesize oldPasswordTextField, newPasswordTextField, confirmPasswordTextField;
@synthesize settingsViewController;

#pragma mark -
#pragma mark Utilities

-(BOOL)alreadyHasPassword {
    return (initialLockPassword != nil) && ![initialLockPassword isEqualToString:@""];
}

#pragma mark -
#pragma mark Button Handlers

-(void)cancelButtonPressed:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

-(void)saveButtonPressed:(id)sender {
    
    NSLog(@"new password: %@", newPasswordTextField.text);
    NSLog(@"confirm password: %@", confirmPasswordTextField.text);
    
    // validate
    if ([self alreadyHasPassword]) {
        if ([initialLockPassword isEqualToString:oldPasswordTextField.text]) {
            if ([newPasswordTextField.text isEqualToString:confirmPasswordTextField.text]) {
                // we're all good
                [defaults setObject:newPasswordTextField.text forKey:@"lock_password"];
                [defaults synchronize];
                [self dismissModalViewControllerAnimated:YES];
                [self.settingsViewController.tableView reloadData];
            } else {
                [self alert:@"Error" message:@"The password and confirmation do not match."];
            }
        } else {
            [self alert:@"Error" message:@"Your old password is not correct.  Please try again."];
        }
    } else {
        if ([newPasswordTextField.text isEqualToString:@""]) {
            [self alert:@"Error" message:@"Please enter a password."];
        } else if ([oldPasswordTextField.text isEqualToString:@""]) {
            [self alert:@"Error" message:@"Please confirm your password."];
        } else if ([newPasswordTextField.text isEqualToString:confirmPasswordTextField.text]) {
            // we're all good
            [defaults setObject:newPasswordTextField.text forKey:@"lock_password"];
            [defaults synchronize];
            [self dismissModalViewControllerAnimated:YES];
            [self.settingsViewController.tableView reloadData];
        } else {
            [self alert:@"Error" message:@"The password and confirmation do not match."];
        }
    }    
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    defaults = [NSUserDefaults standardUserDefaults];
    initialLockPassword = [defaults stringForKey:@"lock_password"];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if ([self alreadyHasPassword]) {
        return 3;
    } else {
        return 2;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([self alreadyHasPassword]) {
        if (section == 0) {
            return @"Old Password";
        } else if (section == 1) {
            return @"New Password";
        } else {
            return @"Confirm New Password";
        }
    } else {
        if (section == 0) {
            return @"Password";
        } else {
            return @"New Password";
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if ([self alreadyHasPassword]) {
        if (section == 2) {
            return @"If the password lock is turned on, you will be prompted to enter the password before you are allowed to view your Cloud Servers or Cloud Files containers.";
        } else {
            return @"";
        }
    } else {
        if (section == 1) {
            return @"If the password lock is turned on, you will be prompted to enter the password before you are allowed to view your Cloud Servers or Cloud Files containers.";
        } else {
            return @"";
        }
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TextFieldCell *cell;
    
    // TODO: DRY this up a bit
    // Configure the cell...
    if ([self alreadyHasPassword]) {
        if (indexPath.section == 0) {
            static NSString *CellIdentifier = @"Cell";
            cell = (TextFieldCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                cell.textField.secureTextEntry = YES;
                oldPasswordTextField = cell.textField;
            }
        } else if (indexPath.section == 1) {
            static NSString *CellIdentifier = @"NewCell";
            cell = (TextFieldCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                cell.textField.secureTextEntry = YES;
                newPasswordTextField = cell.textField;
            }
        } else {
            static NSString *CellIdentifier = @"ConfirmCell";
            cell = (TextFieldCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                cell.textField.secureTextEntry = YES;
                confirmPasswordTextField = cell.textField;
            }
        }
    } else {
        if (indexPath.section == 0) {
            static NSString *CellIdentifier = @"NewCell";
            cell = (TextFieldCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                cell.textField.secureTextEntry = YES;
                newPasswordTextField = cell.textField;
            }
        } else {
            static NSString *CellIdentifier = @"ConfirmCell";
            cell = (TextFieldCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                cell.textField.secureTextEntry = YES;
                confirmPasswordTextField = cell.textField;
            }
        }
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [oldPasswordTextField release];
    [newPasswordTextField release];
    [confirmPasswordTextField release];
    [settingsViewController release];
    [super dealloc];
}


@end

