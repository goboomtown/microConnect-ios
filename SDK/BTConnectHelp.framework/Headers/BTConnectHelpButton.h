//
//  BTConnectHelpButton.h
//  BTConnectHelp
//
//  Created by Larry Borsato on 2016-03-08.
//  Copyright © 2016 Boomtown. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BTConnectHelpButton : UIView

@property (strong, nonatomic)	id			delegate;
@property (strong, nonatomic)	NSString	*supportWebsiteUrl;
@property (strong, nonatomic)	NSString	*supportEmailAddress;
@property (strong, nonatomic)	NSString	*supportPhoneNumber;
@property (strong, nonatomic)	NSString	*membersId;
@property (strong, nonatomic)	NSString	*membersUsersId;
@property (strong, nonatomic)	NSString	*membersLocationsId;


- (void)setCredentialsWithToken:(const NSString *)token secret:(const NSString *)secret;

@end
