//
//  ASICloudServersImageRequest.h
//  RackspaceCloud
//
//  Created by Michael Mayo on 2/8/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ASICloudFilesRequest.h"

@class ASICloudServersImageXMLParserDelegate, ASICloudServersImage;

@interface ASICloudServersImageRequest : ASICloudFilesRequest {
	ASICloudServersImageXMLParserDelegate *xmlParserDelegate;
}

@property (retain) ASICloudServersImageXMLParserDelegate *xmlParserDelegate;

+ (NSArray *)images;
+ (void)setImages:(NSArray *)newImages;
+ (ASICloudServersImage *)imageForId:(NSUInteger)imageId;

// GET /images/detail.xml
+ (id)listRequest;
- (NSArray *)images;
// TODO: limit and offset

@end