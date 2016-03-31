//
//  ViewController.m
//  ConnectHelp-ObjC
//
//  Created by Matthew Lewin on 3/14/16.
//  Copyright © 2016 Boomtown. All rights reserved.
//

#import "ViewController.h"

NSString *apiToken   	= @"__API_TOKEN__";
NSString *apiSecret   	= @"__API_SECRET_KEY__";

NSString *memberID          = @"__MEMBERS_ID__";
NSString *memberUserID     	= @"__MEMBERS_USERS_ID__";
NSString *memberLocationID 	= @"__MEMBERS_LOCATIONS_ID__";

@interface ViewController () <BTConnectHelpButtonDelegate>

@property (weak, nonatomic) IBOutlet BTConnectHelpButton    *storyboardHelpButton;
@property (weak, nonatomic) IBOutlet UIView                 *subview;

@property (strong, nonatomic)	BTConnectHelpButton *programmaticHelpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Boomtown Sample App";
    
    [self.storyboardHelpButton setCredentialsWithToken:apiToken secret:apiSecret];

    self.storyboardHelpButton.delegate = self;

    self.storyboardHelpButton.memberID         	= memberID;
	self.storyboardHelpButton.memberUserID      = memberUserID;
    self.storyboardHelpButton.memberLocationID  = memberLocationID;
	
    self.storyboardHelpButton.supportWebsiteURL   = @"http://example.com";
    self.storyboardHelpButton.supportEmailAddress = @"support@example.com";
    self.storyboardHelpButton.supportPhoneNumber  = @"1-888-555-2368";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.programmaticHelpButton = [[BTConnectHelpButton alloc] initWithFrame:self.subview.frame];
    self.programmaticHelpButton.delegate = self;
    
    self.programmaticHelpButton.memberID           	= memberID;
	self.programmaticHelpButton.memberUserID      	= memberUserID;
    self.programmaticHelpButton.memberLocationID 	= memberLocationID;
	
    self.programmaticHelpButton.supportWebsiteURL 	= @"http://example.com";
    self.programmaticHelpButton.supportEmailAddress = @"support@example.com";
    self.programmaticHelpButton.supportPhoneNumber 	= @"1-888-555-2368";
    [self.programmaticHelpButton setCredentialsWithToken:apiToken secret:apiSecret];
    [self.view addSubview:self.programmaticHelpButton];
}


#pragma mark - Help button delegates

- (void) helpButton:(nonnull id)helpButton  displayHelpActionSheet:(nonnull UIAlertController *)alertController
{
	[self.navigationController presentViewController:alertController animated:YES completion:nil];
}


- (void) helpButton:(id)helpButton displayIssueViewController:(UIViewController *)viewController
{
	[self.navigationController pushViewController:viewController animated:YES];
}


- (void) helpButton:(id)helpButton alertWithMessage:(NSString *)message
{
	NSLog(@"%@", message);
}


- (void) helpButton:(nonnull id)helpButton authorizationFailedWithStatus:(nonnull NSNumber *)status message:(nonnull NSString *)message
{
	NSLog(@"%@", message);
}


@end
