//
//  TextFieldCell.m
//  Rackspace
//
//  Created by Michael Mayo on 9/26/09.
//  Copyright 2009 Rackspace Hosting. All rights reserved.
//

#import "TextFieldCell.h"


@implementation TextFieldCell

@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		// place the text field where the text label belongs	
		CGRect rect = CGRectInset(self.contentView.bounds, 18, 12);
		rect.size.width += 180; // to account for ipad modal width
		rect.origin.x += 23;
				
		self.textField = [[UITextField alloc] initWithFrame:rect];
		self.textField.returnKeyType = UIReturnKeyDone;
		self.textField.adjustsFontSizeToFitWidth = NO;
		self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
		self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
		self.textField.font = [UIFont fontWithName:self.textField.font.fontName size:17.0];
		[self addSubview:self.textField];		
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[textField release];
    [super dealloc];
}


@end
